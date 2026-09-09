.class Lcom/food/diary/sync/ModernBackupActivity$4$1;
.super Ljava/lang/Object;
.source "ModernBackupActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/food/diary/sync/ModernBackupActivity$4;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/food/diary/sync/ModernBackupActivity$4;


# direct methods
.method constructor <init>(Lcom/food/diary/sync/ModernBackupActivity$4;)V
    .registers 2

    .line 144
    iput-object p1, p0, Lcom/food/diary/sync/ModernBackupActivity$4$1;->this$1:Lcom/food/diary/sync/ModernBackupActivity$4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 146
    iget-object v0, p0, Lcom/food/diary/sync/ModernBackupActivity$4$1;->this$1:Lcom/food/diary/sync/ModernBackupActivity$4;

    iget-object v0, v0, Lcom/food/diary/sync/ModernBackupActivity$4;->this$0:Lcom/food/diary/sync/ModernBackupActivity;

    invoke-static {v0}, Lcom/food/diary/sync/DiarySyncManager;->exportNow(Landroid/content/Context;)Z

    move-result v0

    .line 147
    iget-object v1, p0, Lcom/food/diary/sync/ModernBackupActivity$4$1;->this$1:Lcom/food/diary/sync/ModernBackupActivity$4;

    iget-object v1, v1, Lcom/food/diary/sync/ModernBackupActivity$4;->this$0:Lcom/food/diary/sync/ModernBackupActivity;

    new-instance v2, Lcom/food/diary/sync/ModernBackupActivity$4$1$1;

    invoke-direct {v2, p0, v0}, Lcom/food/diary/sync/ModernBackupActivity$4$1$1;-><init>(Lcom/food/diary/sync/ModernBackupActivity$4$1;Z)V

    invoke-virtual {v1, v2}, Lcom/food/diary/sync/ModernBackupActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 155
    return-void
.end method
