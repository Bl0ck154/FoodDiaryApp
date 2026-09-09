.class Lcom/food/diary/sync/ModernBackupActivity$3;
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

    .line 131
    iput-object p1, p0, Lcom/food/diary/sync/ModernBackupActivity$3;->this$0:Lcom/food/diary/sync/ModernBackupActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 2

    .line 132
    iget-object p1, p0, Lcom/food/diary/sync/ModernBackupActivity$3;->this$0:Lcom/food/diary/sync/ModernBackupActivity;

    invoke-static {p1}, Lcom/food/diary/sync/DiarySyncManager;->launchPicker(Landroid/app/Activity;)V

    return-void
.end method
