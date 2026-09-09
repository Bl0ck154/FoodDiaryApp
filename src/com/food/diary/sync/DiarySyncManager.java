package com.food.diary.sync;

import android.app.Activity;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.content.pm.ProviderInfo;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import android.util.JsonWriter;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.nio.charset.StandardCharsets;
import java.util.Locale;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;

public final class DiarySyncManager {
    public static final int REQUEST_SYNC_DOCUMENT = 0x534e43;

    private static final String PREFS = "food_diary_sync";
    private static final String KEY_DOCUMENT_URI = "document_uri";
    private static final String KEY_PROVIDER_NAME = "provider_name";
    private static final String KEY_PROVIDER_PACKAGE = "provider_package";
    private static final String KEY_PROVIDER_AUTHORITY = "provider_authority";
    private static final String KEY_LAST_SYNC_MS = "last_sync_ms";
    private static final String KEY_LAST_ERROR = "last_error";
    private static final long DEBOUNCE_MS = 450L;

    private static final int ARRAY_DRINK_TYPES = 0x7f030003;
    private static final int ARRAY_FOOD_TYPES = 0x7f030004;
    private static final int ARRAY_EVENT_TYPES = 0x7f030005;

    private static final ScheduledExecutorService EXECUTOR =
            Executors.newSingleThreadScheduledExecutor(new ThreadFactory() {
                @Override
                public Thread newThread(Runnable runnable) {
                    Thread t = new Thread(runnable, "FoodDiarySync");
                    t.setDaemon(true);
                    return t;
                }
            });

    private static ScheduledFuture<?> pending;

    private DiarySyncManager() {}

    private static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    public static boolean isConfigured(Context context) {
        return getDocumentUri(context) != null;
    }

    public static Uri getDocumentUri(Context context) {
        String raw = prefs(context).getString(KEY_DOCUMENT_URI, null);
        return raw == null || raw.length() == 0 ? null : Uri.parse(raw);
    }

    public static long getLastSyncMs(Context context) {
        return prefs(context).getLong(KEY_LAST_SYNC_MS, 0L);
    }

    public static String getLastError(Context context) {
        return prefs(context).getString(KEY_LAST_ERROR, null);
    }

    public static String getProviderName(Context context) {
        String value = prefs(context).getString(KEY_PROVIDER_NAME, null);
        if (value != null && value.length() > 0) return value;
        Uri uri = getDocumentUri(context);
        if (uri == null) return null;
        ProviderSnapshot provider = resolveProvider(context, uri);
        saveProvider(context, provider);
        return provider.name;
    }

    public static String getProviderPackage(Context context) {
        String value = prefs(context).getString(KEY_PROVIDER_PACKAGE, null);
        if (value != null && value.length() > 0) return value;
        Uri uri = getDocumentUri(context);
        if (uri == null) return null;
        ProviderSnapshot provider = resolveProvider(context, uri);
        saveProvider(context, provider);
        return provider.packageName;
    }

    public static String getProviderAuthority(Context context) {
        String value = prefs(context).getString(KEY_PROVIDER_AUTHORITY, null);
        if (value != null && value.length() > 0) return value;
        Uri uri = getDocumentUri(context);
        return uri == null ? null : uri.getAuthority();
    }

    public static boolean isGoogleDrive(Context context) {
        String pkg = getProviderPackage(context);
        String authority = getProviderAuthority(context);
        String name = getProviderName(context);
        if (pkg != null && (pkg.equals("com.google.android.apps.docs") || pkg.startsWith("com.google.android.apps.docs."))) {
            return true;
        }
        String joined = ((authority == null ? "" : authority) + " " + (name == null ? "" : name)).toLowerCase(Locale.ROOT);
        return joined.contains("google") && joined.contains("drive");
    }

    public static boolean isLocalTarget(Context context) {
        return isConfigured(context) && !isGoogleDrive(context);
    }

