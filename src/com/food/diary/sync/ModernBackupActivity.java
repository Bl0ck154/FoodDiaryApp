package com.food.diary.sync;

import android.content.ContentValues;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentPagerAdapter;
import androidx.viewpager.widget.ViewPager;

import com.google.android.material.tabs.TabLayout;

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

/**
 * Modern backup implementation presented inside the original Food Diary
 * toolbar + tab layout. No broad storage permissions are used.
 */
public class ModernBackupActivity extends AppCompatActivity {
    private static final int REQ_IMPORT_CSV = 0xC501;
    private static final int REQ_EXPORT_CSV = 0xC502;

    private static final int LAYOUT_BACKUP = 0x7f0c001c;
    private static final int ID_TOOLBAR = 0x7f0901e0;
    private static final int ID_PAGER = 0x7f09007a;
    private static final int ID_TABS = 0x7f0901bd;
    private static final int ICON_EXPORT = 0x7f08013a;
    private static final int ICON_IMPORT = 0x7f08013b;
    private static final int ICON_SYNC = 0x7f080139;

    private static final int ARRAY_CSV_HEADERS = 0x7f030000;
    private static final int ARRAY_DRINK_TYPES = 0x7f030003;
    private static final int ARRAY_FOOD_TYPES = 0x7f030004;
    private static final int ARRAY_EVENT_TYPES = 0x7f030005;

    private ViewPager pager;
    private boolean importedAnything;

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        setContentView(LAYOUT_BACKUP);

        Toolbar toolbar = (Toolbar) findViewById(ID_TOOLBAR);
        setSupportActionBar(toolbar);
        ActionBar bar = getSupportActionBar();
        if (bar != null) {
            bar.setDisplayHomeAsUpEnabled(true);
            bar.setTitle("Backup & Sync");
        }

        pager = (ViewPager) findViewById(ID_PAGER);
        pager.setAdapter(new SectionsPagerAdapter(getSupportFragmentManager()));

