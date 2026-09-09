.class Lcom/food/diary/sync/DiarySyncManager$2;
.super Ljava/lang/Object;
.source "DiarySyncManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/food/diary/sync/DiarySyncManager;->schedule(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$app:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 110
    iput-object p1, p0, Lcom/food/diary/sync/DiarySyncManager$2;->val$app:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .line 113
    iget-object v0, p0, Lcom/food/diary/sync/DiarySyncManager$2;->val$app:Landroid/content/Context;

    invoke-static {v0}, Lcom/food/diary/sync/DiarySyncManager;->exportNow(Landroid/content/Context;)Z

    .line 114
    return-void
.end method