    public static void launchPicker(Activity activity) {
        Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("application/json");
        intent.putExtra(Intent.EXTRA_TITLE, "FoodDiary.json");
        intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION
                | Intent.FLAG_GRANT_WRITE_URI_PERMISSION
                | Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION);
        activity.startActivityForResult(intent, REQUEST_SYNC_DOCUMENT);
    }

    public static boolean handleActivityResult(Activity activity, int requestCode,
                                               int resultCode, Intent data) {
        if (requestCode != REQUEST_SYNC_DOCUMENT) return false;
        if (resultCode != Activity.RESULT_OK || data == null || data.getData() == null) return true;

        Uri uri = data.getData();
        int takeFlags = data.getFlags()
                & (Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_WRITE_URI_PERMISSION);
        try {
            activity.getContentResolver().takePersistableUriPermission(uri, takeFlags);
        } catch (SecurityException ignored) {
        }

        ProviderSnapshot provider = resolveProvider(activity, uri);
        prefs(activity).edit()
                .putString(KEY_DOCUMENT_URI, uri.toString())
                .putString(KEY_PROVIDER_NAME, provider.name)
                .putString(KEY_PROVIDER_PACKAGE, provider.packageName)
                .putString(KEY_PROVIDER_AUTHORITY, provider.authority)
                .remove(KEY_LAST_ERROR)
                .apply();
        schedule(activity);
        return true;
    }

    private static ProviderSnapshot resolveProvider(Context context, Uri uri) {
        String authority = uri == null || uri.getAuthority() == null ? "" : uri.getAuthority();
        String packageName = "";
        String name = "Storage provider";
        try {
            PackageManager pm = context.getPackageManager();
            ProviderInfo info = pm.resolveContentProvider(authority, 0);
            if (info != null) {
                packageName = info.packageName == null ? "" : info.packageName;
                CharSequence label = info.loadLabel(pm);
                if (label != null && label.length() > 0) name = label.toString();
            }
        } catch (Exception ignored) {}
        if (packageName.equals("com.google.android.apps.docs")) name = "Google Drive";
        return new ProviderSnapshot(name, packageName, authority);
    }

    private static void saveProvider(Context context, ProviderSnapshot provider) {
        prefs(context).edit()
                .putString(KEY_PROVIDER_NAME, provider.name)
                .putString(KEY_PROVIDER_PACKAGE, provider.packageName)
                .putString(KEY_PROVIDER_AUTHORITY, provider.authority)
                .apply();
    }

    public static synchronized void schedule(Context context) {
        if (!isConfigured(context)) return;
        final Context app = context.getApplicationContext();
        if (pending != null) pending.cancel(false);
        pending = EXECUTOR.schedule(new Runnable() {
            @Override
            public void run() {
                exportNow(app);
            }
        }, DEBOUNCE_MS, TimeUnit.MILLISECONDS);
    }

    public static boolean exportNow(Context context) {
        Uri uri = getDocumentUri(context);
        if (uri == null) return false;

        try {
            byte[] snapshot = buildSnapshot(context);
            ContentResolver resolver = context.getContentResolver();
            OutputStream out = resolver.openOutputStream(uri, "wt");
            if (out == null) throw new IOException("ContentResolver returned null output stream");
            try {
                out.write(snapshot);
                out.flush();
            } finally {
                out.close();
            }

            prefs(context).edit()
                    .putLong(KEY_LAST_SYNC_MS, System.currentTimeMillis())
                    .remove(KEY_LAST_ERROR)
                    .apply();
            return true;
        } catch (Exception e) {
            prefs(context).edit()
                    .putString(KEY_LAST_ERROR,
                            e.getClass().getSimpleName() + ": " + String.valueOf(e.getMessage()))
                    .apply();
            return false;
        }
    }

    private static byte[] buildSnapshot(Context context) throws IOException {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream(16 * 1024);
        OutputStreamWriter osw = new OutputStreamWriter(bytes, StandardCharsets.UTF_8);
        JsonWriter writer = new JsonWriter(osw);
        SQLiteDatabase db = null;
        Cursor cursor = null;

        try {
            writer.setIndent("  ");
            writer.beginObject();
            writer.name("app").value("Food Diary");
            writer.name("schemaVersion").value(1);
            writer.name("updatedAtEpochMs").value(System.currentTimeMillis());
            writer.name("events").beginArray();

            String dbPath = context.getDatabasePath("Events.db").getPath();
            db = SQLiteDatabase.openDatabase(dbPath, null, SQLiteDatabase.OPEN_READONLY);
            cursor = db.query(
                    "Event",
                    new String[]{"ROWID", "Date", "Time", "TypeKey", "SubTypeKey", "Description"},
                    null, null, null, null,
                    "Date ASC, Time ASC, ROWID ASC");

            while (cursor.moveToNext()) {
                long id = cursor.getLong(0);
                String date = cursor.getString(1);
                String time = cursor.getString(2);
                int typeKey = cursor.getInt(3);
                int subTypeKey = cursor.getInt(4);
                String description = cursor.isNull(5) ? "" : cursor.getString(5);

                writer.beginObject();
                writer.name("id").value(id);
                writer.name("date").value(date);
                writer.name("time").value(time);
                writer.name("typeKey").value(typeKey);
                writer.name("subTypeKey").value(subTypeKey);
                writer.name("type").value(resolveLabel(context, ARRAY_EVENT_TYPES, typeKey, fallbackType(typeKey)));
                writer.name("subType").value(resolveSubType(context, typeKey, subTypeKey));
                writer.name("description").value(description);
                writer.endObject();
            }

            writer.endArray();
            writer.endObject();
            writer.flush();
            return bytes.toByteArray();
        } finally {
            if (cursor != null) cursor.close();
            if (db != null) db.close();
            writer.close();
        }
    }

    private static String resolveSubType(Context context, int typeKey, int subTypeKey) {
        if (typeKey == 0) return resolveLabel(context, ARRAY_FOOD_TYPES, subTypeKey, "");
        if (typeKey == 1) return resolveLabel(context, ARRAY_DRINK_TYPES, subTypeKey, "");
        return "";
    }

    private static String resolveLabel(Context context, int arrayId, int index, String fallback) {
        try {
            String[] values = context.getResources().getStringArray(arrayId);
            if (index >= 0 && index < values.length) return values[index];
        } catch (Exception ignored) {}
        return fallback;
    }

    private static String fallbackType(int typeKey) {
        switch (typeKey) {
            case 0: return "Food";
            case 1: return "Drink";
            case 2: return "Medication";
            case 3: return "Supplements";
            case 4: return "Exercise";
            case 5: return "Other";
            default: return "Unknown";
        }
    }

    private static final class ProviderSnapshot {
        final String name;
        final String packageName;
        final String authority;
        ProviderSnapshot(String name, String packageName, String authority) {
            this.name = name == null ? "" : name;
            this.packageName = packageName == null ? "" : packageName;
            this.authority = authority == null ? "" : authority;
        }
    }
}
