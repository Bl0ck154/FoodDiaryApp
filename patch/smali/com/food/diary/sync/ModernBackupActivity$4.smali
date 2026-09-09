.class Lcom/food/diary/sync/ModernBackupActivity$4;
.super Ljava/lang/Object;
.source "ModernBackupActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/food/diary/sync/ModernBackupActivity;->buildUi()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/food/diary/sync/ModernBackupActivity;


# direct methods
.method constructor <init>(Lcom/food/diary/sync/ModernBackupActivity;)V
    .registers 2

    .line 137
    iput-object p1, p0, Lcom/food/diary/sync/ModernBackupActivity$4;->this$0:Lcom/food/diary/sync/ModernBackupActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4

    .line 139
    iget-object p1, p0, Lcom/food/diary/sync/ModernBackupActivity$4;->this$0:Lcom/food/diary/sync/ModernBackupActivity;

    invoke-static {p1}, Lcom/food/diary/sync/DiarySyncManager;->isConfigured(Landroid/content/Context;)Z

    move-result p1

    if-nez p1, :cond_e

    .line 140
    iget-object p1, p0, Lcom/food/diary/sync/ModernBackupActivity$4;->this$0:Lcom/food/diary/sync/ModernBackupActivity;

    invoke-static {p1}, Lcom/food/diary/sync/DiarySyncManager;->launchPicker(Landroid/app/Activity;)V

    .line 141
    return-void

    .line 143
    :cond_e
    iget-object p1, p0, Lcom/food/diary/sync/ModernBackupActivity$4;->this$0:Lcom/food/diary/sync/ModernBackupActivity;

    # getter for: Lcom/food/diary/sync/ModernBackupActivity;->syncNow:Landroid/widget/Button;
    invoke-static {p1}, Lcom/food/diary/sync/ModernBackupActivity;->access$200(Lcom/food/diary/sync/ModernBackupActivity;)Landroid/widget/Button;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    .line 144
    new-instance p1, Ljava/lang/Thread;

    new-instance v0, Lcom/food/diary/sync/ModernBackupActivity$4$1;

    invoke-direct {v0, p0}, Lcom/food/diary/sync/ModernBackupActivity$4$1;-><init>(Lcom/food/diary/sync/ModernBackupActivity$4;)V

    const-string v1, "FoodDiaryManualSync"

    invoke-direct {p1, v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 156
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 157
    return-void
.end method
