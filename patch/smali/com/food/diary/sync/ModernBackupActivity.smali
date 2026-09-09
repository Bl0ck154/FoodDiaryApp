.class public Lcom/food/diary/sync/ModernBackupActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "ModernBackupActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/food/diary/sync/ModernBackupActivity$SectionsPagerAdapter;,
        Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;,
        Lcom/food/diary/sync/ModernBackupActivity$CsvReader;
    }
.end annotation


# static fields
.field private static final ARRAY_CSV_HEADERS:I = 0x7f030000

.field private static final ARRAY_DRINK_TYPES:I = 0x7f030003

.field private static final ARRAY_EVENT_TYPES:I = 0x7f030005

.field private static final ARRAY_FOOD_TYPES:I = 0x7f030004

.field private static final ICON_EXPORT:I = 0x7f08013a

.field private static final ICON_IMPORT:I = 0x7f08013b

.field private static final ICON_SYNC:I = 0x7f080139

.field private static final ID_PAGER:I = 0x7f09007a

.field private static final ID_TABS:I = 0x7f0901bd

.field private static final ID_TOOLBAR:I = 0x7f0901e0

.field private static final LAYOUT_BACKUP:I = 0x7f0c001c

.field private static final REQ_EXPORT_CSV:I = 0xc502

.field private static final REQ_IMPORT_CSV:I = 0xc501


# instance fields
.field private importedAnything:Z

.field private pager:Landroidx/viewpager/widget/ViewPager;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 48
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/food/diary/sync/ModernBackupActivity;Landroid/net/Uri;)V
    .registers 2

    .line 48
    invoke-direct {p0, p1}, Lcom/food/diary/sync/ModernBackupActivity;->importCsv(Landroid/net/Uri;)V

    return-void
.end method

.method static synthetic access$100(Lcom/food/diary/sync/ModernBackupActivity;Landroid/net/Uri;)V
    .registers 2

    .line 48
    invoke-direct {p0, p1}, Lcom/food/diary/sync/ModernBackupActivity;->exportCsv(Landroid/net/Uri;)V

    return-void
.end method

