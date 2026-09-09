.class Lcom/food/diary/sync/ModernBackupActivity$8;
.super Ljava/lang/Object;
.source "ModernBackupActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/food/diary/sync/ModernBackupActivity;->importCsv(Landroid/net/Uri;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/food/diary/sync/ModernBackupActivity;

.field final synthetic val$message:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/food/diary/sync/ModernBackupActivity;Ljava/lang/String;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 323
    iput-object p1, p0, Lcom/food/diary/sync/ModernBackupActivity$8;->this$0:Lcom/food/diary/sync/ModernBackupActivity;

    iput-object p2, p0, Lcom/food/diary/sync/ModernBackupActivity$8;->val$message:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 324
    iget-object v0, p0, Lcom/food/diary/sync/ModernBackupActivity$8;->this$0:Lcom/food/diary/sync/ModernBackupActivity;

    iget-object v1, p0, Lcom/food/diary/sync/ModernBackupActivity$8;->val$message:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method
