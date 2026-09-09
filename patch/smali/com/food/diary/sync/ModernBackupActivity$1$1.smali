.class Lcom/food/diary/sync/ModernBackupActivity$1$1;
.super Ljava/lang/Object;
.source "ModernBackupActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/food/diary/sync/ModernBackupActivity$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/food/diary/sync/ModernBackupActivity$1;

.field final synthetic val$ok:Z


# direct methods
.method constructor <init>(Lcom/food/diary/sync/ModernBackupActivity$1;Z)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 179
    iput-object p1, p0, Lcom/food/diary/sync/ModernBackupActivity$1$1;->this$1:Lcom/food/diary/sync/ModernBackupActivity$1;

    iput-boolean p2, p0, Lcom/food/diary/sync/ModernBackupActivity$1$1;->val$ok:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 181
    iget-object v0, p0, Lcom/food/diary/sync/ModernBackupActivity$1$1;->this$1:Lcom/food/diary/sync/ModernBackupActivity$1;

    iget-object v0, v0, Lcom/food/diary/sync/ModernBackupActivity$1;->val$fragment:Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;->setSyncButtonEnabled(Z)V

    .line 182
    iget-object v0, p0, Lcom/food/diary/sync/ModernBackupActivity$1$1;->this$1:Lcom/food/diary/sync/ModernBackupActivity$1;

    iget-object v0, v0, Lcom/food/diary/sync/ModernBackupActivity$1;->val$fragment:Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;

    invoke-virtual {v0}, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;->renderSyncStatus()V

    .line 183
    iget-object v0, p0, Lcom/food/diary/sync/ModernBackupActivity$1$1;->this$1:Lcom/food/diary/sync/ModernBackupActivity$1;

    iget-object v0, v0, Lcom/food/diary/sync/ModernBackupActivity$1;->this$0:Lcom/food/diary/sync/ModernBackupActivity;

    .line 184
    iget-boolean v2, p0, Lcom/food/diary/sync/ModernBackupActivity$1$1;->val$ok:Z

    if-eqz v2, :cond_1a

    const-string v2, "Drive file updated. Google Drive handles the cloud upload."

    goto :goto_1c

    .line 185
    :cond_1a
    const-string v2, "Could not update the Drive file."

    :goto_1c
    nop

    .line 183
    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 186
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 187
    return-void
.end method
