package com.food.diary.sync;

import android.app.Activity;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.nio.charset.StandardCharsets;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

public class ModernBackupActivity extends Activity {
    private static final int REQ_IMPORT_CSV = 0xC501;
    private static final int REQ_EXPORT_CSV = 0xC502;
    private static final int ARRAY_CSV_HEADERS = 0x7f030000;
    private static final int ARRAY_DRINK_TYPES = 0x7f030003;
    private static final int ARRAY_FOOD_TYPES = 0x7f030004;
    private static final int ARRAY_EVENT_TYPES = 0x7f030005;

    private TextView status;
    private Button syncNow;
    private boolean importedAnything;

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        setTitle("Backup & Sync");
        buildUi();
    }

    @Override
    protected void onResume() {
        super.onResume();
        refreshStatus();
    }

    private int dp(int value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }

    private TextView text(String value, float sp) {
        TextView view = new TextView(this);
        view.setText(value);
        view.setTextSize(sp);
        view.setPadding(0, dp(5), 0, dp(5));
        return view;
    }

    private Button button(String value) {
        Button button = new Button(this);
        button.setText(value);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        lp.setMargins(0, dp(6), 0, dp(6));
        button.setLayoutParams(lp);
        return button;
    }

    private void buildUi() {
        ScrollView scroll = new ScrollView(this);
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(dp(20), dp(18), dp(20), dp(24));
        scroll.addView(root);

        TextView title = text("Backup & Sync", 24);
        title.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        root.addView(title);

        String intro = "This Bl0ck154 build keeps its own local database. ";
        if (isPackageInstalled("com.food.diary")) {
            intro += "The original Food Diary is installed, but Android does not allow another signed app to read its private database directly. Use the original app's CSV Share/Export once, then import that CSV here.";
        } else {
            intro += "To migrate an older Food Diary installation, import a CSV exported by it.";
        }
        TextView help = text(intro, 14);
        help.setPadding(0, dp(4), 0, dp(14));
        root.addView(help);

        TextView migrateHeader = text("Move old history", 18);
        migrateHeader.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        root.addView(migrateHeader);

        Button importCsv = button("Import old Food Diary CSV");
        importCsv.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) { launchImportCsv(); }
        });
        root.addView(importCsv);

        Button exportCsv = button("Export all records as CSV");
        exportCsv.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) { launchExportCsv(); }
        });
        root.addView(exportCsv);

        TextView syncHeader = text("Google Drive sync", 18);
        syncHeader.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        syncHeader.setPadding(0, dp(18), 0, dp(4));
        root.addView(syncHeader);

        status = text("", 14);
        root.addView(status);

        Button chooseSync = button("Choose / change sync file");
        chooseSync.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) { DiarySyncManager.launchPicker(ModernBackupActivity.this); }
        });
        root.addView(chooseSync);

        syncNow = button("Sync now");
        syncNow.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) {
                if (!DiarySyncManager.isConfigured(ModernBackupActivity.this)) {
                    DiarySyncManager.launchPicker(ModernBackupActivity.this);
                    return;
                }
                syncNow.setEnabled(false);
                new Thread(new Runnable() {
                    @Override public void run() {
                        final boolean ok = DiarySyncManager.exportNow(ModernBackupActivity.this);
                        runOnUiThread(new Runnable() {
                            @Override public void run() {
                                syncNow.setEnabled(true);
                                refreshStatus();
                                Toast.makeText(ModernBackupActivity.this,
                                        ok ? "Synced" : "Sync failed", Toast.LENGTH_LONG).show();
                            }
                        });
                    }
                }, "FoodDiaryManualSync").start();
            }
        });
        root.addView(syncNow);

        TextView note = text("The JSON sync file is updated automatically after record changes. The local Events.db remains the source of truth.", 13);
        note.setPadding(0, dp(8), 0, dp(14));
        root.addView(note);

        Button back = button("Back");
        back.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) { finishWithResult(); }
        });
        root.addView(back);

        setContentView(scroll);
        refreshStatus();
    }

    private boolean isPackageInstalled(String packageName) {
        try {
            getPackageManager().getPackageInfo(packageName, 0);
            return true;
        } catch (PackageManager.NameNotFoundException e) {
            return false;
        }
    }

    private void refreshStatus() {
        if (status == null) return;
        if (!DiarySyncManager.isConfigured(this)) {
            status.setText("Not connected. Choose a JSON file in Google Drive once; future changes will update it automatically.");
            if (syncNow != null) syncNow.setText("Choose sync file");
            return;
        }
        long last = DiarySyncManager.getLastSyncMs(this);
        String error = DiarySyncManager.getLastError(this);
        StringBuilder message = new StringBuilder("Connected");
        if (last > 0) {
            message.append("\nLast sync: ").append(DateFormat.getDateTimeInstance().format(new Date(last)));
        }
        if (error != null && error.length() > 0) {
            message.append("\nLast error: ").append(error);
        }
        status.setText(message.toString());
        if (syncNow != null) syncNow.setText("Sync now");
    }

    private void launchImportCsv() {
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("text/*");
        intent.putExtra(Intent.EXTRA_MIME_TYPES, new String[]{"text/csv", "text/comma-separated-values", "text/plain", "application/csv"});
        startActivityForResult(intent, REQ_IMPORT_CSV);
    }

    private void launchExportCsv() {
        Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("text/csv");
        intent.putExtra(Intent.EXTRA_TITLE, "FoodDiary-export.csv");
        startActivityForResult(intent, REQ_EXPORT_CSV);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (DiarySyncManager.handleActivityResult(this, requestCode, resultCode, data)) {
            if (resultCode == RESULT_OK) Toast.makeText(this, "Sync file connected", Toast.LENGTH_SHORT).show();
            refreshStatus();
            return;
        }
        super.onActivityResult(requestCode, resultCode, data);
        if (resultCode != RESULT_OK || data == null || data.getData() == null) return;
        final Uri uri = data.getData();
        if (requestCode == REQ_IMPORT_CSV) {
            Toast.makeText(this, "Importing…", Toast.LENGTH_SHORT).show();
            new Thread(new Runnable() {
                @Override public void run() { importCsv(uri); }
            }, "FoodDiaryCsvImport").start();
        } else if (requestCode == REQ_EXPORT_CSV) {
            new Thread(new Runnable() {
                @Override public void run() { exportCsv(uri); }
            }, "FoodDiaryCsvExport").start();
        }
    }

    private SQLiteDatabase openDb() {
        return SQLiteDatabase.openDatabase(getDatabasePath("Events.db").getPath(), null, SQLiteDatabase.OPEN_READWRITE);
    }

    private static String key(String value) {
        return value == null ? "" : value.trim().toLowerCase(Locale.ROOT);
    }

    private Map<String, Integer> indexMap(int arrayId) {
        String[] values = getResources().getStringArray(arrayId);
        Map<String, Integer> map = new HashMap<String, Integer>();
        for (int i = 0; i < values.length; i++) map.put(key(values[i]), i);
        return map;
    }

    private int valueIndex(Map<String, Integer> map, String value, int fallback) {
        Integer found = map.get(key(value));
        return found == null ? fallback : found.intValue();
    }

    private void importCsv(Uri uri) {
        int imported = 0;
        int skipped = 0;
        int bad = 0;
        SQLiteDatabase db = null;
        InputStream input = null;
        try {
            Map<String, Integer> types = indexMap(ARRAY_EVENT_TYPES);
            Map<String, Integer> food = indexMap(ARRAY_FOOD_TYPES);
            Map<String, Integer> drink = indexMap(ARRAY_DRINK_TYPES);
            input = getContentResolver().openInputStream(uri);
            if (input == null) throw new IOException("Cannot open selected file");
            CsvReader reader = new CsvReader(input);
            db = openDb();
            db.beginTransaction();
            boolean first = true;
            List<String> row;
            while ((row = reader.next()) != null) {
                if (row.size() == 0) continue;
                if (first) {
                    first = false;
                    try { Long.parseLong(row.get(0)); }
                    catch (Exception header) { continue; }
                }
                if (row.size() < 6) { bad++; continue; }
                try {
                    String date = row.get(1).trim();
                    String time = row.get(2).trim();
                    int type = valueIndex(types, row.get(3), -1);
                    if (type < 0) { bad++; continue; }
                    int subType = 0;
                    if (type == 0) subType = valueIndex(food, row.get(4), 0);
                    else if (type == 1) subType = valueIndex(drink, row.get(4), 0);
                    String description = row.get(5) == null ? "" : row.get(5);

                    Cursor exists = db.rawQuery(
                            "SELECT 1 FROM [Event] WHERE [Date]=? AND [Time]=? AND [TypeKey]=? AND [SubTypeKey]=? AND COALESCE([Description],'')=? LIMIT 1",
                            new String[]{date, time, Integer.toString(type), Integer.toString(subType), description});
                    boolean duplicate;
                    try { duplicate = exists.moveToFirst(); } finally { exists.close(); }
                    if (duplicate) { skipped++; continue; }

                    ContentValues values = new ContentValues();
                    values.put("Date", date);
                    values.put("Time", time);
                    values.put("TypeKey", type);
                    values.put("SubTypeKey", subType);
                    values.put("Description", description);
                    long id = db.insert("Event", null, values);
                    if (id >= 0) imported++; else bad++;
                } catch (Exception rowError) {
                    bad++;
                }
            }
            db.setTransactionSuccessful();
            importedAnything = importedAnything || imported > 0;
            if (imported > 0) {
                setResult(1);
                DiarySyncManager.schedule(this);
            }
            final String message = "Import complete: " + imported + " added, " + skipped + " duplicates" + (bad > 0 ? ", " + bad + " skipped" : "");
            runOnUiThread(new Runnable() {
                @Override public void run() { Toast.makeText(ModernBackupActivity.this, message, Toast.LENGTH_LONG).show(); }
            });
        } catch (final Exception e) {
            runOnUiThread(new Runnable() {
                @Override public void run() { Toast.makeText(ModernBackupActivity.this, "Import failed: " + e.getMessage(), Toast.LENGTH_LONG).show(); }
            });
        } finally {
            if (db != null) {
                try { if (db.inTransaction()) db.endTransaction(); } catch (Exception ignored) {}
                try { db.close(); } catch (Exception ignored) {}
            }
            if (input != null) try { input.close(); } catch (IOException ignored) {}
        }
    }

    private void exportCsv(Uri uri) {
        SQLiteDatabase db = null;
        Cursor cursor = null;
        OutputStream output = null;
        BufferedWriter writer = null;
        int count = 0;
        try {
            String[] headers = getResources().getStringArray(ARRAY_CSV_HEADERS);
            String[] types = getResources().getStringArray(ARRAY_EVENT_TYPES);
            String[] food = getResources().getStringArray(ARRAY_FOOD_TYPES);
            String[] drink = getResources().getStringArray(ARRAY_DRINK_TYPES);
            output = getContentResolver().openOutputStream(uri, "wt");
            if (output == null) throw new IOException("Cannot create selected file");
            writer = new BufferedWriter(new OutputStreamWriter(output, StandardCharsets.UTF_8));
            writeCsvRow(writer, headers);
            db = openDb();
            cursor = db.rawQuery("SELECT ROWID,[Date],[Time],[TypeKey],[SubTypeKey],[Description] FROM [Event] ORDER BY [Date],[Time],ROWID", null);
            while (cursor.moveToNext()) {
                int type = cursor.getInt(3);
                int sub = cursor.getInt(4);
                String typeLabel = type >= 0 && type < types.length ? types[type] : "Other";
                String subLabel = "";
                if (type == 0 && sub >= 0 && sub < food.length) subLabel = food[sub];
                else if (type == 1 && sub >= 0 && sub < drink.length) subLabel = drink[sub];
                writeCsvRow(writer, new String[]{
                        Long.toString(cursor.getLong(0)), cursor.getString(1), cursor.getString(2),
                        typeLabel, subLabel, cursor.isNull(5) ? "" : cursor.getString(5)});
                count++;
            }
            writer.flush();
            final int exported = count;
            runOnUiThread(new Runnable() {
                @Override public void run() { Toast.makeText(ModernBackupActivity.this, "Exported " + exported + " records", Toast.LENGTH_LONG).show(); }
            });
        } catch (final Exception e) {
            runOnUiThread(new Runnable() {
                @Override public void run() { Toast.makeText(ModernBackupActivity.this, "Export failed: " + e.getMessage(), Toast.LENGTH_LONG).show(); }
            });
        } finally {
            if (cursor != null) cursor.close();
            if (db != null) db.close();
            if (writer != null) try { writer.close(); } catch (IOException ignored) {}
            else if (output != null) try { output.close(); } catch (IOException ignored) {}
        }
    }

    private static void writeCsvRow(BufferedWriter writer, String[] values) throws IOException {
        for (int i = 0; i < values.length; i++) {
            if (i > 0) writer.write(',');
            String value = values[i] == null ? "" : values[i];
            boolean quote = value.indexOf(',') >= 0 || value.indexOf('"') >= 0 || value.indexOf('\n') >= 0 || value.indexOf('\r') >= 0;
            if (quote) writer.write('"');
            for (int j = 0; j < value.length(); j++) {
                char c = value.charAt(j);
                if (c == '"') writer.write("\"\""); else writer.write(c);
            }
            if (quote) writer.write('"');
        }
        writer.write('\n');
    }

    private void finishWithResult() {
        if (importedAnything) setResult(1);
        finish();
    }

    @Override public void onBackPressed() { finishWithResult(); }

    private static final class CsvReader {
        private final BufferedReader reader;
        private int pushed = -2;
        CsvReader(InputStream in) { reader = new BufferedReader(new InputStreamReader(in, StandardCharsets.UTF_8)); }
        private int read() throws IOException {
            if (pushed != -2) { int c = pushed; pushed = -2; return c; }
            return reader.read();
        }
        private void unread(int c) { pushed = c; }
        List<String> next() throws IOException {
            ArrayList<String> row = new ArrayList<String>();
            StringBuilder field = new StringBuilder();
            boolean quoted = false;
            boolean started = false;
            while (true) {
                int ci = read();
                if (ci == -1) {
                    if (!started && field.length() == 0 && row.isEmpty()) return null;
                    row.add(field.toString());
                    return row;
                }
                started = true;
                char c = (char) ci;
                if (quoted) {
                    if (c == '"') {
                        int next = read();
                        if (next == '"') field.append('"');
                        else { quoted = false; if (next != -1) unread(next); }
                    } else field.append(c);
                } else {
                    if (c == '"' && field.length() == 0) quoted = true;
                    else if (c == ',') { row.add(field.toString()); field.setLength(0); }
                    else if (c == '\n') { row.add(field.toString()); return row; }
                    else if (c == '\r') { int next = read(); if (next != '\n' && next != -1) unread(next); row.add(field.toString()); return row; }
                    else field.append(c);
                }
            }
        }
    }
}
