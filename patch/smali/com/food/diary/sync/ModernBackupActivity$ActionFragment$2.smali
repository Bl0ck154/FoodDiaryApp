.class Lcom/food/diary/sync/ModernBackupActivity$ActionFragment$2;
.super Ljava/lang/Object;
.source "ModernBackupActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;

.field final synthetic val$activity:Lcom/food/diary/sync/ModernBackupActivity;


# direct methods
.method constructor <init>(Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;Lcom/food/diary/sync/ModernBackupActivity;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 465
    iput-object p1, p0, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment$2;->this$0:Lcom/food/diary/sync/ModernBackupActivity$ActionFragment;

    iput-object p2, p0, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment$2;->val$activity:Lcom/food/diary/sync/ModernBackupActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 2

    .line 466
    iget-object p1, p0, Lcom/food/diary/sync/ModernBackupActivity$ActionFragment$2;->val$activity:Lcom/food/diary/sync/ModernBackupActivity;

    invoke-virtual {p1}, Lcom/food/diary/sync/ModernBackupActivity;->launchImportCsv()V

    return-void
.end method