        TabLayout tabs = (TabLayout) findViewById(ID_TABS);
        tabs.setupWithViewPager(pager);
        TabLayout.Tab export = tabs.getTabAt(0);
        TabLayout.Tab imp = tabs.getTabAt(1);
        TabLayout.Tab sync = tabs.getTabAt(2);
        if (export != null) export.setIcon(ICON_EXPORT);
        if (imp != null) imp.setIcon(ICON_IMPORT);
        if (sync != null) sync.setIcon(ICON_SYNC);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == android.R.id.home) {
            finishWithResult();
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

    @Override
    public void onBackPressed() {
        finishWithResult();
    }

    private void finishWithResult() {
        if (importedAnything) setResult(RESULT_OK);
        finish();
    }

    private int dp(int value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }

    private TextView paragraph(String text) {
        TextView view = new TextView(this);
        view.setText(text);
        view.setTextSize(14);
        view.setPadding(0, dp(4), 0, dp(12));
        return view;
    }

    private Button actionButton(String text) {
        Button button = new Button(this);
        button.setText(text);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT);
        lp.setMargins(0, dp(5), 0, dp(5));
        button.setLayoutParams(lp);
        return button;
    }

    private LinearLayout pageRoot() {
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(dp(16), dp(14), dp(16), dp(16));
        root.setLayoutParams(new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));
        return root;
    }

    void launchImportCsv() {
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("text/*");
        intent.putExtra(Intent.EXTRA_MIME_TYPES,
                new String[]{"text/csv", "text/comma-separated-values", "text/plain", "application/csv"});
        startActivityForResult(intent, REQ_IMPORT_CSV);
    }

    void launchExportCsv() {
        Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("text/csv");
        intent.putExtra(Intent.EXTRA_TITLE, "FoodDiary-export.csv");
        startActivityForResult(intent, REQ_EXPORT_CSV);
    }

    void launchDrivePicker() {
        Toast.makeText(this,
                "In the system picker open the left menu and choose Google Drive, then choose where FoodDiary.json should be created.",
                Toast.LENGTH_LONG).show();
        DiarySyncManager.launchPicker(this);
    }

    void manualSync(final ActionFragment fragment) {
        if (!DiarySyncManager.isGoogleDrive(this)) {
            launchDrivePicker();
            return;
        }
        fragment.setSyncButtonEnabled(false);
        new Thread(new Runnable() {
            @Override public void run() {
                final boolean ok = DiarySyncManager.exportNow(ModernBackupActivity.this);
                runOnUiThread(new Runnable() {
                    @Override public void run() {
                        fragment.setSyncButtonEnabled(true);
                        fragment.renderSyncStatus();
                        Toast.makeText(ModernBackupActivity.this,
                                ok ? "Drive file updated. Google Drive handles the cloud upload."
                                   : "Could not update the Drive file.",
                                Toast.LENGTH_LONG).show();
                    }
                });
            }
        }, "FoodDiaryManualSync").start();
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (DiarySyncManager.handleActivityResult(this, requestCode, resultCode, data)) {
            if (resultCode == RESULT_OK) {
                if (DiarySyncManager.isGoogleDrive(this)) {
                    Toast.makeText(this,
                            "Google Drive selected. Food Diary can now update this Drive document.",
                            Toast.LENGTH_LONG).show();
                } else if (DiarySyncManager.isConfigured(this)) {
                    String provider = DiarySyncManager.getProviderName(this);
                    Toast.makeText(this,
                            "Local/non-Drive target selected (" + provider + "). This is a local backup, not Google Drive sync.",
                            Toast.LENGTH_LONG).show();
                }
            }
            refreshSyncFragment();
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

    private void refreshSyncFragment() {
        Fragment f = getSupportFragmentManager().findFragmentByTag("android:switcher:" + ID_PAGER + ":2");
        if (f instanceof ActionFragment) ((ActionFragment) f).renderSyncStatus();
    }

    private SQLiteDatabase openDb() {
        return SQLiteDatabase.openDatabase(
                getDatabasePath("Events.db").getPath(), null, SQLiteDatabase.OPEN_READWRITE);
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
                setResult(RESULT_OK);
                DiarySyncManager.schedule(this);
            }
            final String message = "Import complete: " + imported + " added, " + skipped + " duplicates"
                    + (bad > 0 ? ", " + bad + " skipped" : "");
            runOnUiThread(new Runnable() {
                @Override public void run() {
                    Toast.makeText(ModernBackupActivity.this, message, Toast.LENGTH_LONG).show();
                }
            });
        } catch (final Exception e) {
            runOnUiThread(new Runnable() {
                @Override public void run() {
                    Toast.makeText(ModernBackupActivity.this,
                            "Import failed: " + e.getMessage(), Toast.LENGTH_LONG).show();
                }
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
            cursor = db.rawQuery(
                    "SELECT ROWID,[Date],[Time],[TypeKey],[SubTypeKey],[Description] FROM [Event] ORDER BY [Date],[Time],ROWID",
                    null);
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
                @Override public void run() {
                    Toast.makeText(ModernBackupActivity.this,
                            "Exported " + exported + " records", Toast.LENGTH_LONG).show();
                }
            });
        } catch (final Exception e) {
            runOnUiThread(new Runnable() {
                @Override public void run() {
                    Toast.makeText(ModernBackupActivity.this,
                            "Export failed: " + e.getMessage(), Toast.LENGTH_LONG).show();
                }
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
            boolean quote = value.indexOf(',') >= 0 || value.indexOf('"') >= 0
                    || value.indexOf('\n') >= 0 || value.indexOf('\r') >= 0;
            if (quote) writer.write('"');
            for (int j = 0; j < value.length(); j++) {
                char c = value.charAt(j);
                if (c == '"') writer.write("\"\""); else writer.write(c);
            }
            if (quote) writer.write('"');
        }
        writer.write('\n');
    }

    public static final class SectionsPagerAdapter extends FragmentPagerAdapter {
        public SectionsPagerAdapter(FragmentManager fm) {
            super(fm);
        }

        @Override public int getCount() { return 3; }

        @Override public Fragment getItem(int position) {
            return ActionFragment.newInstance(position);
        }

        @Override public CharSequence getPageTitle(int position) {
            if (position == 0) return "Export";
            if (position == 1) return "Import";
            return "Sync";
        }
    }

    public static final class ActionFragment extends Fragment {
        private static final String ARG_MODE = "mode";
        private int mode;
        private TextView syncStatus;
        private Button syncNow;

        static ActionFragment newInstance(int mode) {
            ActionFragment fragment = new ActionFragment();
            Bundle args = new Bundle();
            args.putInt(ARG_MODE, mode);
            fragment.setArguments(args);
            return fragment;
        }

        private ModernBackupActivity host() {
            return (ModernBackupActivity) getActivity();
        }

        @Override
        public void onCreate(Bundle state) {
            super.onCreate(state);
            Bundle args = getArguments();
            mode = args == null ? 0 : args.getInt(ARG_MODE, 0);
        }

        @Override
        public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle state) {
            final ModernBackupActivity activity = host();
            LinearLayout root = activity.pageRoot();

            if (mode == 0) {
                root.addView(activity.paragraph("Save all diary records to a CSV file."));
                Button export = activity.actionButton("Export CSV");
                export.setOnClickListener(new View.OnClickListener() {
                    @Override public void onClick(View v) { activity.launchExportCsv(); }
                });
                root.addView(export);
            } else if (mode == 1) {
                root.addView(activity.paragraph(
                        "Import a CSV exported by the original Food Diary. Existing matching records are skipped."));
                Button imp = activity.actionButton("Import CSV");
                imp.setOnClickListener(new View.OnClickListener() {
                    @Override public void onClick(View v) { activity.launchImportCsv(); }
                });
                root.addView(imp);
            } else {
                syncStatus = activity.paragraph("");
                root.addView(syncStatus);

                Button connect = activity.actionButton("Connect Google Drive…");
                connect.setOnClickListener(new View.OnClickListener() {
                    @Override public void onClick(View v) { activity.launchDrivePicker(); }
                });
                root.addView(connect);

                syncNow = activity.actionButton("Sync now");
                syncNow.setOnClickListener(new View.OnClickListener() {
                    @Override public void onClick(View v) { activity.manualSync(ActionFragment.this); }
                });
                root.addView(syncNow);

                TextView note = activity.paragraph(
                        "The Google account is handled by the Google Drive document provider. Food Diary never receives your Google password. A successful write means the Drive provider accepted the updated file; Google Drive handles the network upload." );
                note.setTextSize(13);
                root.addView(note);
                renderSyncStatus();
            }
            return root;
        }

        @Override public void onResume() {
            super.onResume();
            if (mode == 2) renderSyncStatus();
        }

        void setSyncButtonEnabled(boolean enabled) {
            if (syncNow != null) syncNow.setEnabled(enabled);
        }

        void renderSyncStatus() {
            if (syncStatus == null || getActivity() == null) return;
            ModernBackupActivity activity = host();
            String error = DiarySyncManager.getLastError(activity);
            long last = DiarySyncManager.getLastSyncMs(activity);

            if (!DiarySyncManager.isConfigured(activity)) {
                syncStatus.setText(
                        "Google Drive: not connected\n\nTap Connect Google Drive, then choose Google Drive from the system picker's left menu.");
                if (syncNow != null) syncNow.setEnabled(false);
                return;
            }

            String provider = DiarySyncManager.getProviderName(activity);
            if (DiarySyncManager.isGoogleDrive(activity)) {
                StringBuilder text = new StringBuilder("Google Drive: connected");
                text.append("\nProvider: ").append(provider == null ? "Google Drive" : provider);
                if (last > 0) {
                    text.append("\nLast write to Drive provider: ")
                            .append(DateFormat.getDateTimeInstance().format(new Date(last)));
                }
                if (error != null && error.length() > 0) text.append("\nLast error: ").append(error);
                syncStatus.setText(text.toString());
                if (syncNow != null) syncNow.setEnabled(true);
            } else {
                StringBuilder text = new StringBuilder("Cloud sync: OFF");
                text.append("\nCurrent target: ").append(provider == null ? "Local storage" : provider);
                text.append("\nThis is only a local/non-Drive backup.");
                if (last > 0) {
                    text.append("\nLast local write: ")
                            .append(DateFormat.getDateTimeInstance().format(new Date(last)));
                }
                text.append("\n\nTap Connect Google Drive and choose Google Drive in the picker.");
                if (error != null && error.length() > 0) text.append("\nLast error: ").append(error);
                syncStatus.setText(text.toString());
                if (syncNow != null) syncNow.setEnabled(false);
            }
        }
    }

    private static final class CsvReader {
        private final BufferedReader reader;
        private int pushed = -2;

        CsvReader(InputStream in) {
            reader = new BufferedReader(new InputStreamReader(in, StandardCharsets.UTF_8));
        }

        private int read() throws IOException {
            if (pushed != -2) {
                int c = pushed;
                pushed = -2;
                return c;
            }
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
                        else {
                            quoted = false;
                            if (next != -1) unread(next);
                        }
                    } else {
                        field.append(c);
                    }
                } else {
                    if (c == '"' && field.length() == 0) quoted = true;
                    else if (c == ',') {
                        row.add(field.toString());
                        field.setLength(0);
                    } else if (c == '\n') {
                        row.add(field.toString());
                        return row;
                    } else if (c == '\r') {
                        int next = read();
                        if (next != '\n' && next != -1) unread(next);
                        row.add(field.toString());
                        return row;
                    } else {
                        field.append(c);
                    }
                }
            }
        }
    }
}
