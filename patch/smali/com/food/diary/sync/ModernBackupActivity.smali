.class public Lcom/food/diary/sync/ModernBackupActivity;
.super Landroid/app/Activity;
.source "ModernBackupActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/food/diary/sync/ModernBackupActivity$CsvReader;
    }
.end annotation


# static fields
.field private static final ARRAY_CSV_HEADERS:I = 0x7f030000

.field private static final ARRAY_DRINK_TYPES:I = 0x7f030003

.field private static final ARRAY_EVENT_TYPES:I = 0x7f030005

.field private static final ARRAY_FOOD_TYPES:I = 0x7f030004

.field private static final REQ_EXPORT_CSV:I = 0xc502

.field private static final REQ_IMPORT_CSV:I = 0xc501


# instance fields
.field private importedAnything:Z

.field private status:Landroid/widget/TextView;

.field private syncNow:Landroid/widget/Button;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 38
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/food/diary/sync/ModernBackupActivity;)V
    .registers 1

    .line 38
    invoke-direct {p0}, Lcom/food/diary/sync/ModernBackupActivity;->launchImportCsv()V

    return-void
.end method

.method static synthetic access$100(Lcom/food/diary/sync/ModernBackupActivity;)V
    .registers 1

    .line 38
    invoke-direct {p0}, Lcom/food/diary/sync/ModernBackupActivity;->launchExportCsv()V

    return-void
.end method

.method static synthetic access$200(Lcom/food/diary/sync/ModernBackupActivity;)Landroid/widget/Button;
    .registers 1

    .line 38
    iget-object p0, p0, Lcom/food/diary/sync/ModernBackupActivity;->syncNow:Landroid/widget/Button;

    return-object p0
.end method

.method static synthetic access$300(Lcom/food/diary/sync/ModernBackupActivity;)V
    .registers 1

    .line 38
    invoke-direct {p0}, Lcom/food/diary/sync/ModernBackupActivity;->refreshStatus()V

    return-void
.end method

.method static synthetic access$400(Lcom/food/diary/sync/ModernBackupActivity;)V
    .registers 1

    .line 38
    invoke-direct {p0}, Lcom/food/diary/sync/ModernBackupActivity;->finishWithResult()V

    return-void
.end method

.method static synthetic access$500(Lcom/food/diary/sync/ModernBackupActivity;Landroid/net/Uri;)V
    .registers 2

    .line 38
    invoke-direct {p0, p1}, Lcom/food/diary/sync/ModernBackupActivity;->importCsv(Landroid/net/Uri;)V

    return-void
.end method

.method static synthetic access$600(Lcom/food/diary/sync/ModernBackupActivity;Landroid/net/Uri;)V
    .registers 2

    .line 38
    invoke-direct {p0, p1}, Lcom/food/diary/sync/ModernBackupActivity;->exportCsv(Landroid/net/Uri;)V

    return-void
.end method

