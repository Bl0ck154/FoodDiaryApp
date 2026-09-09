.class final Lcom/food/diary/sync/ModernBackupActivity$CsvReader;
.super Ljava/lang/Object;
.source "ModernBackupActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/food/diary/sync/ModernBackupActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "CsvReader"
.end annotation


# instance fields
.field private pushed:I

.field private final reader:Ljava/io/BufferedReader;


# direct methods
.method constructor <init>(Ljava/io/InputStream;)V
    .registers 5

    .line 410
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 409
    const/4 v0, -0x2

    iput v0, p0, Lcom/food/diary/sync/ModernBackupActivity$CsvReader;->pushed:I

    .line 410
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v1, Ljava/io/InputStreamReader;

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v1, p1, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    iput-object v0, p0, Lcom/food/diary/sync/ModernBackupActivity$CsvReader;->reader:Ljava/io/BufferedReader;

    return-void
.end method

.method private read()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 412
    iget v0, p0, Lcom/food/diary/sync/ModernBackupActivity$CsvReader;->pushed:I

    const/4 v1, -0x2

    if-eq v0, v1, :cond_a

    iget v0, p0, Lcom/food/diary/sync/ModernBackupActivity$CsvReader;->pushed:I

    iput v1, p0, Lcom/food/diary/sync/ModernBackupActivity$CsvReader;->pushed:I

    return v0

    .line 413
    :cond_a
    iget-object v0, p0, Lcom/food/diary/sync/ModernBackupActivity$CsvReader;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v0}, Ljava/io/BufferedReader;->read()I

    move-result v0

    return v0
.end method

.method private unread(I)V
    .registers 2

    .line 415
    iput p1, p0, Lcom/food/diary/sync/ModernBackupActivity$CsvReader;->pushed:I

    return-void
.end method


# virtual methods
.method next()Ljava/util/List;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 417
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 418
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 419
    nop

    .line 420
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 422
    :goto_e
    invoke-direct {p0}, Lcom/food/diary/sync/ModernBackupActivity$CsvReader;->read()I

    move-result v5

    .line 423
    const/4 v6, -0x1

    if-ne v5, v6, :cond_2d

    .line 424
    if-nez v4, :cond_25

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-nez v2, :cond_25

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_25

    const/4 v0, 0x0

    return-object v0

    .line 425
    :cond_25
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 426
    return-object v0

    .line 428
    :cond_2d
    nop

    .line 429
    int-to-char v4, v5

    .line 430
    const/4 v5, 0x1

    const/16 v7, 0x22

    if-eqz v3, :cond_4b

    .line 431
    if-ne v4, v7, :cond_47

    .line 432
    invoke-direct {p0}, Lcom/food/diary/sync/ModernBackupActivity$CsvReader;->read()I

    move-result v4

    .line 433
    if-ne v4, v7, :cond_40

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_46

    .line 434
    :cond_40
    if-eq v4, v6, :cond_45

    invoke-direct {p0, v4}, Lcom/food/diary/sync/ModernBackupActivity$CsvReader;->unread(I)V

    .line 435
    :cond_45
    const/4 v3, 0x0

    :goto_46
    goto :goto_8a

    :cond_47
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_8a

    .line 437
    :cond_4b
    if-ne v4, v7, :cond_55

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v7

    if-nez v7, :cond_55

    const/4 v3, 0x1

    goto :goto_8a

    .line 438
    :cond_55
    const/16 v7, 0x2c

    if-ne v4, v7, :cond_64

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    goto :goto_8a

    .line 439
    :cond_64
    const/16 v7, 0xa

    if-ne v4, v7, :cond_70

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0

    .line 440
    :cond_70
    const/16 v8, 0xd

    if-ne v4, v8, :cond_87

    invoke-direct {p0}, Lcom/food/diary/sync/ModernBackupActivity$CsvReader;->read()I

    move-result v2

    if-eq v2, v7, :cond_7f

    if-eq v2, v6, :cond_7f

    invoke-direct {p0, v2}, Lcom/food/diary/sync/ModernBackupActivity$CsvReader;->unread(I)V

    :cond_7f
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0

    .line 441
    :cond_87
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 443
    :goto_8a
    const/4 v4, 0x1

    goto :goto_e
.end method
