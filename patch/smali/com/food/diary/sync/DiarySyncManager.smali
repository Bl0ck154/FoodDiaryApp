.class public final Lcom/food/diary/sync/DiarySyncManager;
.super Ljava/lang/Object;
.source "DiarySyncManager.java"


# static fields
.field private static final ARRAY_DRINK_TYPES:I = 0x7f030003

.field private static final ARRAY_EVENT_TYPES:I = 0x7f030005

.field private static final ARRAY_FOOD_TYPES:I = 0x7f030004

.field private static final DEBOUNCE_MS:J = 0x1c2L

.field private static final EXECUTOR:Ljava/util/concurrent/ScheduledExecutorService;

.field private static final KEY_DOCUMENT_URI:Ljava/lang/String; = "document_uri"

.field private static final KEY_LAST_ERROR:Ljava/lang/String; = "last_error"

.field private static final KEY_LAST_SYNC_MS:Ljava/lang/String; = "last_sync_ms"

.field private static final PREFS:Ljava/lang/String; = "food_diary_sync"

.field public static final REQUEST_SYNC_DOCUMENT:I = 0x534e43

.field private static pending:Ljava/util/concurrent/ScheduledFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ScheduledFuture<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 38
    new-instance v0, Lcom/food/diary/sync/DiarySyncManager$1;

    invoke-direct {v0}, Lcom/food/diary/sync/DiarySyncManager$1;-><init>()V

    .line 39
    invoke-static {v0}, Ljava/util/concurrent/Executors;->newSingleThreadScheduledExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    sput-object v0, Lcom/food/diary/sync/DiarySyncManager;->EXECUTOR:Ljava/util/concurrent/ScheduledExecutorService;

    .line 38
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static buildSnapshot(Landroid/content/Context;)[B
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 149
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    const/16 v1, 0x4000

    invoke-direct {v0, v1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 150
    new-instance v1, Ljava/io/OutputStreamWriter;

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v1, v0, v2}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    .line 151
    new-instance v2, Landroid/util/JsonWriter;

    invoke-direct {v2, v1}, Landroid/util/JsonWriter;-><init>(Ljava/io/Writer;)V

    .line 152
    nop

    .line 153
    nop

    .line 156
    const/4 v1, 0x0

    :try_start_16
    const-string v3, "  "

    invoke-virtual {v2, v3}, Landroid/util/JsonWriter;->setIndent(Ljava/lang/String;)V

    .line 157
    invoke-virtual {v2}, Landroid/util/JsonWriter;->beginObject()Landroid/util/JsonWriter;

    .line 158
    const-string v3, "app"

    invoke-virtual {v2, v3}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    move-result-object v3

    const-string v4, "Food Diary"

    invoke-virtual {v3, v4}, Landroid/util/JsonWriter;->value(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 159
    const-string v3, "schemaVersion"

    invoke-virtual {v2, v3}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    move-result-object v3

    const-wide/16 v4, 0x1

    invoke-virtual {v3, v4, v5}, Landroid/util/JsonWriter;->value(J)Landroid/util/JsonWriter;

    .line 160
    const-string v3, "updatedAtEpochMs"

    invoke-virtual {v2, v3}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    move-result-object v3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Landroid/util/JsonWriter;->value(J)Landroid/util/JsonWriter;

    .line 161
    const-string v3, "events"

    invoke-virtual {v2, v3}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    move-result-object v3

    invoke-virtual {v3}, Landroid/util/JsonWriter;->beginArray()Landroid/util/JsonWriter;

    .line 163
    const-string v3, "Events.db"

    invoke-virtual {p0, v3}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    .line 164
    const/4 v4, 0x1

    invoke-static {v3, v1, v4}, Landroid/database/sqlite/SQLiteDatabase;->openDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3
    :try_end_59
    .catchall {:try_start_16 .. :try_end_59} :catchall_120

    .line 165
    :try_start_59
    const-string v6, "Event"

    const-string v7, "ROWID"

    const-string v8, "Date"

    const-string v9, "Time"

    const-string v10, "TypeKey"

    const-string v11, "SubTypeKey"

    const-string v12, "Description"

    filled-new-array/range {v7 .. v12}, [Ljava/lang/String;

    move-result-object v7

    const-string v12, "Date ASC, Time ASC, ROWID ASC"

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object v5, v3

    invoke-virtual/range {v5 .. v12}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 171
    :goto_76
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v5

    if-eqz v5, :cond_103

    .line 172
    const/4 v5, 0x0

    invoke-interface {v1, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    .line 173
    invoke-interface {v1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 174
    const/4 v8, 0x2

    invoke-interface {v1, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 175
    const/4 v9, 0x3

    invoke-interface {v1, v9}, Landroid/database/Cursor;->getInt(I)I

    move-result v9

    .line 176
    const/4 v10, 0x4

    invoke-interface {v1, v10}, Landroid/database/Cursor;->getInt(I)I

    move-result v10

    .line 177
    const/4 v11, 0x5

    invoke-interface {v1, v11}, Landroid/database/Cursor;->isNull(I)Z

    move-result v12

    if-eqz v12, :cond_9e

    const-string v11, ""

    goto :goto_a2

    :cond_9e
    invoke-interface {v1, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 179
    :goto_a2
    invoke-virtual {v2}, Landroid/util/JsonWriter;->beginObject()Landroid/util/JsonWriter;

    .line 180
    const-string v12, "id"

    invoke-virtual {v2, v12}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    move-result-object v12

    invoke-virtual {v12, v5, v6}, Landroid/util/JsonWriter;->value(J)Landroid/util/JsonWriter;

    .line 181
    const-string v5, "date"

    invoke-virtual {v2, v5}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    move-result-object v5

    invoke-virtual {v5, v7}, Landroid/util/JsonWriter;->value(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 182
    const-string v5, "time"

    invoke-virtual {v2, v5}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    move-result-object v5

    invoke-virtual {v5, v8}, Landroid/util/JsonWriter;->value(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 183
    const-string v5, "typeKey"

    invoke-virtual {v2, v5}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    move-result-object v5

    int-to-long v6, v9

    invoke-virtual {v5, v6, v7}, Landroid/util/JsonWriter;->value(J)Landroid/util/JsonWriter;

    .line 184
    const-string v5, "subTypeKey"

    invoke-virtual {v2, v5}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    move-result-object v5

    int-to-long v6, v10

    invoke-virtual {v5, v6, v7}, Landroid/util/JsonWriter;->value(J)Landroid/util/JsonWriter;

    .line 185
    const-string v5, "type"

    invoke-virtual {v2, v5}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    move-result-object v5

    invoke-static {v9}, Lcom/food/diary/sync/DiarySyncManager;->fallbackType(I)Ljava/lang/String;

    move-result-object v6

    const v7, 0x7f030005

    invoke-static {p0, v7, v9, v6}, Lcom/food/diary/sync/DiarySyncManager;->resolveLabel(Landroid/content/Context;IILjava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/util/JsonWriter;->value(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 186
    const-string v5, "subType"

    invoke-virtual {v2, v5}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    move-result-object v5

    invoke-static {p0, v9, v10}, Lcom/food/diary/sync/DiarySyncManager;->resolveSubType(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/util/JsonWriter;->value(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 187
    const-string v5, "description"

    invoke-virtual {v2, v5}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    move-result-object v5

    invoke-virtual {v5, v11}, Landroid/util/JsonWriter;->value(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 188
    invoke-virtual {v2}, Landroid/util/JsonWriter;->endObject()Landroid/util/JsonWriter;

    .line 189
    goto/16 :goto_76

    .line 191
    :cond_103
    invoke-virtual {v2}, Landroid/util/JsonWriter;->endArray()Landroid/util/JsonWriter;

    .line 192
    invoke-virtual {v2}, Landroid/util/JsonWriter;->endObject()Landroid/util/JsonWriter;

    .line 193
    invoke-virtual {v2}, Landroid/util/JsonWriter;->flush()V

    .line 194
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0
    :try_end_110
    .catchall {:try_start_59 .. :try_end_110} :catchall_11e

    .line 196
    if-eqz v1, :cond_115

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 197
    :cond_115
    if-eqz v3, :cond_11a

    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 198
    :cond_11a
    invoke-virtual {v2}, Landroid/util/JsonWriter;->close()V

    .line 194
    return-object p0

    .line 196
    :catchall_11e
    move-exception p0

    goto :goto_122

    :catchall_120
    move-exception p0

    move-object v3, v1

    :goto_122
    if-eqz v1, :cond_127

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 197
    :cond_127
    if-eqz v3, :cond_12c

    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 198
    :cond_12c
    invoke-virtual {v2}, Landroid/util/JsonWriter;->close()V

    .line 199
    goto :goto_131

    :goto_130
    throw p0

    :goto_131
    goto :goto_130
.end method

.method public static exportNow(Landroid/content/Context;)Z
    .registers 7

    .line 119
    const-string v0, "last_error"

    invoke-static {p0}, Lcom/food/diary/sync/DiarySyncManager;->getDocumentUri(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v1

    .line 120
    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    .line 123
    :cond_a
    :try_start_a
    invoke-static {p0}, Lcom/food/diary/sync/DiarySyncManager;->buildSnapshot(Landroid/content/Context;)[B

    move-result-object v3

    .line 124
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    .line 125
    const-string v5, "wt"

    invoke-virtual {v4, v1, v5}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object v1
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_18} :catch_4c

    .line 126
    if-eqz v1, :cond_44

    .line 128
    :try_start_1a
    invoke-virtual {v1, v3}, Ljava/io/OutputStream;->write([B)V

    .line 129
    invoke-virtual {v1}, Ljava/io/OutputStream;->flush()V
    :try_end_20
    .catchall {:try_start_1a .. :try_end_20} :catchall_3f

    .line 131
    :try_start_20
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    .line 132
    nop

    .line 134
    invoke-static {p0}, Lcom/food/diary/sync/DiarySyncManager;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v3, "last_sync_ms"

    .line 135
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-interface {v1, v3, v4, v5}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 136
    invoke-interface {v1, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 137
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 138
    const/4 p0, 0x1

    return p0

    .line 131
    :catchall_3f
    move-exception v3

    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    .line 132
    throw v3

    .line 126
    :cond_44
    new-instance v1, Ljava/io/IOException;

    const-string v3, "ContentResolver returned null output stream"

    invoke-direct {v1, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_4c
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_4c} :catch_4c

    .line 139
    :catch_4c
    move-exception v1

    .line 140
    invoke-static {p0}, Lcom/food/diary/sync/DiarySyncManager;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 142
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 141
    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 143
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 144
    return v2
.end method

.method private static fallbackType(I)Ljava/lang/String;
    .registers 1

    .line 221
    packed-switch p0, :pswitch_data_18

    .line 228
    const-string p0, "Unknown"

    return-object p0

    .line 227
    :pswitch_6
    const-string p0, "Other"

    return-object p0

    .line 226
    :pswitch_9
    const-string p0, "Exercise"

    return-object p0

    .line 225
    :pswitch_c
    const-string p0, "Supplements"

    return-object p0

    .line 224
    :pswitch_f
    const-string p0, "Medication"

    return-object p0

    .line 223
    :pswitch_12
    const-string p0, "Drink"

    return-object p0

    .line 222
    :pswitch_15
    const-string p0, "Food"

    return-object p0

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_15
        :pswitch_12
        :pswitch_f
        :pswitch_c
        :pswitch_9
        :pswitch_6
    .end packed-switch
.end method

.method public static getDocumentUri(Landroid/content/Context;)Landroid/net/Uri;
    .registers 3

    .line 61
    invoke-static {p0}, Lcom/food/diary/sync/DiarySyncManager;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "document_uri"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 62
    if-eqz p0, :cond_18

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_14

    goto :goto_18

    :cond_14
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    :cond_18
    :goto_18
    return-object v1
.end method

.method public static getLastError(Landroid/content/Context;)Ljava/lang/String;
    .registers 3

    .line 70
    invoke-static {p0}, Lcom/food/diary/sync/DiarySyncManager;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "last_error"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getLastSyncMs(Landroid/content/Context;)J
    .registers 4

    .line 66
    invoke-static {p0}, Lcom/food/diary/sync/DiarySyncManager;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "last_sync_ms"

    const-wide/16 v1, 0x0

    invoke-interface {p0, v0, v1, v2}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public static handleActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)Z
    .registers 5

    .line 86
    const v0, 0x534e43

    if-eq p1, v0, :cond_7

    const/4 p0, 0x0

    return p0

    .line 87
    :cond_7
    const/4 p1, -0x1

    const/4 v0, 0x1

    if-ne p2, p1, :cond_46

    if-eqz p3, :cond_46

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    if-nez p1, :cond_14

    goto :goto_46

    .line 89
    :cond_14
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    .line 90
    invoke-virtual {p3}, Landroid/content/Intent;->getFlags()I

    move-result p2

    and-int/lit8 p2, p2, 0x3

    .line 93
    :try_start_1e
    invoke-virtual {p0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p3

    invoke-virtual {p3, p1, p2}, Landroid/content/ContentResolver;->takePersistableUriPermission(Landroid/net/Uri;I)V
    :try_end_25
    .catch Ljava/lang/SecurityException; {:try_start_1e .. :try_end_25} :catch_26

    .line 96
    goto :goto_27

    .line 94
    :catch_26
    move-exception p2

    .line 98
    :goto_27
    invoke-static {p0}, Lcom/food/diary/sync/DiarySyncManager;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p2

    invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    .line 99
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p3, "document_uri"

    invoke-interface {p2, p3, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 100
    const-string p2, "last_error"

    invoke-interface {p1, p2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 101
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 102
    invoke-static {p0}, Lcom/food/diary/sync/DiarySyncManager;->schedule(Landroid/content/Context;)V

    .line 103
    return v0

    .line 87
    :cond_46
    :goto_46
    return v0
.end method

.method public static isConfigured(Landroid/content/Context;)Z
    .registers 1

    .line 57
    invoke-static {p0}, Lcom/food/diary/sync/DiarySyncManager;->getDocumentUri(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object p0

    if-eqz p0, :cond_8

    const/4 p0, 0x1

    goto :goto_9

    :cond_8
    const/4 p0, 0x0

    :goto_9
    return p0
.end method

.method public static launchPicker(Landroid/app/Activity;)V
    .registers 4

    .line 74
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.CREATE_DOCUMENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 75
    const-string v1, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 76
    const-string v1, "application/json"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 77
    const-string v1, "android.intent.extra.TITLE"

    const-string v2, "FoodDiary.json"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 78
    const/16 v1, 0x43

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 81
    const v1, 0x534e43

    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 82
    return-void
.end method

.method private static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 3

    .line 53
    const-string v0, "food_diary_sync"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method private static resolveLabel(Landroid/content/Context;IILjava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 214
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object p0

    .line 215
    if-ltz p2, :cond_11

    array-length p1, p0

    if-ge p2, p1, :cond_11

    aget-object p0, p0, p2
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_f} :catch_10

    return-object p0

    .line 216
    :catch_10
    move-exception p0

    :cond_11
    nop

    .line 217
    return-object p3
.end method

.method private static resolveSubType(Landroid/content/Context;II)Ljava/lang/String;
    .registers 5

    .line 203
    const-string v0, ""

    if-nez p1, :cond_c

    .line 204
    const p1, 0x7f030004

    invoke-static {p0, p1, p2, v0}, Lcom/food/diary/sync/DiarySyncManager;->resolveLabel(Landroid/content/Context;IILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 206
    :cond_c
    const/4 v1, 0x1

    if-ne p1, v1, :cond_17

    .line 207
    const p1, 0x7f030003

    invoke-static {p0, p1, p2, v0}, Lcom/food/diary/sync/DiarySyncManager;->resolveLabel(Landroid/content/Context;IILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 209
    :cond_17
    return-object v0
.end method

.method public static declared-synchronized schedule(Landroid/content/Context;)V
    .registers 6

    const-class v0, Lcom/food/diary/sync/DiarySyncManager;

    monitor-enter v0

    .line 107
    :try_start_3
    invoke-static {p0}, Lcom/food/diary/sync/DiarySyncManager;->isConfigured(Landroid/content/Context;)Z

    move-result v1
    :try_end_7
    .catchall {:try_start_3 .. :try_end_7} :catchall_2c

    if-nez v1, :cond_b

    monitor-exit v0

    return-void

    .line 108
    :cond_b
    :try_start_b
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    .line 109
    sget-object v1, Lcom/food/diary/sync/DiarySyncManager;->pending:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v1, :cond_19

    sget-object v1, Lcom/food/diary/sync/DiarySyncManager;->pending:Ljava/util/concurrent/ScheduledFuture;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    .line 110
    :cond_19
    sget-object v1, Lcom/food/diary/sync/DiarySyncManager;->EXECUTOR:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v2, Lcom/food/diary/sync/DiarySyncManager$2;

    invoke-direct {v2, p0}, Lcom/food/diary/sync/DiarySyncManager$2;-><init>(Landroid/content/Context;)V

    sget-object p0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v3, 0x1c2

    invoke-interface {v1, v2, v3, v4, p0}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object p0

    sput-object p0, Lcom/food/diary/sync/DiarySyncManager;->pending:Ljava/util/concurrent/ScheduledFuture;
    :try_end_2a
    .catchall {:try_start_b .. :try_end_2a} :catchall_2c

    .line 116
    monitor-exit v0

    return-void

    .line 106
    :catchall_2c
    move-exception p0

    monitor-exit v0

    throw p0
.end method