.method private buildUi()V
    .registers 12

    .line 86
    new-instance v0, Landroid/widget/ScrollView;

    invoke-direct {v0, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 87
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 88
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 89
    const/16 v3, 0x14

    invoke-direct {p0, v3}, Lcom/food/diary/sync/ModernBackupActivity;->dp(I)I

    move-result v4

    const/16 v5, 0x12

    invoke-direct {p0, v5}, Lcom/food/diary/sync/ModernBackupActivity;->dp(I)I

    move-result v6

    invoke-direct {p0, v3}, Lcom/food/diary/sync/ModernBackupActivity;->dp(I)I

    move-result v3

    const/16 v7, 0x18

    invoke-direct {p0, v7}, Lcom/food/diary/sync/ModernBackupActivity;->dp(I)I

    move-result v7

    invoke-virtual {v1, v4, v6, v3, v7}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 90
    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 92
    const-string v3, "Backup & Sync"

    const/high16 v4, 0x41c00000    # 24.0f

    invoke-direct {p0, v3, v4}, Lcom/food/diary/sync/ModernBackupActivity;->text(Ljava/lang/String;F)Landroid/widget/TextView;

    move-result-object v3

    .line 93
    sget-object v4, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v3, v4, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 94
    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 96
    nop

    .line 97
    const-string v3, "com.food.diary"

    invoke-direct {p0, v3}, Lcom/food/diary/sync/ModernBackupActivity;->isPackageInstalled(Ljava/lang/String;)Z

    move-result v3

    const-string v4, "This Bl0ck154 build keeps its own local database. "

    if-eqz v3, :cond_59

    .line 98
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "The original Food Diary is installed, but Android does not allow another signed app to read its private database directly. Use the original app\'s CSV Share/Export once, then import that CSV here."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_6c

    .line 100
    :cond_59
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "To migrate an older Food Diary installation, import a CSV exported by it."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 102
    :goto_6c
    const/high16 v4, 0x41600000    # 14.0f

    invoke-direct {p0, v3, v4}, Lcom/food/diary/sync/ModernBackupActivity;->text(Ljava/lang/String;F)Landroid/widget/TextView;

    move-result-object v3

    .line 103
    const/4 v6, 0x4

    invoke-direct {p0, v6}, Lcom/food/diary/sync/ModernBackupActivity;->dp(I)I

    move-result v7

    const/16 v8, 0xe

    invoke-direct {p0, v8}, Lcom/food/diary/sync/ModernBackupActivity;->dp(I)I

    move-result v9

    const/4 v10, 0x0

    invoke-virtual {v3, v10, v7, v10, v9}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 104
    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 106
    const-string v3, "Move old history"

    const/high16 v7, 0x41900000    # 18.0f

    invoke-direct {p0, v3, v7}, Lcom/food/diary/sync/ModernBackupActivity;->text(Ljava/lang/String;F)Landroid/widget/TextView;

    move-result-object v3

    .line 107
    sget-object v9, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v3, v9, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 108
    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 110
    const-string v3, "Import old Food Diary CSV"

    invoke-direct {p0, v3}, Lcom/food/diary/sync/ModernBackupActivity;->button(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v3

    .line 111
    new-instance v9, Lcom/food/diary/sync/ModernBackupActivity$1;

    invoke-direct {v9, p0}, Lcom/food/diary/sync/ModernBackupActivity$1;-><init>(Lcom/food/diary/sync/ModernBackupActivity;)V

    invoke-virtual {v3, v9}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 114
    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 116
    const-string v3, "Export all records as CSV"

    invoke-direct {p0, v3}, Lcom/food/diary/sync/ModernBackupActivity;->button(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v3

    .line 117
    new-instance v9, Lcom/food/diary/sync/ModernBackupActivity$2;

    invoke-direct {v9, p0}, Lcom/food/diary/sync/ModernBackupActivity$2;-><init>(Lcom/food/diary/sync/ModernBackupActivity;)V

    invoke-virtual {v3, v9}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 120
    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 122
    const-string v3, "Google Drive sync"

    invoke-direct {p0, v3, v7}, Lcom/food/diary/sync/ModernBackupActivity;->text(Ljava/lang/String;F)Landroid/widget/TextView;

    move-result-object v3

    .line 123
    sget-object v7, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v3, v7, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 124
    invoke-direct {p0, v5}, Lcom/food/diary/sync/ModernBackupActivity;->dp(I)I

    move-result v2

    invoke-direct {p0, v6}, Lcom/food/diary/sync/ModernBackupActivity;->dp(I)I

    move-result v5

    invoke-virtual {v3, v10, v2, v10, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 125
    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 127
    const-string v2, ""

    invoke-direct {p0, v2, v4}, Lcom/food/diary/sync/ModernBackupActivity;->text(Ljava/lang/String;F)Landroid/widget/TextView;

    move-result-object v2

    iput-object v2, p0, Lcom/food/diary/sync/ModernBackupActivity;->status:Landroid/widget/TextView;

    .line 128
    iget-object v2, p0, Lcom/food/diary/sync/ModernBackupActivity;->status:Landroid/widget/TextView;

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 130
    const-string v2, "Choose / change sync file"

    invoke-direct {p0, v2}, Lcom/food/diary/sync/ModernBackupActivity;->button(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v2

    .line 131
    new-instance v3, Lcom/food/diary/sync/ModernBackupActivity$3;

    invoke-direct {v3, p0}, Lcom/food/diary/sync/ModernBackupActivity$3;-><init>(Lcom/food/diary/sync/ModernBackupActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 134
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 136
    const-string v2, "Sync now"

    invoke-direct {p0, v2}, Lcom/food/diary/sync/ModernBackupActivity;->button(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v2

    iput-object v2, p0, Lcom/food/diary/sync/ModernBackupActivity;->syncNow:Landroid/widget/Button;

    .line 137
    iget-object v2, p0, Lcom/food/diary/sync/ModernBackupActivity;->syncNow:Landroid/widget/Button;

    new-instance v3, Lcom/food/diary/sync/ModernBackupActivity$4;

    invoke-direct {v3, p0}, Lcom/food/diary/sync/ModernBackupActivity$4;-><init>(Lcom/food/diary/sync/ModernBackupActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 159
    iget-object v2, p0, Lcom/food/diary/sync/ModernBackupActivity;->syncNow:Landroid/widget/Button;

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 161
    const-string v2, "The JSON sync file is updated automatically after record changes. The local Events.db remains the source of truth."

    const/high16 v3, 0x41500000    # 13.0f

    invoke-direct {p0, v2, v3}, Lcom/food/diary/sync/ModernBackupActivity;->text(Ljava/lang/String;F)Landroid/widget/TextView;

    move-result-object v2

    .line 162
    const/16 v3, 0x8

    invoke-direct {p0, v3}, Lcom/food/diary/sync/ModernBackupActivity;->dp(I)I

    move-result v3

    invoke-direct {p0, v8}, Lcom/food/diary/sync/ModernBackupActivity;->dp(I)I

    move-result v4

    invoke-virtual {v2, v10, v3, v10, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 163
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 165
    const-string v2, "Back"

    invoke-direct {p0, v2}, Lcom/food/diary/sync/ModernBackupActivity;->button(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v2

    .line 166
    new-instance v3, Lcom/food/diary/sync/ModernBackupActivity$5;

    invoke-direct {v3, p0}, Lcom/food/diary/sync/ModernBackupActivity$5;-><init>(Lcom/food/diary/sync/ModernBackupActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 169
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 171
    invoke-virtual {p0, v0}, Lcom/food/diary/sync/ModernBackupActivity;->setContentView(Landroid/view/View;)V

    .line 172
    invoke-direct {p0}, Lcom/food/diary/sync/ModernBackupActivity;->refreshStatus()V

    .line 173
    return-void
.end method

.method private button(Ljava/lang/String;)Landroid/widget/Button;
    .registers 6

    .line 76
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 77
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 78
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {p1, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 80
    const/4 v1, 0x6

    invoke-direct {p0, v1}, Lcom/food/diary/sync/ModernBackupActivity;->dp(I)I

    move-result v2

    invoke-direct {p0, v1}, Lcom/food/diary/sync/ModernBackupActivity;->dp(I)I

    move-result v1

    const/4 v3, 0x0

    invoke-virtual {p1, v3, v2, v3, v1}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 81
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 82
    return-object v0
.end method

.method private dp(I)I
    .registers 3

    .line 64
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
    .registers 22

    .line 340
    move-object/from16 v1, p0

    .line 341
    nop

    .line 342
    nop

    .line 343
    nop

    .line 344
    nop

    .line 346
    const/4 v2, 0x0

    :try_start_7
    invoke-virtual/range {p0 .. p0}, Lcom/food/diary/sync/ModernBackupActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/high16 v3, 0x7f030000

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    .line 347
    invoke-virtual/range {p0 .. p0}, Lcom/food/diary/sync/ModernBackupActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f030005

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v3

    .line 348
    invoke-virtual/range {p0 .. p0}, Lcom/food/diary/sync/ModernBackupActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f030004

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v4

    .line 349
    invoke-virtual/range {p0 .. p0}, Lcom/food/diary/sync/ModernBackupActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f030003

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v5

    .line 350
    invoke-virtual/range {p0 .. p0}, Lcom/food/diary/sync/ModernBackupActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    const-string v7, "wt"

    move-object/from16 v8, p1

    invoke-virtual {v6, v8, v7}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object v6
    :try_end_3e
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_3e} :catch_ff
    .catchall {:try_start_7 .. :try_end_3e} :catchall_f8

    .line 351
    if-eqz v6, :cond_f0

    .line 352
    :try_start_40
    new-instance v7, Ljava/io/BufferedWriter;

    new-instance v8, Ljava/io/OutputStreamWriter;

    sget-object v9, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v8, v6, v9}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v7, v8}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_4c
    .catch Ljava/lang/Exception; {:try_start_40 .. :try_end_4c} :catch_ed
    .catchall {:try_start_40 .. :try_end_4c} :catchall_ea

    .line 353
    :try_start_4c
    invoke-static {v7, v0}, Lcom/food/diary/sync/ModernBackupActivity;->writeCsvRow(Ljava/io/BufferedWriter;[Ljava/lang/String;)V

    .line 354
    invoke-direct/range {p0 .. p0}, Lcom/food/diary/sync/ModernBackupActivity;->openDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v8
    :try_end_53
    .catch Ljava/lang/Exception; {:try_start_4c .. :try_end_53} :catch_e7
    .catchall {:try_start_4c .. :try_end_53} :catchall_e4

    .line 355
    :try_start_53
    const-string v0, "SELECT ROWID,[Date],[Time],[TypeKey],[SubTypeKey],[Description] FROM [Event] ORDER BY [Date],[Time],ROWID"

    invoke-virtual {v8, v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    const/4 v0, 0x0

    const/4 v9, 0x0

    .line 356
    :goto_5b
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v10

    if-eqz v10, :cond_c6

    .line 357
    const/4 v10, 0x3

    invoke-interface {v2, v10}, Landroid/database/Cursor;->getInt(I)I

    move-result v11

    .line 358
    const/4 v12, 0x4

    invoke-interface {v2, v12}, Landroid/database/Cursor;->getInt(I)I

    move-result v13

    .line 359
    if-ltz v11, :cond_73

    array-length v14, v3

    if-ge v11, v14, :cond_73

    aget-object v14, v3, v11

    goto :goto_75

    :cond_73
    const-string v14, "Other"
    :try_end_75
    .catch Ljava/lang/Exception; {:try_start_53 .. :try_end_75} :catch_e2
    .catchall {:try_start_53 .. :try_end_75} :catchall_123

    .line 360
    :goto_75
    nop

    .line 361
    const-string v15, ""

    const/4 v12, 0x1

    if-nez v11, :cond_83

    if-ltz v13, :cond_83

    :try_start_7d
    array-length v10, v4

    if-ge v13, v10, :cond_83

    aget-object v10, v4, v13

    goto :goto_8e

    .line 362
    :cond_83
    if-ne v11, v12, :cond_8d

    if-ltz v13, :cond_8d

    array-length v10, v5

    if-ge v13, v10, :cond_8d

    aget-object v10, v5, v13

    goto :goto_8e

    .line 363
    :cond_8d
    move-object v10, v15

    :goto_8e
    nop

    .line 364
    invoke-interface {v2, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v16

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v11

    invoke-interface {v2, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    const/4 v12, 0x2

    invoke-interface {v2, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v17

    .line 365
    const/4 v12, 0x5

    invoke-interface {v2, v12}, Landroid/database/Cursor;->isNull(I)Z

    move-result v18

    if-eqz v18, :cond_a8

    goto :goto_ac

    :cond_a8
    invoke-interface {v2, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    :goto_ac
    const/4 v12, 0x6

    new-array v12, v12, [Ljava/lang/String;

    aput-object v11, v12, v0

    const/4 v11, 0x1

    aput-object v13, v12, v11

    const/4 v11, 0x2

    aput-object v17, v12, v11

    const/4 v11, 0x3

    aput-object v14, v12, v11

    const/4 v11, 0x4

    aput-object v10, v12, v11

    const/4 v10, 0x5

    aput-object v15, v12, v10

    .line 363
    invoke-static {v7, v12}, Lcom/food/diary/sync/ModernBackupActivity;->writeCsvRow(Ljava/io/BufferedWriter;[Ljava/lang/String;)V

    .line 366
    add-int/lit8 v9, v9, 0x1

    .line 367
    goto :goto_5b

    .line 368
    :cond_c6
    invoke-virtual {v7}, Ljava/io/BufferedWriter;->flush()V

    .line 369
    nop

    .line 370
    new-instance v0, Lcom/food/diary/sync/ModernBackupActivity$10;

    invoke-direct {v0, v1, v9}, Lcom/food/diary/sync/ModernBackupActivity$10;-><init>(Lcom/food/diary/sync/ModernBackupActivity;I)V

    invoke-virtual {v1, v0}, Lcom/food/diary/sync/ModernBackupActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_d2
    .catch Ljava/lang/Exception; {:try_start_7d .. :try_end_d2} :catch_e2
    .catchall {:try_start_7d .. :try_end_d2} :catchall_123

    .line 378
    if-eqz v2, :cond_d7

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 379
    :cond_d7
    if-eqz v8, :cond_dc

    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 380
    :cond_dc
    :try_start_dc
    invoke-virtual {v7}, Ljava/io/BufferedWriter;->close()V
    :try_end_df
    .catch Ljava/io/IOException; {:try_start_dc .. :try_end_df} :catch_e0

    goto :goto_122

    :catch_e0
    move-exception v0

    goto :goto_122

    .line 373
    :catch_e2
    move-exception v0

    goto :goto_103

    .line 378
    :catchall_e4
    move-exception v0

    move-object v8, v2

    goto :goto_fc

    .line 373
    :catch_e7
    move-exception v0

    move-object v8, v2

    goto :goto_103

    .line 378
    :catchall_ea
    move-exception v0

    move-object v7, v2

    goto :goto_fb

    .line 373
    :catch_ed
    move-exception v0

    move-object v7, v2

    goto :goto_102

    .line 351
    :cond_f0
    :try_start_f0
    new-instance v0, Ljava/io/IOException;

    const-string v3, "Cannot create selected file"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_f8
    .catch Ljava/lang/Exception; {:try_start_f0 .. :try_end_f8} :catch_ed
    .catchall {:try_start_f0 .. :try_end_f8} :catchall_ea

    .line 378
    :catchall_f8
    move-exception v0

    move-object v6, v2

    move-object v7, v6

    :goto_fb
    move-object v8, v7

    :goto_fc
    move-object v2, v0

    move-object v0, v8

    goto :goto_129

    .line 373
    :catch_ff
    move-exception v0

    move-object v6, v2

    move-object v7, v6

    :goto_102
    move-object v8, v7

    .line 374
    :goto_103
    :try_start_103
    new-instance v3, Lcom/food/diary/sync/ModernBackupActivity$11;

    invoke-direct {v3, v1, v0}, Lcom/food/diary/sync/ModernBackupActivity$11;-><init>(Lcom/food/diary/sync/ModernBackupActivity;Ljava/lang/Exception;)V

    invoke-virtual {v1, v3}, Lcom/food/diary/sync/ModernBackupActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_10b
    .catchall {:try_start_103 .. :try_end_10b} :catchall_123

    .line 378
    if-eqz v2, :cond_110

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 379
    :cond_110
    if-eqz v8, :cond_115

    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 380
    :cond_115
    if-eqz v7, :cond_11b

    :try_start_117
    invoke-virtual {v7}, Ljava/io/BufferedWriter;->close()V
    :try_end_11a
    .catch Ljava/io/IOException; {:try_start_117 .. :try_end_11a} :catch_e0

    goto :goto_122

    .line 381
    :cond_11b
    if-eqz v6, :cond_122

    :try_start_11d
    invoke-virtual {v6}, Ljava/io/OutputStream;->close()V
    :try_end_120
    .catch Ljava/io/IOException; {:try_start_11d .. :try_end_120} :catch_121

    goto :goto_122

    :catch_121
    move-exception v0

    .line 383
    :cond_122
    :goto_122
    return-void

    .line 378
    :catchall_123
    move-exception v0

    move-object/from16 v19, v2

    move-object v2, v0

    move-object/from16 v0, v19

    :goto_129
    if-eqz v0, :cond_12e

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 379
    :cond_12e
    if-eqz v8, :cond_133

    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 380
    :cond_133
    if-nez v7, :cond_13d

    .line 381
    if-eqz v6, :cond_142

    :try_start_137
    invoke-virtual {v6}, Ljava/io/OutputStream;->close()V
    :try_end_13a
    .catch Ljava/io/IOException; {:try_start_137 .. :try_end_13a} :catch_13b

    goto :goto_142

    :catch_13b
    move-exception v0

    goto :goto_142

    .line 380
    :cond_13d
    :try_start_13d
    invoke-virtual {v7}, Ljava/io/BufferedWriter;->close()V
    :try_end_140
    .catch Ljava/io/IOException; {:try_start_13d .. :try_end_140} :catch_141

    goto :goto_142

    :catch_141
    move-exception v0

    .line 382
    :cond_142
    :goto_142
    goto :goto_144

    :goto_143
    throw v2

    :goto_144
    goto :goto_143
.end method

.method private finishWithResult()V
    .registers 2

    .line 401
    iget-boolean v0, p0, Lcom/food/diary/sync/ModernBackupActivity;->importedAnything:Z

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/food/diary/sync/ModernBackupActivity;->setResult(I)V

    .line 402
    :cond_8
    invoke-virtual {p0}, Lcom/food/diary/sync/ModernBackupActivity;->finish()V

    .line 403
    return-void
.end method

.method private importCsv(Landroid/net/Uri;)V
    .registers 26

    .line 263
    move-object/from16 v1, p0

    .line 264
    nop

    .line 265
    nop

    .line 266
    nop

    .line 267
    nop

    .line 269
    const v0, 0x7f030005

    :try_start_9
    invoke-direct {v1, v0}, Lcom/food/diary/sync/ModernBackupActivity;->indexMap(I)Ljava/util/Map;

    move-result-object v3

    .line 270
    const v0, 0x7f030004

    invoke-direct {v1, v0}, Lcom/food/diary/sync/ModernBackupActivity;->indexMap(I)Ljava/util/Map;

    move-result-object v4

    .line 271
    const v0, 0x7f030003

    invoke-direct {v1, v0}, Lcom/food/diary/sync/ModernBackupActivity;->indexMap(I)Ljava/util/Map;

    move-result-object v5

    .line 272
    invoke-virtual/range {p0 .. p0}, Lcom/food/diary/sync/ModernBackupActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    move-object/from16 v6, p1

    invoke-virtual {v0, v6}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v6
    :try_end_25
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_25} :catch_1f4
    .catchall {:try_start_9 .. :try_end_25} :catchall_1ee

    .line 273
    if-eqz v6, :cond_1e3

    .line 274
    :try_start_27
    new-instance v7, Lcom/food/diary/sync/ModernBackupActivity$CsvReader;

    invoke-direct {v7, v6}, Lcom/food/diary/sync/ModernBackupActivity$CsvReader;-><init>(Ljava/io/InputStream;)V

    .line 275
    invoke-direct/range {p0 .. p0}, Lcom/food/diary/sync/ModernBackupActivity;->openDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v8
    :try_end_30
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_30} :catch_1e0
    .catchall {:try_start_27 .. :try_end_30} :catchall_1dd

    .line 276
    :try_start_30
    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 277
    const/4 v9, 0x1

    const/4 v10, 0x0

    const/4 v0, 0x1

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    .line 279
    :goto_39
    invoke-virtual {v7}, Lcom/food/diary/sync/ModernBackupActivity$CsvReader;->next()Ljava/util/List;

    move-result-object v14
    :try_end_3d
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_3d} :catch_1da
    .catchall {:try_start_30 .. :try_end_3d} :catchall_1d8

    const-string v15, ""

    if-eqz v14, :cond_15a

    .line 280
    :try_start_41
    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v16
    :try_end_45
    .catch Ljava/lang/Exception; {:try_start_41 .. :try_end_45} :catch_1da
    .catchall {:try_start_41 .. :try_end_45} :catchall_1d8

    if-nez v16, :cond_48

    goto :goto_39

    .line 281
    :cond_48
    if-eqz v0, :cond_5a

    .line 282
    nop

    .line 283
    :try_start_4b
    invoke-interface {v14, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_54
    .catch Ljava/lang/Exception; {:try_start_4b .. :try_end_54} :catch_57
    .catchall {:try_start_4b .. :try_end_54} :catchall_1d8

    .line 284
    const/16 v16, 0x0

    goto :goto_5c

    :catch_57
    move-exception v0

    const/4 v0, 0x0

    goto :goto_39

    .line 281
    :cond_5a
    move/from16 v16, v0

    .line 286
    :goto_5c
    :try_start_5c
    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v0
    :try_end_60
    .catch Ljava/lang/Exception; {:try_start_5c .. :try_end_60} :catch_1da
    .catchall {:try_start_5c .. :try_end_60} :catchall_1d8

    const/4 v2, 0x6

    if-ge v0, v2, :cond_68

    add-int/lit8 v12, v12, 0x1

    move/from16 v0, v16

    goto :goto_39

    .line 288
    :cond_68
    :try_start_68
    invoke-interface {v14, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 289
    const/4 v2, 0x2

    invoke-interface {v14, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/String;

    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 290
    const/4 v9, 0x3

    invoke-interface {v14, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v18

    move-object/from16 v9, v18

    check-cast v9, Ljava/lang/String;

    const/4 v10, -0x1

    invoke-direct {v1, v3, v9, v10}, Lcom/food/diary/sync/ModernBackupActivity;->valueIndex(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v9

    .line 291
    if-gez v9, :cond_94

    add-int/lit8 v12, v12, 0x1

    move/from16 v0, v16

    const/4 v9, 0x1

    const/4 v10, 0x0

    goto :goto_39

    .line 292
    :cond_94
    nop

    .line 293
    const/4 v10, 0x4

    if-nez v9, :cond_a9

    invoke-interface {v14, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v20

    move-object/from16 v10, v20

    check-cast v10, Ljava/lang/String;
    :try_end_a0
    .catch Ljava/lang/Exception; {:try_start_68 .. :try_end_a0} :catch_14a
    .catchall {:try_start_68 .. :try_end_a0} :catchall_1d8

    move-object/from16 v20, v3

    const/4 v3, 0x0

    :try_start_a3
    invoke-direct {v1, v4, v10, v3}, Lcom/food/diary/sync/ModernBackupActivity;->valueIndex(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v10

    move v3, v10

    goto :goto_bd

    .line 294
    :cond_a9
    move-object/from16 v20, v3

    const/4 v3, 0x1

    if-ne v9, v3, :cond_bc

    const/4 v3, 0x4

    invoke-interface {v14, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    const/4 v3, 0x0

    invoke-direct {v1, v5, v10, v3}, Lcom/food/diary/sync/ModernBackupActivity;->valueIndex(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v10

    move v3, v10

    goto :goto_bd

    :cond_bc
    const/4 v3, 0x0

    .line 295
    :goto_bd
    const/4 v10, 0x5

    invoke-interface {v14, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v21

    if-nez v21, :cond_c5

    goto :goto_cc

    :cond_c5
    invoke-interface {v14, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    move-object v15, v14

    check-cast v15, Ljava/lang/String;

    .line 297
    :goto_cc
    const-string v14, "SELECT 1 FROM [Event] WHERE [Date]=? AND [Time]=? AND [TypeKey]=? AND [SubTypeKey]=? AND COALESCE([Description],\'\')=? LIMIT 1"

    .line 299
    invoke-static {v9}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v21

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v22

    new-array v10, v10, [Ljava/lang/String;
    :try_end_d8
    .catch Ljava/lang/Exception; {:try_start_a3 .. :try_end_d8} :catch_148
    .catchall {:try_start_a3 .. :try_end_d8} :catchall_1d8

    const/16 v18, 0x0

    :try_start_da
    aput-object v0, v10, v18

    const/16 v17, 0x1

    aput-object v2, v10, v17

    const/16 v23, 0x2

    aput-object v21, v10, v23

    const/16 v19, 0x3

    aput-object v22, v10, v19

    const/16 v19, 0x4

    aput-object v15, v10, v19

    .line 297
    invoke-virtual {v8, v14, v10}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10
    :try_end_f0
    .catch Ljava/lang/Exception; {:try_start_da .. :try_end_f0} :catch_145
    .catchall {:try_start_da .. :try_end_f0} :catchall_1d8

    .line 301
    :try_start_f0
    invoke-interface {v10}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v14
    :try_end_f4
    .catchall {:try_start_f0 .. :try_end_f4} :catchall_13c

    :try_start_f4
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 302
    if-eqz v14, :cond_103

    add-int/lit8 v13, v13, 0x1

    move/from16 v0, v16

    move-object/from16 v3, v20

    const/4 v9, 0x1

    const/4 v10, 0x0

    goto/16 :goto_39

    .line 304
    :cond_103
    new-instance v10, Landroid/content/ContentValues;

    invoke-direct {v10}, Landroid/content/ContentValues;-><init>()V

    .line 305
    const-string v14, "Date"

    invoke-virtual {v10, v14, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    const-string v0, "Time"

    invoke-virtual {v10, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 307
    const-string v0, "TypeKey"

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v10, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 308
    const-string v0, "SubTypeKey"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v10, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 309
    const-string v0, "Description"

    invoke-virtual {v10, v0, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 310
    const-string v0, "Event"
    :try_end_12b
    .catch Ljava/lang/Exception; {:try_start_f4 .. :try_end_12b} :catch_145
    .catchall {:try_start_f4 .. :try_end_12b} :catchall_1d8

    const/4 v2, 0x0

    :try_start_12c
    invoke-virtual {v8, v0, v2, v10}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v9

    .line 311
    const-wide/16 v14, 0x0

    cmp-long v0, v9, v14

    if-ltz v0, :cond_139

    add-int/lit8 v11, v11, 0x1

    goto :goto_152

    :cond_139
    add-int/lit8 v12, v12, 0x1

    goto :goto_152

    .line 301
    :catchall_13c
    move-exception v0

    const/4 v2, 0x0

    move-object v3, v0

    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    throw v3
    :try_end_143
    .catch Ljava/lang/Exception; {:try_start_12c .. :try_end_143} :catch_143
    .catchall {:try_start_12c .. :try_end_143} :catchall_1d8

    .line 312
    :catch_143
    move-exception v0

    goto :goto_150

    :catch_145
    move-exception v0

    const/4 v2, 0x0

    goto :goto_150

    :catch_148
    move-exception v0

    goto :goto_14d

    :catch_14a
    move-exception v0

    move-object/from16 v20, v3

    :goto_14d
    const/4 v2, 0x0

    const/16 v18, 0x0

    .line 313
    :goto_150
    add-int/lit8 v12, v12, 0x1

    .line 314
    :goto_152
    move/from16 v0, v16

    move-object/from16 v3, v20

    const/4 v9, 0x1

    const/4 v10, 0x0

    goto/16 :goto_39

    .line 316
    :cond_15a
    const/16 v18, 0x0

    :try_start_15c
    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    .line 317
    iget-boolean v0, v1, Lcom/food/diary/sync/ModernBackupActivity;->importedAnything:Z

    if-nez v0, :cond_168

    if-lez v11, :cond_166

    goto :goto_168

    :cond_166
    const/4 v10, 0x0

    goto :goto_169

    :cond_168
    :goto_168
    const/4 v10, 0x1

    :goto_169
    iput-boolean v10, v1, Lcom/food/diary/sync/ModernBackupActivity;->importedAnything:Z

    .line 318
    if-lez v11, :cond_174

    .line 319
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/food/diary/sync/ModernBackupActivity;->setResult(I)V

    .line 320
    invoke-static/range {p0 .. p0}, Lcom/food/diary/sync/DiarySyncManager;->schedule(Landroid/content/Context;)V

    .line 322
    :cond_174
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

    if-lez v12, :cond_1ae

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

    :cond_1ae
    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 323
    new-instance v2, Lcom/food/diary/sync/ModernBackupActivity$8;

    invoke-direct {v2, v1, v0}, Lcom/food/diary/sync/ModernBackupActivity$8;-><init>(Lcom/food/diary/sync/ModernBackupActivity;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/food/diary/sync/ModernBackupActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_1be
    .catch Ljava/lang/Exception; {:try_start_15c .. :try_end_1be} :catch_1da
    .catchall {:try_start_15c .. :try_end_1be} :catchall_1d8

    .line 331
    if-eqz v8, :cond_1d0

    .line 332
    :try_start_1c0
    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result v0

    if-eqz v0, :cond_1cb

    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_1c9
    .catch Ljava/lang/Exception; {:try_start_1c0 .. :try_end_1c9} :catch_1ca

    goto :goto_1cb

    :catch_1ca
    move-exception v0

    .line 333
    :cond_1cb
    :goto_1cb
    :try_start_1cb
    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_1ce
    .catch Ljava/lang/Exception; {:try_start_1cb .. :try_end_1ce} :catch_1cf

    goto :goto_1d0

    :catch_1cf
    move-exception v0

    .line 335
    :cond_1d0
    :goto_1d0
    if-eqz v6, :cond_216

    :try_start_1d2
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V
    :try_end_1d5
    .catch Ljava/io/IOException; {:try_start_1d2 .. :try_end_1d5} :catch_1d6

    goto :goto_216

    :catch_1d6
    move-exception v0

    goto :goto_216

    .line 331
    :catchall_1d8
    move-exception v0

    goto :goto_1f2

    .line 326
    :catch_1da
    move-exception v0

    move-object v2, v8

    goto :goto_1f7

    .line 331
    :catchall_1dd
    move-exception v0

    const/4 v2, 0x0

    goto :goto_218

    .line 326
    :catch_1e0
    move-exception v0

    const/4 v2, 0x0

    goto :goto_1f7

    .line 273
    :cond_1e3
    const/4 v2, 0x0

    :try_start_1e4
    new-instance v0, Ljava/io/IOException;

    const-string v3, "Cannot open selected file"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1ec
    .catch Ljava/lang/Exception; {:try_start_1e4 .. :try_end_1ec} :catch_1ec
    .catchall {:try_start_1e4 .. :try_end_1ec} :catchall_217

    .line 326
    :catch_1ec
    move-exception v0

    goto :goto_1f7

    .line 331
    :catchall_1ee
    move-exception v0

    const/4 v2, 0x0

    move-object v6, v2

    move-object v8, v6

    :goto_1f2
    move-object v2, v0

    goto :goto_21a

    .line 326
    :catch_1f4
    move-exception v0

    const/4 v2, 0x0

    move-object v6, v2

    .line 327
    :goto_1f7
    :try_start_1f7
    new-instance v3, Lcom/food/diary/sync/ModernBackupActivity$9;

    invoke-direct {v3, v1, v0}, Lcom/food/diary/sync/ModernBackupActivity$9;-><init>(Lcom/food/diary/sync/ModernBackupActivity;Ljava/lang/Exception;)V

    invoke-virtual {v1, v3}, Lcom/food/diary/sync/ModernBackupActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_1ff
    .catchall {:try_start_1f7 .. :try_end_1ff} :catchall_217

    .line 331
    if-eqz v2, :cond_211

    .line 332
    :try_start_201
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result v0

    if-eqz v0, :cond_20c

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_20a
    .catch Ljava/lang/Exception; {:try_start_201 .. :try_end_20a} :catch_20b

    goto :goto_20c

    :catch_20b
    move-exception v0

    .line 333
    :cond_20c
    :goto_20c
    :try_start_20c
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_20f
    .catch Ljava/lang/Exception; {:try_start_20c .. :try_end_20f} :catch_210

    goto :goto_211

    :catch_210
    move-exception v0

    .line 335
    :cond_211
    :goto_211
    if-eqz v6, :cond_216

    :try_start_213
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V
    :try_end_216
    .catch Ljava/io/IOException; {:try_start_213 .. :try_end_216} :catch_1d6

    .line 337
    :cond_216
    :goto_216
    return-void

    .line 331
    :catchall_217
    move-exception v0

    :goto_218
    move-object v8, v2

    goto :goto_1f2

    :goto_21a
    if-eqz v8, :cond_22c

    .line 332
    :try_start_21c
    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result v0

    if-eqz v0, :cond_227

    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_225
    .catch Ljava/lang/Exception; {:try_start_21c .. :try_end_225} :catch_226

    goto :goto_227

    :catch_226
    move-exception v0

    .line 333
    :cond_227
    :goto_227
    :try_start_227
    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_22a
    .catch Ljava/lang/Exception; {:try_start_227 .. :try_end_22a} :catch_22b

    goto :goto_22c

    :catch_22b
    move-exception v0

    .line 335
    :cond_22c
    :goto_22c
    if-eqz v6, :cond_233

    :try_start_22e
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V
    :try_end_231
    .catch Ljava/io/IOException; {:try_start_22e .. :try_end_231} :catch_232

    goto :goto_233

    :catch_232
    move-exception v0

    .line 336
    :cond_233
    :goto_233
    goto :goto_235

    :goto_234
    throw v2

    :goto_235
    goto :goto_234
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

    .line 251
    invoke-virtual {p0}, Lcom/food/diary/sync/ModernBackupActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object p1

    .line 252
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 253
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

    .line 254
    :cond_21
    return-object v0
.end method

.method private isPackageInstalled(Ljava/lang/String;)Z
    .registers 4

    .line 177
    const/4 v0, 0x0

    :try_start_1
    invoke-virtual {p0}, Lcom/food/diary/sync/ModernBackupActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {v1, p1, v0}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_8
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_8} :catch_a

    .line 178
    const/4 p1, 0x1

    return p1

    .line 179
    :catch_a
    move-exception p1

    .line 180
    return v0
.end method

.method private static key(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 247
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

.method private launchExportCsv()V
    .registers 4

    .line 213
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.CREATE_DOCUMENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 214
    const-string v1, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 215
    const-string v1, "text/csv"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 216
    const-string v1, "android.intent.extra.TITLE"

    const-string v2, "FoodDiary-export.csv"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 217
    const v1, 0xc502

    invoke-virtual {p0, v0, v1}, Lcom/food/diary/sync/ModernBackupActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 218
    return-void
.end method

.method private launchImportCsv()V
    .registers 5

    .line 205
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.OPEN_DOCUMENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 206
    const-string v1, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 207
    const-string v1, "text/*"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 208
    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "text/csv"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "text/comma-separated-values"

    const/4 v3, 0x1

    aput-object v2, v1, v3

    const-string v2, "text/plain"

    const/4 v3, 0x2

    aput-object v2, v1, v3

    const-string v2, "application/csv"

    const/4 v3, 0x3

    aput-object v2, v1, v3

    const-string v2, "android.intent.extra.MIME_TYPES"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    .line 209
    const v1, 0xc501

    invoke-virtual {p0, v0, v1}, Lcom/food/diary/sync/ModernBackupActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 210
    return-void
.end method

.method private openDb()Landroid/database/sqlite/SQLiteDatabase;
    .registers 4

    .line 243
    const-string v0, "Events.db"

    invoke-virtual {p0, v0}, Lcom/food/diary/sync/ModernBackupActivity;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->openDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method private refreshStatus()V
    .registers 8

    .line 185
    iget-object v0, p0, Lcom/food/diary/sync/ModernBackupActivity;->status:Landroid/widget/TextView;

    if-nez v0, :cond_5

    return-void

    .line 186
    :cond_5
    invoke-static {p0}, Lcom/food/diary/sync/DiarySyncManager;->isConfigured(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_1e

    .line 187
    iget-object v0, p0, Lcom/food/diary/sync/ModernBackupActivity;->status:Landroid/widget/TextView;

    const-string v1, "Not connected. Choose a JSON file in Google Drive once; future changes will update it automatically."

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 188
    iget-object v0, p0, Lcom/food/diary/sync/ModernBackupActivity;->syncNow:Landroid/widget/Button;

    if-eqz v0, :cond_1d

    iget-object v0, p0, Lcom/food/diary/sync/ModernBackupActivity;->syncNow:Landroid/widget/Button;

    const-string v1, "Choose sync file"

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 189
    :cond_1d
    return-void

    .line 191
    :cond_1e
    invoke-static {p0}, Lcom/food/diary/sync/DiarySyncManager;->getLastSyncMs(Landroid/content/Context;)J

    move-result-wide v0

    .line 192
    invoke-static {p0}, Lcom/food/diary/sync/DiarySyncManager;->getLastError(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    .line 193
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Connected"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 194
    const-wide/16 v4, 0x0

    cmp-long v6, v0, v4

    if-lez v6, :cond_49

    .line 195
    const-string v4, "\nLast sync: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Ljava/text/DateFormat;->getDateTimeInstance()Ljava/text/DateFormat;

    move-result-object v5

    new-instance v6, Ljava/util/Date;

    invoke-direct {v6, v0, v1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v5, v6}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    :cond_49
    if-eqz v2, :cond_5a

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_5a

    .line 198
    const-string v0, "\nLast error: "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    :cond_5a
    iget-object v0, p0, Lcom/food/diary/sync/ModernBackupActivity;->status:Landroid/widget/TextView;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 201
    iget-object v0, p0, Lcom/food/diary/sync/ModernBackupActivity;->syncNow:Landroid/widget/Button;

    if-eqz v0, :cond_6e

    iget-object v0, p0, Lcom/food/diary/sync/ModernBackupActivity;->syncNow:Landroid/widget/Button;

    const-string v1, "Sync now"

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 202
    :cond_6e
    return-void
.end method

.method private text(Ljava/lang/String;F)Landroid/widget/TextView;
    .registers 5

    .line 68
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 69
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 71
    const/4 p1, 0x5

    invoke-direct {p0, p1}, Lcom/food/diary/sync/ModernBackupActivity;->dp(I)I

    move-result p2

    invoke-direct {p0, p1}, Lcom/food/diary/sync/ModernBackupActivity;->dp(I)I

    move-result p1

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p2, v1, p1}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 72
    return-object v0
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

    .line 258
    invoke-static {p2}, Lcom/food/diary/sync/ModernBackupActivity;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    .line 259
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

    .line 386
    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_2
    array-length v2, p1

    const/16 v3, 0xa

    if-ge v1, v2, :cond_5d

    .line 387
    const/16 v2, 0x2c

    if-lez v1, :cond_e

    invoke-virtual {p0, v2}, Ljava/io/BufferedWriter;->write(I)V

    .line 388
    :cond_e
    aget-object v4, p1, v1

    if-nez v4, :cond_15

    const-string v4, ""

    goto :goto_17

    :cond_15
    aget-object v4, p1, v1

    .line 389
    :goto_17
    invoke-virtual {v4, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    const/16 v5, 0x22

    if-gez v2, :cond_36

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-gez v2, :cond_36

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

    .line 390
    :goto_37
    if-eqz v2, :cond_3c

    invoke-virtual {p0, v5}, Ljava/io/BufferedWriter;->write(I)V

    .line 391
    :cond_3c
    const/4 v3, 0x0

    :goto_3d
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v3, v6, :cond_55

    .line 392
    invoke-virtual {v4, v3}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 393
    if-ne v6, v5, :cond_4f

    const-string v6, "\"\""

    invoke-virtual {p0, v6}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    goto :goto_52

    :cond_4f
    invoke-virtual {p0, v6}, Ljava/io/BufferedWriter;->write(I)V

    .line 391
    :goto_52
    add-int/lit8 v3, v3, 0x1

    goto :goto_3d

    .line 395
    :cond_55
    if-eqz v2, :cond_5a

    invoke-virtual {p0, v5}, Ljava/io/BufferedWriter;->write(I)V

    .line 386
    :cond_5a
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 397
    :cond_5d
    invoke-virtual {p0, v3}, Ljava/io/BufferedWriter;->write(I)V

    .line 398
    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .registers 7

    .line 222
    invoke-static {p0, p1, p2, p3}, Lcom/food/diary/sync/DiarySyncManager;->handleActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, -0x1

    if-eqz v0, :cond_17

    .line 223
    if-ne p2, v2, :cond_13

    const-string p1, "Sync file connected"

    invoke-static {p0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 224
    :cond_13
    invoke-direct {p0}, Lcom/food/diary/sync/ModernBackupActivity;->refreshStatus()V

    .line 225
    return-void

    .line 227
    :cond_17
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 228
    if-ne p2, v2, :cond_5c

    if-eqz p3, :cond_5c

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p2

    if-nez p2, :cond_25

    goto :goto_5c

    .line 229
    :cond_25
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p2

    .line 230
    const p3, 0xc501

    if-ne p1, p3, :cond_47

    .line 231
    const-string p1, "Importing\u2026"

    invoke-static {p0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 232
    new-instance p1, Ljava/lang/Thread;

    new-instance p3, Lcom/food/diary/sync/ModernBackupActivity$6;

    invoke-direct {p3, p0, p2}, Lcom/food/diary/sync/ModernBackupActivity$6;-><init>(Lcom/food/diary/sync/ModernBackupActivity;Landroid/net/Uri;)V

    const-string p2, "FoodDiaryCsvImport"

    invoke-direct {p1, p3, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 234
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    goto :goto_5b

    .line 235
    :cond_47
    const p3, 0xc502

    if-ne p1, p3, :cond_5b

    .line 236
    new-instance p1, Ljava/lang/Thread;

    new-instance p3, Lcom/food/diary/sync/ModernBackupActivity$7;

    invoke-direct {p3, p0, p2}, Lcom/food/diary/sync/ModernBackupActivity$7;-><init>(Lcom/food/diary/sync/ModernBackupActivity;Landroid/net/Uri;)V

    const-string p2, "FoodDiaryCsvExport"

    invoke-direct {p1, p3, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 238
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 240
    :cond_5b
    :goto_5b
    return-void

    .line 228
    :cond_5c
    :goto_5c
    return-void
.end method

.method public onBackPressed()V
    .registers 1

    .line 405
    invoke-direct {p0}, Lcom/food/diary/sync/ModernBackupActivity;->finishWithResult()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 2

    .line 52
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 53
    const-string p1, "Backup & Sync"

    invoke-virtual {p0, p1}, Lcom/food/diary/sync/ModernBackupActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 54
    invoke-direct {p0}, Lcom/food/diary/sync/ModernBackupActivity;->buildUi()V

    .line 55
    return-void
.end method

.method protected onResume()V
    .registers 1

    .line 59
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 60
    invoke-direct {p0}, Lcom/food/diary/sync/ModernBackupActivity;->refreshStatus()V

    .line 61
    return-void
.end method
