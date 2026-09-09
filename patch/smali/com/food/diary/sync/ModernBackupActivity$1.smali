.class Lcom/food/diary/sync/ModernBackupActivity$1;
.super Ljava/lang/Object;
.source "ModernBackupActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/food/diary/sync/ModernBackupActivity;->manualSync(Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/food/diary/sync/ModernBackupActivity;

.field final synthetic val$fragment:Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;


# direct methods
.method constructor <init>(Lcom/food/diary/sync/ModernBackupActivity;Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 176
    iput-object p1, p0, Lcom/food/diary/sync/ModernBackupActivity$1;->this$0:Lcom/food/diary/sync/ModernBackupActivity;

    iput-object p2, p0, Lcom/food/diary/sync/ModernBackupActivity$1;->val$fragment:Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 178
    iget-object v0, p0, Lcom/food/diary/sync/ModernBackupActivity$1;->this$0:Lcom/food/diary/sync/ModernBackupActivity;

    invoke-static {v0}, Lcom/food/diary/sync/DiarySyncManager;->exportNow(Landroid/content/Context;)Z

    move-result v0

    .line 179
    iget-object v1, p0, Lcom/food/diary/sync/ModernBackupActivity$1;->this$0:Lcom/food/diary/sync/ModernBackupActivity;

    new-instance v2, Lcom/food/diary/sync/ModernBackupActivity$1$1;

    invoke-direct {v2, p0, v0}, Lcom/food/diary/sync/ModernBackupActivity$1$1;-><init>(Lcom/food/diary/sync/ModernBackupActivity$1;Z)V

    invoke-virtual {v1, v2}, Lcom/food/diary/sync/ModernBackupActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 189
    return-void
.end method
