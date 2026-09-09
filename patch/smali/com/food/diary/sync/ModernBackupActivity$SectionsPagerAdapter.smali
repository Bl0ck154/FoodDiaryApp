.class public final Lcom/food/diary/sync/ModernBackupActivity$SectionsPagerAdapter;
.super Landroidx/fragment/app/FragmentPagerAdapter;
.source "ModernBackupActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/food/diary/sync/ModernBackupActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "SectionsPagerAdapter"
.end annotation


# direct methods
.method public constructor <init>(Landroidx/fragment/app/FragmentManager;)V
    .registers 2

    .line 408
    invoke-direct {p0, p1}, Landroidx/fragment/app/FragmentPagerAdapter;-><init>(Landroidx/fragment/app/FragmentManager;)V

    .line 409
    return-void
.end method


# virtual methods
.method public getCount()I
    .registers 2

    .line 411
    const/4 v0, 0x3

    return v0
.end method

.method public getItem(I)Landroidx/fragment/app/Fragment;
    .registers 2

    .line 414
    invoke-static {p1}, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;->newInstance(I)Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;

    move-result-object p1

    return-object p1
.end method

.method public getPageTitle(I)Ljava/lang/CharSequence;
    .registers 3

    .line 418
    if-nez p1, :cond_5

    const-string p1, "Export"

    return-object p1

    .line 419
    :cond_5
    const/4 v0, 0x1

    if-ne p1, v0, :cond_b

    const-string p1, "Import"

    return-object p1

    .line 420
    :cond_b
    const-string p1, "Sync"

    return-object p1
.end method