.method static synthetic access$200(Lcom/food/diary/sync/ModernBackupActivity;)Landroid/widget/LinearLayout;
    .registers 1

    .line 48
    invoke-direct {p0}, Lcom/food/diary/sync/ModernBackupActivity;->pageRoot()Landroid/widget/LinearLayout;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$300(Lcom/food/diary/sync/ModernBackupActivity;Ljava/lang/String;)Landroid/widget/TextView;
    .registers 2

    .line 48
    invoke-direct {p0, p1}, Lcom/food/diary/sync/ModernBackupActivity;->paragraph(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$400(Lcom/food/diary/sync/ModernBackupActivity;Ljava/lang/String;)Landroid/widget/Button;
    .registers 2

    .line 48
    invoke-direct {p0, p1}, Lcom/food/diary/sync/ModernBackupActivity;->actionButton(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object p0

    return-object p0
.end method

.method private actionButton(Ljava/lang/String;)Landroid/widget/Button;
    .registers 6

    .line 126
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 127
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 128
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {p1, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 131
    const/4 v1, 0x5

    invoke-direct {p0, v1}, Lcom/food/diary/sync/ModernBackupActivity;->dp(I)I

    move-result v2

    invoke-direct {p0, v1}, Lcom/food/diary/sync/ModernBackupActivity;->dp(I)I

    move-result v1

    const/4 v3, 0x0

    invoke-virtual {p1, v3, v2, v3, v1}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 132
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 133
    return-object v0
.end method

.method private dp(I)I
    .registers 3

    .line 114
    int-to-float p1, p1

    invoke-virtual {p0}, Lcom/food/diary/sync/ModernBackupActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float p1, p1, v0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    return p1
.end method

.method private exportCsv(Landroid/net/Uri;)V
    .registers 21

    .line 337
    move-object/from16 v1, p0

    .line 338
    nop

    .line 339
    nop

    .line 340
    nop

    .line 341
    nop

    .line 343
    const/4 v2, 0x0

    :try_start_7
    invoke-virtual/range {p0 .. p0}, Lcom/food/diary/sync/ModernBackupActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/high16 v3, 0x7f030000

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    .line 344
    invoke-virtual/range {p0 .. p0}, Lcom/food/diary/sync/ModernBackupActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f030005

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v3

    .line 345
    invoke-virtual/range {p0 .. p0}, Lcom/food/diary/sync/ModernBackupActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f030004

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v4

    .line 346
    invoke-virtual/range {p0 .. p0}, Lcom/food/diary/sync/ModernBackupActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f030003

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v5

    .line 347
    invoke-virtual/range {p0 .. p0}, Lcom/food/diary/sync/ModernBackupActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    const-string v7, "wt"

    move-object/from16 v8, p1

    invoke-virtual {v6, v8, v7}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object v6
    :try_end_3e
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_3e} :catch_fc
    .catchall {:try_start_7 .. :try_end_3e} :catchall_f6

    .line 348
    if-eqz v6, :cond_ee

    .line 349
    :try_start_40
    new-instance v7, Ljava/io/BufferedWriter;

    new-instance v8, Ljava/io/OutputStreamWriter;

    sget-object v9, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v8, v6, v9}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v7, v8}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_4c
    .catch Ljava/lang/Exception; {:try_start_40 .. :try_end_4c} :catch_eb
    .catchall {:try_start_40 .. :try_end_4c} :catchall_e7

    .line 350
    :try_start_4c
    invoke-static {v7, v0}, Lcom/food/diary/sync/ModernBackupActivity;->writeCsvRow(Ljava/io/BufferedWriter;[Ljava/lang/String;)V

    .line 351
    invoke-direct/range {p0 .. p0}, Lcom/food/diary/sync/ModernBackupActivity;->openDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v8
    :try_end_53
    .catch Ljava/lang/Exception; {:try_start_4c .. :try_end_53} :catch_e4
    .catchall {:try_start_4c .. :try_end_53} :catchall_e0

    .line 352
    :try_start_53
    const-string v0, "SELECT ROWID,[Date],[Time],[TypeKey],[SubTypeKey],[Description] FROM [Event] ORDER BY [Date],[Time],ROWID"

    invoke-virtual {v8, v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    const/4 v0, 0x0

    const/4 v9, 0x0

    .line 355
    :goto_5b
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v10

    if-eqz v10, :cond_c2

    .line 356
    const/4 v10, 0x3

    invoke-interface {v2, v10}, Landroid/database/Cursor;->getInt(I)I

    move-result v10

    .line 357
    const/4 v11, 0x4

    invoke-interface {v2, v11}, Landroid/database/Cursor;->getInt(I)I

    move-result v11

    .line 358
    if-ltz v10, :cond_73

    array-length v12, v3

    if-ge v10, v12, :cond_73

    aget-object v12, v3, v10

    goto :goto_75

    :cond_73
    const-string v12, "Other"
    :try_end_75
    .catch Ljava/lang/Exception; {:try_start_53 .. :try_end_75} :catch_de
    .catchall {:try_start_53 .. :try_end_75} :catchall_120

    :goto_75
    move-object/from16 v16, v12

    .line 359
    nop

    .line 360
    const-string v12, ""

    const/4 v13, 0x1

    if-nez v10, :cond_87

    if-ltz v11, :cond_87

    :try_start_7f
    array-length v14, v4

    if-ge v11, v14, :cond_87

    aget-object v10, v4, v11

    move-object/from16 v17, v10

    goto :goto_95

    .line 361
    :cond_87
    if-ne v10, v13, :cond_93

    if-ltz v11, :cond_93

    array-length v10, v5

    if-ge v11, v10, :cond_93

    aget-object v10, v5, v11

    move-object/from16 v17, v10

    goto :goto_95

    .line 362
    :cond_93
    move-object/from16 v17, v12

    :goto_95
    nop

    .line 363
    invoke-interface {v2, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v2, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    const/4 v11, 0x2

    invoke-interface {v2, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    .line 364
    const/4 v11, 0x5

    invoke-interface {v2, v11}, Landroid/database/Cursor;->isNull(I)Z

    move-result v13

    if-eqz v13, :cond_b1

    move-object/from16 v18, v12

    goto :goto_b7

    :cond_b1
    invoke-interface {v2, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    move-object/from16 v18, v11

    :goto_b7
    move-object v13, v10

    filled-new-array/range {v13 .. v18}, [Ljava/lang/String;

    move-result-object v10

    .line 362
    invoke-static {v7, v10}, Lcom/food/diary/sync/ModernBackupActivity;->writeCsvRow(Ljava/io/BufferedWriter;[Ljava/lang/String;)V

    .line 365
    add-int/lit8 v9, v9, 0x1

    .line 366
    goto :goto_5b

    .line 367
    :cond_c2
    invoke-virtual {v7}, Ljava/io/BufferedWriter;->flush()V

    .line 368
    nop

    .line 369
    new-instance v0, Lcom/food/diary/sync/ModernBackupActivity$6;

    invoke-direct {v0, v1, v9}, Lcom/food/diary/sync/ModernBackupActivity$6;-><init>(Lcom/food/diary/sync/ModernBackupActivity;I)V

    invoke-virtual {v1, v0}, Lcom/food/diary/sync/ModernBackupActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_ce
    .catch Ljava/lang/Exception; {:try_start_7f .. :try_end_ce} :catch_de
    .catchall {:try_start_7f .. :try_end_ce} :catchall_120

    .line 383
    if-eqz v2, :cond_d3

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 384
    :cond_d3
    if-eqz v8, :cond_d8

    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 385
    :cond_d8
    :try_start_d8
    invoke-virtual {v7}, Ljava/io/BufferedWriter;->close()V
    :try_end_db
    .catch Ljava/io/IOException; {:try_start_d8 .. :try_end_db} :catch_dc

    goto :goto_11f

    :catch_dc
    move-exception v0

    goto :goto_11f

    .line 375
    :catch_de
    move-exception v0

    goto :goto_100

    .line 383
    :catchall_e0
    move-exception v0

    move-object v3, v0

    move-object v8, v2

    goto :goto_122

    .line 375
    :catch_e4
    move-exception v0

    move-object v8, v2

    goto :goto_100

    .line 383
    :catchall_e7
    move-exception v0

    move-object v3, v0

    move-object v7, v2

    goto :goto_fa

    .line 375
    :catch_eb
    move-exception v0

    move-object v7, v2

    goto :goto_ff

    .line 348
    :cond_ee
    :try_start_ee
    new-instance v0, Ljava/io/IOException;

    const-string v3, "Cannot create selected file"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_f6
    .catch Ljava/lang/Exception; {:try_start_ee .. :try_end_f6} :catch_eb
    .catchall {:try_start_ee .. :try_end_f6} :catchall_e7

    .line 383
    :catchall_f6
    move-exception v0

    move-object v3, v0

    move-object v6, v2

    move-object v7, v6

    :goto_fa
    move-object v8, v7

    goto :goto_122

    .line 375
    :catch_fc
    move-exception v0

    move-object v6, v2

    move-object v7, v6

    :goto_ff
    move-object v8, v7

    .line 376
    :goto_100
    :try_start_100
    new-instance v3, Lcom/food/diary/sync/ModernBackupActivity$7;

    invoke-direct {v3, v1, v0}, Lcom/food/diary/sync/ModernBackupActivity$7;-><init>(Lcom/food/diary/sync/ModernBackupActivity;Ljava/lang/Exception;)V

    invoke-virtual {v1, v3}, Lcom/food/diary/sync/ModernBackupActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_108
    .catchall {:try_start_100 .. :try_end_108} :catchall_120

    .line 383
    if-eqz v2, :cond_10d

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 384
    :cond_10d
    if-eqz v8, :cond_112

    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 385
    :cond_112
    if-eqz v7, :cond_118

    :try_start_114
    invoke-virtual {v7}, Ljava/io/BufferedWriter;->close()V
    :try_end_117
    .catch Ljava/io/IOException; {:try_start_114 .. :try_end_117} :catch_dc

    goto :goto_11f

    .line 386
    :cond_118
    if-eqz v6, :cond_11f

    :try_start_11a
    invoke-virtual {v6}, Ljava/io/OutputStream;->close()V
    :try_end_11d
    .catch Ljava/io/IOException; {:try_start_11a .. :try_end_11d} :catch_11e

    goto :goto_11f

    :catch_11e
    move-exception v0

    .line 388
    :cond_11f
    :goto_11f
    return-void

    .line 383
    :catchall_120
    move-exception v0

    move-object v3, v0

    :goto_122
    if-eqz v2, :cond_127

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 384
    :cond_127
    if-eqz v8, :cond_12c

    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 385
    :cond_12c
    if-nez v7, :cond_136

    .line 386
    if-eqz v6, :cond_13b

    :try_start_130
    invoke-virtual {v6}, Ljava/io/OutputStream;->close()V
    :try_end_133
    .catch Ljava/io/IOException; {:try_start_130 .. :try_end_133} :catch_134

    goto :goto_13b

    :catch_134
    move-exception v0

    goto :goto_13b

    .line 385
    :cond_136
    :try_start_136
    invoke-virtual {v7}, Ljava/io/BufferedWriter;->close()V
    :try_end_139
    .catch Ljava/io/IOException; {:try_start_136 .. :try_end_139} :catch_13a

    goto :goto_13b

    :catch_13a
    move-exception v0

    .line 387
    :cond_13b
    :goto_13b
    goto :goto_13d

    :goto_13c
    throw v3

    :goto_13d
    goto :goto_13c
.end method

.method private finishWithResult()V
    .registers 2

    .line 109
    iget-boolean v0, p0, Lcom/food/diary/sync/ModernBackupActivity;->importedAnything:Z

    if-eqz v0, :cond_8

    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lcom/food/diary/sync/ModernBackupActivity;->setResult(I)V

    .line 110
    :cond_8
    invoke-virtual {p0}, Lcom/food/diary/sync/ModernBackupActivity;->finish()V

    .line 111
    return-void
.end method

.method private importCsv(Landroid/net/Uri;)V
    .registers 21

    .line 254
    move-object/from16 v1, p0

    .line 255
    nop

    .line 256
    nop

    .line 257
    nop

    .line 258
    nop

    .line 260
    const v0, 0x7f030005

    :try_start_9
    invoke-direct {v1, v0}, Lcom/food/diary/sync/ModernBackupActivity;->indexMap(I)Ljava/util/Map;

    move-result-object v3

    .line 261
    const v0, 0x7f030004

    invoke-direct {v1, v0}, Lcom/food/diary/sync/ModernBackupActivity;->indexMap(I)Ljava/util/Map;

    move-result-object v4

    .line 262
    const v0, 0x7f030003

    invoke-direct {v1, v0}, Lcom/food/diary/sync/ModernBackupActivity;->indexMap(I)Ljava/util/Map;

    move-result-object v5

    .line 263
    invoke-virtual/range {p0 .. p0}, Lcom/food/diary/sync/ModernBackupActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    move-object/from16 v6, p1

    invoke-virtual {v0, v6}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v6
    :try_end_25
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_25} :catch_1e5
    .catchall {:try_start_9 .. :try_end_25} :catchall_1e0

    .line 264
    if-eqz v6, :cond_1d5

    .line 265
    :try_start_27
    new-instance v7, Lcom/food/diary/sync/ModernBackupActivity$CsvReader;

    invoke-direct {v7, v6}, Lcom/food/diary/sync/ModernBackupActivity$CsvReader;-><init>(Ljava/io/InputStream;)V

    .line 266
    invoke-direct/range {p0 .. p0}, Lcom/food/diary/sync/ModernBackupActivity;->openDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v8
    :try_end_30
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_30} :catch_1d2
    .catchall {:try_start_27 .. :try_end_30} :catchall_1cf

    .line 267
    :try_start_30
    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 268
    const/4 v9, 0x1

    const/4 v10, 0x0

    const/4 v0, 0x1

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    .line 270
    :goto_39
    invoke-virtual {v7}, Lcom/food/diary/sync/ModernBackupActivity$CsvReader;->next()Ljava/util/List;

    move-result-object v14
    :try_end_3d
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_3d} :catch_1cc
    .catchall {:try_start_30 .. :try_end_3d} :catchall_1c8

    const-string v15, ""

    const/4 v2, -0x1

    if-eqz v14, :cond_14d

    .line 271
    :try_start_42
    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v16
    :try_end_46
    .catch Ljava/lang/Exception; {:try_start_42 .. :try_end_46} :catch_1cc
    .catchall {:try_start_42 .. :try_end_46} :catchall_1c8

    if-nez v16, :cond_49

    goto :goto_39

    .line 272
    :cond_49
    if-eqz v0, :cond_5b

    .line 273
    nop

    .line 274
    :try_start_4c
    invoke-interface {v14, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_55
    .catch Ljava/lang/Exception; {:try_start_4c .. :try_end_55} :catch_58
    .catchall {:try_start_4c .. :try_end_55} :catchall_1c8

    .line 275
    const/16 v16, 0x0

    goto :goto_5d

    :catch_58
    move-exception v0

    const/4 v0, 0x0

    goto :goto_39

    .line 272
    :cond_5b
    move/from16 v16, v0

    .line 277
    :goto_5d
    :try_start_5d
    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v0
    :try_end_61
    .catch Ljava/lang/Exception; {:try_start_5d .. :try_end_61} :catch_1cc
    .catchall {:try_start_5d .. :try_end_61} :catchall_1c8

    const/4 v10, 0x6

    if-ge v0, v10, :cond_6a

    add-int/lit8 v12, v12, 0x1

    move/from16 v0, v16

    const/4 v10, 0x0

    goto :goto_39

    .line 279
    :cond_6a
    :try_start_6a
    invoke-interface {v14, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 280
    const/4 v10, 0x2

    invoke-interface {v14, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-virtual {v10}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v10

    .line 281
    const/4 v9, 0x3

    invoke-interface {v14, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-direct {v1, v3, v9, v2}, Lcom/food/diary/sync/ModernBackupActivity;->valueIndex(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v2

    .line 282
    if-gez v2, :cond_93

    add-int/lit8 v12, v12, 0x1

    move/from16 v0, v16

    const/4 v9, 0x1

    const/4 v10, 0x0

    goto :goto_39

    .line 283
    :cond_93
    nop

    .line 284
    const/4 v9, 0x4

    if-nez v2, :cond_a6

    invoke-interface {v14, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;
    :try_end_9d
    .catch Ljava/lang/Exception; {:try_start_6a .. :try_end_9d} :catch_13b
    .catchall {:try_start_6a .. :try_end_9d} :catchall_1c8

    move-object/from16 v17, v3

    const/4 v3, 0x0

    :try_start_a0
    invoke-direct {v1, v4, v9, v3}, Lcom/food/diary/sync/ModernBackupActivity;->valueIndex(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v9
    :try_end_a4
    .catch Ljava/lang/Exception; {:try_start_a0 .. :try_end_a4} :catch_139
    .catchall {:try_start_a0 .. :try_end_a4} :catchall_1c8

    const/4 v3, 0x0

    goto :goto_bd

    .line 285
    :cond_a6
    move-object/from16 v17, v3

    const/4 v3, 0x1

    if-ne v2, v3, :cond_bb

    :try_start_ab
    invoke-interface {v14, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;
    :try_end_b1
    .catch Ljava/lang/Exception; {:try_start_ab .. :try_end_b1} :catch_b7
    .catchall {:try_start_ab .. :try_end_b1} :catchall_1c8

    const/4 v3, 0x0

    :try_start_b2
    invoke-direct {v1, v5, v9, v3}, Lcom/food/diary/sync/ModernBackupActivity;->valueIndex(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v9

    goto :goto_bd

    .line 303
    :catch_b7
    move-exception v0

    const/4 v3, 0x0

    goto/16 :goto_13e

    .line 285
    :cond_bb
    const/4 v3, 0x0

    const/4 v9, 0x0

    .line 286
    :goto_bd
    const/4 v3, 0x5

    invoke-interface {v14, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v18

    if-nez v18, :cond_c5

    goto :goto_cc

    :cond_c5
    invoke-interface {v14, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    move-object v15, v3

    check-cast v15, Ljava/lang/String;

    .line 288
    :goto_cc
    const-string v3, "SELECT 1 FROM [Event] WHERE [Date]=? AND [Time]=? AND [TypeKey]=? AND [SubTypeKey]=? AND COALESCE([Description],\'\')=? LIMIT 1"

    .line 290
    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v14
    :try_end_d2
    .catch Ljava/lang/Exception; {:try_start_b2 .. :try_end_d2} :catch_139
    .catchall {:try_start_b2 .. :try_end_d2} :catchall_1c8

    move-object/from16 v18, v4

    :try_start_d4
    invoke-static {v9}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    filled-new-array {v0, v10, v14, v4, v15}, [Ljava/lang/String;

    move-result-object v4

    .line 288
    invoke-virtual {v8, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3
    :try_end_e0
    .catch Ljava/lang/Exception; {:try_start_d4 .. :try_end_e0} :catch_137
    .catchall {:try_start_d4 .. :try_end_e0} :catchall_1c8

    .line 292
    :try_start_e0
    invoke-interface {v3}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4
    :try_end_e4
    .catchall {:try_start_e0 .. :try_end_e4} :catchall_12e

    :try_start_e4
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 293
    if-eqz v4, :cond_f5

    add-int/lit8 v13, v13, 0x1

    move/from16 v0, v16

    move-object/from16 v3, v17

    move-object/from16 v4, v18

    const/4 v9, 0x1

    const/4 v10, 0x0

    goto/16 :goto_39

    .line 295
    :cond_f5
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 296
    const-string v4, "Date"

    invoke-virtual {v3, v4, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 297
    const-string v0, "Time"

    invoke-virtual {v3, v0, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 298
    const-string v0, "TypeKey"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v3, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 299
    const-string v0, "SubTypeKey"

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v3, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 300
    const-string v0, "Description"

    invoke-virtual {v3, v0, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 301
    const-string v0, "Event"
    :try_end_11d
    .catch Ljava/lang/Exception; {:try_start_e4 .. :try_end_11d} :catch_137
    .catchall {:try_start_e4 .. :try_end_11d} :catchall_1c8

    const/4 v2, 0x0

    :try_start_11e
    invoke-virtual {v8, v0, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v3

    .line 302
    const-wide/16 v9, 0x0

    cmp-long v0, v3, v9

    if-ltz v0, :cond_12b

    add-int/lit8 v11, v11, 0x1

    goto :goto_143

    :cond_12b
    add-int/lit8 v12, v12, 0x1

    goto :goto_143

    .line 292
    :catchall_12e
    move-exception v0

    const/4 v2, 0x0

    move-object v4, v0

    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    throw v4
    :try_end_135
    .catch Ljava/lang/Exception; {:try_start_11e .. :try_end_135} :catch_135
    .catchall {:try_start_11e .. :try_end_135} :catchall_1c8

    .line 303
    :catch_135
    move-exception v0

    goto :goto_141

    :catch_137
    move-exception v0

    goto :goto_140

    :catch_139
    move-exception v0

    goto :goto_13e

    :catch_13b
    move-exception v0

    move-object/from16 v17, v3

    :goto_13e
    move-object/from16 v18, v4

    :goto_140
    const/4 v2, 0x0

    .line 304
    :goto_141
    add-int/lit8 v12, v12, 0x1

    .line 305
    :goto_143
    move/from16 v0, v16

    move-object/from16 v3, v17

    move-object/from16 v4, v18

    const/4 v9, 0x1

    const/4 v10, 0x0

    goto/16 :goto_39

    .line 307
    :cond_14d
    :try_start_14d
    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    .line 308
    iget-boolean v0, v1, Lcom/food/diary/sync/ModernBackupActivity;->importedAnything:Z

    if-nez v0, :cond_159

    if-lez v11, :cond_157

    goto :goto_159

    :cond_157
    const/4 v9, 0x0

    goto :goto_15a

    :cond_159
    :goto_159
    const/4 v9, 0x1

    :goto_15a
    iput-boolean v9, v1, Lcom/food/diary/sync/ModernBackupActivity;->importedAnything:Z

    .line 309
    if-lez v11, :cond_164

    .line 310
    invoke-virtual {v1, v2}, Lcom/food/diary/sync/ModernBackupActivity;->setResult(I)V

    .line 311
    invoke-static/range {p0 .. p0}, Lcom/food/diary/sync/DiarySyncManager;->schedule(Landroid/content/Context;)V

    .line 313
    :cond_164
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Import complete: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " added, "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " duplicates"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 314
    if-lez v12, :cond_19e

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " skipped"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    :cond_19e
    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 315
    new-instance v2, Lcom/food/diary/sync/ModernBackupActivity$4;

    invoke-direct {v2, v1, v0}, Lcom/food/diary/sync/ModernBackupActivity$4;-><init>(Lcom/food/diary/sync/ModernBackupActivity;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/food/diary/sync/ModernBackupActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_1ae
    .catch Ljava/lang/Exception; {:try_start_14d .. :try_end_1ae} :catch_1cc
    .catchall {:try_start_14d .. :try_end_1ae} :catchall_1c8

    .line 328
    if-eqz v8, :cond_1c0

    .line 329
    :try_start_1b0
    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result v0

    if-eqz v0, :cond_1bb

    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_1b9
    .catch Ljava/lang/Exception; {:try_start_1b0 .. :try_end_1b9} :catch_1ba

    goto :goto_1bb

    :catch_1ba
    move-exception v0

    .line 330
    :cond_1bb
    :goto_1bb
    :try_start_1bb
    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_1be
    .catch Ljava/lang/Exception; {:try_start_1bb .. :try_end_1be} :catch_1bf

    goto :goto_1c0

    :catch_1bf
    move-exception v0

    .line 332
    :cond_1c0
    :goto_1c0
    if-eqz v6, :cond_207

    :try_start_1c2
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V
    :try_end_1c5
    .catch Ljava/io/IOException; {:try_start_1c2 .. :try_end_1c5} :catch_1c6

    goto :goto_207

    :catch_1c6
    move-exception v0

    goto :goto_207

    .line 328
    :catchall_1c8
    move-exception v0

    move-object v3, v0

    move-object v2, v8

    goto :goto_20a

    .line 320
    :catch_1cc
    move-exception v0

    move-object v2, v8

    goto :goto_1e8

    .line 328
    :catchall_1cf
    move-exception v0

    const/4 v2, 0x0

    goto :goto_209

    .line 320
    :catch_1d2
    move-exception v0

    const/4 v2, 0x0

    goto :goto_1e8

    .line 264
    :cond_1d5
    const/4 v2, 0x0

    :try_start_1d6
    new-instance v0, Ljava/io/IOException;

    const-string v3, "Cannot open selected file"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1de
    .catch Ljava/lang/Exception; {:try_start_1d6 .. :try_end_1de} :catch_1de
    .catchall {:try_start_1d6 .. :try_end_1de} :catchall_208

    .line 320
    :catch_1de
    move-exception v0

    goto :goto_1e8

    .line 328
    :catchall_1e0
    move-exception v0

    const/4 v2, 0x0

    move-object v3, v0

    move-object v6, v2

    goto :goto_20a

    .line 320
    :catch_1e5
    move-exception v0

    const/4 v2, 0x0

    move-object v6, v2

    .line 321
    :goto_1e8
    :try_start_1e8
    new-instance v3, Lcom/food/diary/sync/ModernBackupActivity$5;

    invoke-direct {v3, v1, v0}, Lcom/food/diary/sync/ModernBackupActivity$5;-><init>(Lcom/food/diary/sync/ModernBackupActivity;Ljava/lang/Exception;)V

    invoke-virtual {v1, v3}, Lcom/food/diary/sync/ModernBackupActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_1f0
    .catchall {:try_start_1e8 .. :try_end_1f0} :catchall_208

    .line 328
    if-eqz v2, :cond_202

    .line 329
    :try_start_1f2
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result v0

    if-eqz v0, :cond_1fd

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_1fb
    .catch Ljava/lang/Exception; {:try_start_1f2 .. :try_end_1fb} :catch_1fc

    goto :goto_1fd

    :catch_1fc
    move-exception v0

    .line 330
    :cond_1fd
    :goto_1fd
    :try_start_1fd
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_200
    .catch Ljava/lang/Exception; {:try_start_1fd .. :try_end_200} :catch_201

    goto :goto_202

    :catch_201
    move-exception v0

    .line 332
    :cond_202
    :goto_202
    if-eqz v6, :cond_207

    :try_start_204
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V
    :try_end_207
    .catch Ljava/io/IOException; {:try_start_204 .. :try_end_207} :catch_1c6

    .line 334
    :cond_207
    :goto_207
    return-void

    .line 328
    :catchall_208
    move-exception v0

    :goto_209
    move-object v3, v0

    :goto_20a
    if-eqz v2, :cond_21c

    .line 329
    :try_start_20c
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result v0

    if-eqz v0, :cond_217

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_215
    .catch Ljava/lang/Exception; {:try_start_20c .. :try_end_215} :catch_216

    goto :goto_217

    :catch_216
    move-exception v0

    .line 330
    :cond_217
    :goto_217
    :try_start_217
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_21a
    .catch Ljava/lang/Exception; {:try_start_217 .. :try_end_21a} :catch_21b

    goto :goto_21c

    :catch_21b
    move-exception v0

    .line 332
    :cond_21c
    :goto_21c
    if-eqz v6, :cond_223

    :try_start_21e
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V
    :try_end_221
    .catch Ljava/io/IOException; {:try_start_21e .. :try_end_221} :catch_222

    goto :goto_223

    :catch_222
    move-exception v0

    .line 333
    :cond_223
    :goto_223
    goto :goto_225

    :goto_224
    throw v3

    :goto_225
    goto :goto_224
.end method

.method private indexMap(I)Ljava/util/Map;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 242
    invoke-virtual {p0}, Lcom/food/diary/sync/ModernBackupActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object p1

    .line 243
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 244
    const/4 v1, 0x0

    :goto_e
    array-length v2, p1

    if-ge v1, v2, :cond_21

    aget-object v2, p1, v1

    invoke-static {v2}, Lcom/food/diary/sync/ModernBackupActivity;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    .line 245
    :cond_21
    return-object v0
.end method

.method private static key(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 238
    if-nez p0, :cond_5

    const-string p0, ""

    goto :goto_f

    :cond_5
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    :goto_f
    return-object p0
.end method

.method private openDb()Landroid/database/sqlite/SQLiteDatabase;
    .registers 4

    .line 233
    nop

    .line 234
    const-string v0, "Events.db"

    invoke-virtual {p0, v0}, Lcom/food/diary/sync/ModernBackupActivity;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    .line 233
    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->openDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method private pageRoot()Landroid/widget/LinearLayout;
    .registers 6

    .line 137
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 138
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 139
    const/16 v1, 0x10

    invoke-direct {p0, v1}, Lcom/food/diary/sync/ModernBackupActivity;->dp(I)I

    move-result v2

    const/16 v3, 0xe

    invoke-direct {p0, v3}, Lcom/food/diary/sync/ModernBackupActivity;->dp(I)I

    move-result v3

    invoke-direct {p0, v1}, Lcom/food/diary/sync/ModernBackupActivity;->dp(I)I

    move-result v4

    invoke-direct {p0, v1}, Lcom/food/diary/sync/ModernBackupActivity;->dp(I)I

    move-result v1

    invoke-virtual {v0, v2, v3, v4, v1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 140
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    const/4 v2, -0x1

    invoke-direct {v1, v2, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 143
    return-object v0
.end method

.method private paragraph(Ljava/lang/String;)Landroid/widget/TextView;
    .registers 5

    .line 118
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 119
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 120
    const/high16 p1, 0x41600000    # 14.0f

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 121
    const/4 p1, 0x4

    invoke-direct {p0, p1}, Lcom/food/diary/sync/ModernBackupActivity;->dp(I)I

    move-result p1

    const/16 v1, 0xc

    invoke-direct {p0, v1}, Lcom/food/diary/sync/ModernBackupActivity;->dp(I)I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, p1, v2, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 122
    return-object v0
.end method

.method private refreshSyncFragment()V
    .registers 3

    .line 228
    invoke-virtual {p0}, Lcom/food/diary/sync/ModernBackupActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    const-string v1, "android:switcher:2131296378:2"

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    .line 229
    instance-of v1, v0, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;

    if-eqz v1, :cond_13

    check-cast v0, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;

    invoke-virtual {v0}, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;->renderSyncStatus()V

    .line 230
    :cond_13
    return-void
.end method

.method private valueIndex(Ljava/util/Map;Ljava/lang/String;I)I
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/lang/String;",
            "I)I"
        }
    .end annotation

    .line 249
    invoke-static {p2}, Lcom/food/diary/sync/ModernBackupActivity;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    .line 250
    if-nez p1, :cond_d

    goto :goto_11

    :cond_d
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p3

    :goto_11
    return p3
.end method

.method private static writeCsvRow(Ljava/io/BufferedWriter;[Ljava/lang/String;)V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 391
    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_2
    array-length v2, p1

    const/16 v3, 0xa

    if-ge v1, v2, :cond_5d

    .line 392
    const/16 v2, 0x2c

    if-lez v1, :cond_e

    invoke-virtual {p0, v2}, Ljava/io/BufferedWriter;->write(I)V

    .line 393
    :cond_e
    aget-object v4, p1, v1

    if-nez v4, :cond_15

    const-string v4, ""

    goto :goto_17

    :cond_15
    aget-object v4, p1, v1

    .line 394
    :goto_17
    invoke-virtual {v4, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    const/16 v5, 0x22

    if-gez v2, :cond_36

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-gez v2, :cond_36

    .line 395
    invoke-virtual {v4, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-gez v2, :cond_36

    const/16 v2, 0xd

    invoke-virtual {v4, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-ltz v2, :cond_34

    goto :goto_36

    :cond_34
    const/4 v2, 0x0

    goto :goto_37

    :cond_36
    :goto_36
    const/4 v2, 0x1

    .line 396
    :goto_37
    if-eqz v2, :cond_3c

    invoke-virtual {p0, v5}, Ljava/io/BufferedWriter;->write(I)V

    .line 397
    :cond_3c
    const/4 v3, 0x0

    :goto_3d
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v3, v6, :cond_55

    .line 398
    invoke-virtual {v4, v3}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 399
    if-ne v6, v5, :cond_4f

    const-string v6, "\"\""

    invoke-virtual {p0, v6}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    goto :goto_52

    :cond_4f
    invoke-virtual {p0, v6}, Ljava/io/BufferedWriter;->write(I)V

    .line 397
    :goto_52
    add-int/lit8 v3, v3, 0x1

    goto :goto_3d

    .line 401
    :cond_55
    if-eqz v2, :cond_5a

    invoke-virtual {p0, v5}, Ljava/io/BufferedWriter;->write(I)V

    .line 391
    :cond_5a
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 403
    :cond_5d
    invoke-virtual {p0, v3}, Ljava/io/BufferedWriter;->write(I)V

    .line 404
    return-void
.end method


# virtual methods
.method launchDrivePicker()V
    .registers 3

    .line 164
    const-string v0, "In the system picker open the left menu and choose Google Drive, then choose where FoodDiary.json should be created."

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 166
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 167
    invoke-static {p0}, Lcom/food/diary/sync/DiarySyncManager;->launchPicker(Landroid/app/Activity;)V

    .line 168
    return-void
.end method

.method launchExportCsv()V
    .registers 4

    .line 156
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.CREATE_DOCUMENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 157
    const-string v1, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 158
    const-string v1, "text/csv"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 159
    const-string v1, "android.intent.extra.TITLE"

    const-string v2, "FoodDiary-export.csv"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 160
    const v1, 0xc502

    invoke-virtual {p0, v0, v1}, Lcom/food/diary/sync/ModernBackupActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 161
    return-void
.end method

.method launchImportCsv()V
    .registers 6

    .line 147
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.OPEN_DOCUMENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 148
    const-string v1, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 149
    const-string v1, "text/*"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 150
    const-string v1, "text/plain"

    const-string v2, "application/csv"

    const-string v3, "text/csv"

    const-string v4, "text/comma-separated-values"

    filled-new-array {v3, v4, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "android.intent.extra.MIME_TYPES"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    .line 152
    const v1, 0xc501

    invoke-virtual {p0, v0, v1}, Lcom/food/diary/sync/ModernBackupActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 153
    return-void
.end method

.method manualSync(Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;)V
    .registers 4

    .line 171
    invoke-static {p0}, Lcom/food/diary/sync/DiarySyncManager;->isGoogleDrive(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_a

    .line 172
    invoke-virtual {p0}, Lcom/food/diary/sync/ModernBackupActivity;->launchDrivePicker()V

    .line 173
    return-void

    .line 175
    :cond_a
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;->setSyncButtonEnabled(Z)V

    .line 176
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/food/diary/sync/ModernBackupActivity$1;

    invoke-direct {v1, p0, p1}, Lcom/food/diary/sync/ModernBackupActivity$1;-><init>(Lcom/food/diary/sync/ModernBackupActivity;Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;)V

    const-string p1, "FoodDiaryManualSync"

    invoke-direct {v0, v1, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 190
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 191
    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .registers 6

    .line 195
    invoke-static {p0, p1, p2, p3}, Lcom/food/diary/sync/DiarySyncManager;->handleActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)Z

    move-result v0

    const/4 v1, -0x1

    if-eqz v0, :cond_48

    .line 196
    if-ne p2, v1, :cond_44

    .line 197
    invoke-static {p0}, Lcom/food/diary/sync/DiarySyncManager;->isGoogleDrive(Landroid/content/Context;)Z

    move-result p1

    const/4 p2, 0x1

    if-eqz p1, :cond_1a

    .line 198
    const-string p1, "Google Drive selected. Food Diary can now update this Drive document."

    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    .line 200
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    goto :goto_44

    .line 201
    :cond_1a
    invoke-static {p0}, Lcom/food/diary/sync/DiarySyncManager;->isConfigured(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_44

    .line 202
    invoke-static {p0}, Lcom/food/diary/sync/DiarySyncManager;->getProviderName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    .line 203
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Local/non-Drive target selected ("

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p3, "). This is a local backup, not Google Drive sync."

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    .line 205
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 208
    :cond_44
    :goto_44
    invoke-direct {p0}, Lcom/food/diary/sync/ModernBackupActivity;->refreshSyncFragment()V

    .line 209
    return-void

    .line 212
    :cond_48
    invoke-super {p0, p1, p2, p3}, Landroidx/appcompat/app/AppCompatActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 213
    if-ne p2, v1, :cond_8e

    if-eqz p3, :cond_8e

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p2

    if-nez p2, :cond_56

    goto :goto_8e

    .line 214
    :cond_56
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p2

    .line 215
    const p3, 0xc501

    if-ne p1, p3, :cond_79

    .line 216
    const-string p1, "Importing\u2026"

    const/4 p3, 0x0

    invoke-static {p0, p1, p3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 217
    new-instance p1, Ljava/lang/Thread;

    new-instance p3, Lcom/food/diary/sync/ModernBackupActivity$2;

    invoke-direct {p3, p0, p2}, Lcom/food/diary/sync/ModernBackupActivity$2;-><init>(Lcom/food/diary/sync/ModernBackupActivity;Landroid/net/Uri;)V

    const-string p2, "FoodDiaryCsvImport"

    invoke-direct {p1, p3, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 219
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    goto :goto_8d

    .line 220
    :cond_79
    const p3, 0xc502

    if-ne p1, p3, :cond_8d

    .line 221
    new-instance p1, Ljava/lang/Thread;

    new-instance p3, Lcom/food/diary/sync/ModernBackupActivity$3;

    invoke-direct {p3, p0, p2}, Lcom/food/diary/sync/ModernBackupActivity$3;-><init>(Lcom/food/diary/sync/ModernBackupActivity;Landroid/net/Uri;)V

    const-string p2, "FoodDiaryCsvExport"

    invoke-direct {p1, p3, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 223
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 225
    :cond_8d
    :goto_8d
    return-void

    .line 213
    :cond_8e
    :goto_8e
    return-void
.end method

.method public onBackPressed()V
    .registers 1

    .line 105
    invoke-direct {p0}, Lcom/food/diary/sync/ModernBackupActivity;->finishWithResult()V

    .line 106
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 5

    .line 70
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 71
    const p1, 0x7f0c001c

    invoke-virtual {p0, p1}, Lcom/food/diary/sync/ModernBackupActivity;->setContentView(I)V

    .line 73
    const p1, 0x7f0901e0

    invoke-virtual {p0, p1}, Lcom/food/diary/sync/ModernBackupActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/appcompat/widget/Toolbar;

    .line 74
    invoke-virtual {p0, p1}, Lcom/food/diary/sync/ModernBackupActivity;->setSupportActionBar(Landroidx/appcompat/widget/Toolbar;)V

    .line 75
    invoke-virtual {p0}, Lcom/food/diary/sync/ModernBackupActivity;->getSupportActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object p1

    .line 76
    const/4 v0, 0x1

    if-eqz p1, :cond_24

    .line 77
    invoke-virtual {p1, v0}, Landroidx/appcompat/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 78
    const-string v1, "Backup & Sync"

    invoke-virtual {p1, v1}, Landroidx/appcompat/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 81
    :cond_24
    const p1, 0x7f09007a

    invoke-virtual {p0, p1}, Lcom/food/diary/sync/ModernBackupActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/viewpager/widget/ViewPager;

    iput-object p1, p0, Lcom/food/diary/sync/ModernBackupActivity;->pager:Landroidx/viewpager/widget/ViewPager;

    .line 82
    iget-object p1, p0, Lcom/food/diary/sync/ModernBackupActivity;->pager:Landroidx/viewpager/widget/ViewPager;

    new-instance v1, Lcom/food/diary/sync/ModernBackupActivity$SectionsPagerAdapter;

    invoke-virtual {p0}, Lcom/food/diary/sync/ModernBackupActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/food/diary/sync/ModernBackupActivity$SectionsPagerAdapter;-><init>(Landroidx/fragment/app/FragmentManager;)V

    invoke-virtual {p1, v1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Landroidx/viewpager/widget/PagerAdapter;)V

    .line 84
    const p1, 0x7f0901bd

    invoke-virtual {p0, p1}, Lcom/food/diary/sync/ModernBackupActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/tabs/TabLayout;

    .line 85
    iget-object v1, p0, Lcom/food/diary/sync/ModernBackupActivity;->pager:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {p1, v1}, Lcom/google/android/material/tabs/TabLayout;->setupWithViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 86
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    move-result-object v1

    .line 87
    invoke-virtual {p1, v0}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    move-result-object v0

    .line 88
    const/4 v2, 0x2

    invoke-virtual {p1, v2}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    move-result-object p1

    .line 89
    if-eqz v1, :cond_61

    const v2, 0x7f08013a

    invoke-virtual {v1, v2}, Lcom/google/android/material/tabs/TabLayout$Tab;->setIcon(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 90
    :cond_61
    if-eqz v0, :cond_69

    const v1, 0x7f08013b

    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout$Tab;->setIcon(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 91
    :cond_69
    if-eqz p1, :cond_71

    const v0, 0x7f080139

    invoke-virtual {p1, v0}, Lcom/google/android/material/tabs/TabLayout$Tab;->setIcon(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 92
    :cond_71
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .registers 4

    .line 96
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x102002c

    if-ne v0, v1, :cond_e

    .line 97
    invoke-direct {p0}, Lcom/food/diary/sync/ModernBackupActivity;->finishWithResult()V

    .line 98
    const/4 p1, 0x1

    return p1

    .line 100
    :cond_e
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method
