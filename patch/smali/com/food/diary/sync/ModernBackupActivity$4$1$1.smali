.class Lcom/food/diary/sync/ModernBackupActivity$4$1$1;
.super Ljava/lang/Object;
.source "ModernBackupActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/food/diary/sync/ModernBackupActivity$4$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/food/diary/sync/ModernBackupActivity$4$1;

.field final synthetic val$ok:Z


# direct methods
.method constructor <init>(Lcom/food/diary/sync/ModernBackupActivity$4$1;Z)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 147
    iput-object p1, p0, Lcom/food/diary/sync/ModernBackupActivity$4$1$1;->this$2:Lcom/food/diary/sync/ModernBackupActivity$4$1;

    iput-boolean p2, p0, Lcom/food/diary/sync/ModernBackupActivity$4$1$1;->val$ok:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 149
    iget-object v0, p0, Lcom/food/diary/sync/ModernBackupActivity$4$1$1;->this$2:Lcom/food/diary/sync/ModernBackupActivity$4$1;

    iget-object v0, v0, Lcom/food/diary/sync/ModernBackupActivity$4$1;->this$1:Lcom/food/diary/sync/ModernBackupActivity$4;

    iget-object v0, v0, Lcom/food/diary/sync/ModernBackupActivity$4;->this$0:Lcom/food/diary/sync/ModernBackupActivity;

    # getter for: Lcom/food/diary/sync/ModernBackupActivity;->syncNow:Landroid/widget/Button;
    invoke-static {v0}, Lcom/food/diary/sync/ModernBackupActivity;->access$200(Lcom/food/diary/sync/ModernBackupActivity;)Landroid/widget/Button;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 150
    iget-object v0, p0, Lcom/food/diary/sync/ModernBackupActivity$4$1$1;->this$2:Lcom/food/diary/sync/ModernBackupActivity$4$1;

    iget-object v0, v0, Lcom/food/diary/sync/ModernBackupActivity$4$1;->this$1:Lcom/food/diary/sync/ModernBackupActivity$4;

    iget-object v0, v0, Lcom/food/diary/sync/ModernBackupActivity$4;->this$0:Lcom/food/diary/sync/ModernBackupActivity;

    # invokes: Lcom/food/diary/sync/ModernBackupActivity;->refreshStatus()V
    invoke-static {v0}, Lcom/food/diary/sync/ModernBackupActivity;->access$300(Lcom/food/diary/sync/ModernBackupActivity;)V

    .line 151
    iget-object v0, p0, Lcom/food/diary/sync/ModernBackupActivity$4$1$1;->this$2:Lcom/food/diary/sync/ModernBackupActivity$4$1;

    iget-object v0, v0, Lcom/food/diary/sync/ModernBackupActivity$4$1;->this$1:Lcom/food/diary/sync/ModernBackupActivity$4;

    iget-object v0, v0, Lcom/food/diary/sync/ModernBackupActivity$4;->this$0:Lcom/food/diary/sync/ModernBackupActivity;

    .line 152
    iget-boolean v2, p0, Lcom/food/diary/sync/ModernBackupActivity$4$1$1;->val$ok:Z

    if-eqz v2, :cond_24

    const-string v2, "Synced"

    goto :goto_26

    :cond_24
    const-string v2, "Sync failed"

    .line 151
    :goto_26
    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 152
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 153
    return-void
.end method
