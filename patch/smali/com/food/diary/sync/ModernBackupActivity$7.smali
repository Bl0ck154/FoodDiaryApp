.class Lcom/food/diary/sync/ModernBackupActivity$7;
.super Ljava/lang/Object;
.source "ModernBackupActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/food/diary/sync/ModernBackupActivity;->onActivityResult(IILandroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/food/diary/sync/ModernBackupActivity;

.field final synthetic val$uri:Landroid/net/Uri;


# direct methods
.method constructor <init>(Lcom/food/diary/sync/ModernBackupActivity;Landroid/net/Uri;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 236
    iput-object p1, p0, Lcom/food/diary/sync/ModernBackupActivity$7;->this$0:Lcom/food/diary/sync/ModernBackupActivity;

    iput-object p2, p0, Lcom/food/diary/sync/ModernBackupActivity$7;->val$uri:Landroid/net/Uri;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 237
    iget-object v0, p0, Lcom/food/diary/sync/ModernBackupActivity$7;->this$0:Lcom/food/diary/sync/ModernBackupActivity;

    iget-object v1, p0, Lcom/food/diary/sync/ModernBackupActivity$7;->val$uri:Landroid/net/Uri;

    # invokes: Lcom/food/diary/sync/ModernBackupActivity;->exportCsv(Landroid/net/Uri;)V
    invoke-static {v0, v1}, Lcom/food/diary/sync/ModernBackupActivity;->access$600(Lcom/food/diary/sync/ModernBackupActivity;Landroid/net/Uri;)V

    return-void
.end method
