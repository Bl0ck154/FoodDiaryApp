.class public final Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;
.super Landroidx/fragment/app/Fragment;
.source "ModernBackupActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/food/diary/sync/ModernBackupActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ActionFragment"
.end annotation


# static fields
.field private static final ARG_MODE:Ljava/lang/String; = "mode"


# instance fields
.field private mode:I

.field private syncNow:Landroid/widget/Button;

.field private syncStatus:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 424
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    return-void
.end method

.method private host()Lcom/food/diary/sync/ModernBackupActivity;
    .registers 2

    .line 439
    invoke-virtual {p0}, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/food/diary/sync/ModernBackupActivity;

    return-object v0
.end method

.method static newInstance(I)Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;
    .registers 4

    .line 431
    new-instance v0, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;

    invoke-direct {v0}, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;-><init>()V

    .line 432
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 433
    const-string v2, "mode"

    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 434
    invoke-virtual {v0, v1}, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;->setArguments(Landroid/os/Bundle;)V

    .line 435
    return-object v0
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .registers 4

    .line 444
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 445
    invoke-virtual {p0}, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    .line 446
    const/4 v0, 0x0

    if-nez p1, :cond_b

    goto :goto_11

    :cond_b
    const-string v1, "mode"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    :goto_11
    iput v0, p0, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;->mode:I

    .line 447
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 5

    .line 451
    invoke-direct {p0}, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;->host()Lcom/food/diary/sync/ModernBackupActivity;

    move-result-object p1

    .line 452
    # invokes: Lcom/food/diary/sync/ModernBackupActivity;->pageRoot()Landroid/widget/LinearLayout;
    invoke-static {p1}, Lcom/food/diary/sync/ModernBackupActivity;->access$200(Lcom/food/diary/sync/ModernBackupActivity;)Landroid/widget/LinearLayout;

    move-result-object p2

    .line 454
    iget p3, p0, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;->mode:I

    if-nez p3, :cond_27

    .line 455
    const-string p3, "Save all diary records to a CSV file."

    # invokes: Lcom/food/diary/sync/ModernBackupActivity;->paragraph(Ljava/lang/String;)Landroid/widget/TextView;
    invoke-static {p1, p3}, Lcom/food/diary/sync/ModernBackupActivity;->access$300(Lcom/food/diary/sync/ModernBackupActivity;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 456
    const-string p3, "Export CSV"

    # invokes: Lcom/food/diary/sync/ModernBackupActivity;->actionButton(Ljava/lang/String;)Landroid/widget/Button;
    invoke-static {p1, p3}, Lcom/food/diary/sync/ModernBackupActivity;->access$400(Lcom/food/diary/sync/ModernBackupActivity;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object p3

    .line 457
    new-instance v0, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment$1;

    invoke-direct {v0, p0, p1}, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment$1;-><init>(Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;Lcom/food/diary/sync/ModernBackupActivity;)V

    invoke-virtual {p3, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 460
    invoke-virtual {p2, p3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 461
    goto :goto_8d

    :cond_27
    iget p3, p0, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;->mode:I

    const/4 v0, 0x1

    if-ne p3, v0, :cond_47

    .line 462
    const-string p3, "Import a CSV exported by the original Food Diary. Existing matching records are skipped."

    # invokes: Lcom/food/diary/sync/ModernBackupActivity;->paragraph(Ljava/lang/String;)Landroid/widget/TextView;
    invoke-static {p1, p3}, Lcom/food/diary/sync/ModernBackupActivity;->access$300(Lcom/food/diary/sync/ModernBackupActivity;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 464
    const-string p3, "Import CSV"

    # invokes: Lcom/food/diary/sync/ModernBackupActivity;->actionButton(Ljava/lang/String;)Landroid/widget/Button;
    invoke-static {p1, p3}, Lcom/food/diary/sync/ModernBackupActivity;->access$400(Lcom/food/diary/sync/ModernBackupActivity;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object p3

    .line 465
    new-instance v0, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment$2;

    invoke-direct {v0, p0, p1}, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment$2;-><init>(Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;Lcom/food/diary/sync/ModernBackupActivity;)V

    invoke-virtual {p3, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 468
    invoke-virtual {p2, p3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 469
    goto :goto_8d

    .line 470
    :cond_47
    const-string p3, ""

    # invokes: Lcom/food/diary/sync/ModernBackupActivity;->paragraph(Ljava/lang/String;)Landroid/widget/TextView;
    invoke-static {p1, p3}, Lcom/food/diary/sync/ModernBackupActivity;->access$300(Lcom/food/diary/sync/ModernBackupActivity;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object p3

    iput-object p3, p0, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;->syncStatus:Landroid/widget/TextView;

    .line 471
    iget-object p3, p0, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;->syncStatus:Landroid/widget/TextView;

    invoke-virtual {p2, p3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 473
    const-string p3, "Connect Google Drive\u2026"

    # invokes: Lcom/food/diary/sync/ModernBackupActivity;->actionButton(Ljava/lang/String;)Landroid/widget/Button;
    invoke-static {p1, p3}, Lcom/food/diary/sync/ModernBackupActivity;->access$400(Lcom/food/diary/sync/ModernBackupActivity;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object p3

    .line 474
    new-instance v0, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment$3;

    invoke-direct {v0, p0, p1}, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment$3;-><init>(Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;Lcom/food/diary/sync/ModernBackupActivity;)V

    invoke-virtual {p3, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 477
    invoke-virtual {p2, p3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 479
    const-string p3, "Sync now"

    # invokes: Lcom/food/diary/sync/ModernBackupActivity;->actionButton(Ljava/lang/String;)Landroid/widget/Button;
    invoke-static {p1, p3}, Lcom/food/diary/sync/ModernBackupActivity;->access$400(Lcom/food/diary/sync/ModernBackupActivity;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object p3

    iput-object p3, p0, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;->syncNow:Landroid/widget/Button;

    .line 480
    iget-object p3, p0, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;->syncNow:Landroid/widget/Button;

    new-instance v0, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment$4;

    invoke-direct {v0, p0, p1}, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment$4;-><init>(Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;Lcom/food/diary/sync/ModernBackupActivity;)V

    invoke-virtual {p3, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 483
    iget-object p3, p0, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;->syncNow:Landroid/widget/Button;

    invoke-virtual {p2, p3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 485
    const-string p3, "The Google account is handled by the Google Drive document provider. Food Diary never receives your Google password. A successful write means the Drive provider accepted the updated file; Google Drive handles the network upload."

    # invokes: Lcom/food/diary/sync/ModernBackupActivity;->paragraph(Ljava/lang/String;)Landroid/widget/TextView;
    invoke-static {p1, p3}, Lcom/food/diary/sync/ModernBackupActivity;->access$300(Lcom/food/diary/sync/ModernBackupActivity;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object p1

    .line 487
    const/high16 p3, 0x41500000    # 13.0f

    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 488
    invoke-virtual {p2, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 489
    invoke-virtual {p0}, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;->renderSyncStatus()V

    .line 491
    :goto_8d
    return-object p2
.end method

.method public onResume()V
    .registers 3

    .line 495
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    .line 496
    iget v0, p0, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;->mode:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_b

    invoke-virtual {p0}, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;->renderSyncStatus()V

    .line 497
    :cond_b
    return-void
.end method

.method renderSyncStatus()V
    .registers 11

    .line 504
    iget-object v0, p0, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;->syncStatus:Landroid/widget/TextView;

    if-eqz v0, :cond_e9

    invoke-virtual {p0}, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    if-nez v0, :cond_c

    goto/16 :goto_e9

    .line 505
    :cond_c
    invoke-direct {p0}, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;->host()Lcom/food/diary/sync/ModernBackupActivity;

    move-result-object v0

    .line 506
    invoke-static {v0}, Lcom/food/diary/sync/DiarySyncManager;->getLastError(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 507
    invoke-static {v0}, Lcom/food/diary/sync/DiarySyncManager;->getLastSyncMs(Landroid/content/Context;)J

    move-result-wide v2

    .line 509
    invoke-static {v0}, Lcom/food/diary/sync/DiarySyncManager;->isConfigured(Landroid/content/Context;)Z

    move-result v4

    const/4 v5, 0x0

    if-nez v4, :cond_30

    .line 510
    iget-object v0, p0, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;->syncStatus:Landroid/widget/TextView;

    const-string v1, "Google Drive: not connected\n\nTap Connect Google Drive, then choose Google Drive from the system picker\'s left menu."

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 512
    iget-object v0, p0, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;->syncNow:Landroid/widget/Button;

    if-eqz v0, :cond_2f

    iget-object v0, p0, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;->syncNow:Landroid/widget/Button;

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setEnabled(Z)V

    .line 513
    :cond_2f
    return-void

    .line 516
    :cond_30
    invoke-static {v0}, Lcom/food/diary/sync/DiarySyncManager;->getProviderName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    .line 517
    invoke-static {v0}, Lcom/food/diary/sync/DiarySyncManager;->isGoogleDrive(Landroid/content/Context;)Z

    move-result v0

    const-string v6, "\nLast error: "

    const-wide/16 v7, 0x0

    if-eqz v0, :cond_8f

    .line 518
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v5, "Google Drive: connected"

    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 519
    const-string v5, "\nProvider: "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    if-nez v4, :cond_4f

    const-string v4, "Google Drive"

    :cond_4f
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 520
    cmp-long v4, v2, v7

    if-lez v4, :cond_6c

    .line 521
    const-string v4, "\nLast write to Drive provider: "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 522
    invoke-static {}, Ljava/text/DateFormat;->getDateTimeInstance()Ljava/text/DateFormat;

    move-result-object v5

    new-instance v7, Ljava/util/Date;

    invoke-direct {v7, v2, v3}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v5, v7}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 524
    :cond_6c
    if-eqz v1, :cond_7b

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_7b

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 525
    :cond_7b
    iget-object v1, p0, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;->syncStatus:Landroid/widget/TextView;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 526
    iget-object v0, p0, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;->syncNow:Landroid/widget/Button;

    if-eqz v0, :cond_8e

    iget-object v0, p0, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;->syncNow:Landroid/widget/Button;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 527
    :cond_8e
    goto :goto_e8

    .line 528
    :cond_8f
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v9, "Cloud sync: OFF"

    invoke-direct {v0, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 529
    const-string v9, "\nCurrent target: "

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    if-nez v4, :cond_a0

    const-string v4, "Local storage"

    :cond_a0
    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 530
    const-string v4, "\nThis is only a local/non-Drive backup."

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 531
    cmp-long v4, v2, v7

    if-lez v4, :cond_c2

    .line 532
    const-string v4, "\nLast local write: "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 533
    invoke-static {}, Ljava/text/DateFormat;->getDateTimeInstance()Ljava/text/DateFormat;

    move-result-object v7

    new-instance v8, Ljava/util/Date;

    invoke-direct {v8, v2, v3}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v7, v8}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 535
    :cond_c2
    const-string v2, "\n\nTap Connect Google Drive and choose Google Drive in the picker."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 536
    if-eqz v1, :cond_d6

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_d6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 537
    :cond_d6
    iget-object v1, p0, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;->syncStatus:Landroid/widget/TextView;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 538
    iget-object v0, p0, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;->syncNow:Landroid/widget/Button;

    if-eqz v0, :cond_e8

    iget-object v0, p0, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;->syncNow:Landroid/widget/Button;

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setEnabled(Z)V

    .line 540
    :cond_e8
    :goto_e8
    return-void

    .line 504
    :cond_e9
    :goto_e9
    return-void
.end method

.method setSyncButtonEnabled(Z)V
    .registers 3

    .line 500
    iget-object v0, p0, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;->syncNow:Landroid/widget/Button;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;->syncNow:Landroid/widget/Button;

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 501
    :cond_9
    return-void
.end method
