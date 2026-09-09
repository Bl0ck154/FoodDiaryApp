.class final Lcom/food/diary/sync/DiarySyncManager$ProviderSnapshot;
.super Ljava/lang/Object;
.source "DiarySyncManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/food/diary/sync/DiarySyncManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ProviderSnapshot"
.end annotation


# instance fields
.field final authority:Ljava/lang/String;

.field final name:Ljava/lang/String;

.field final packageName:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    .line 307
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 308
    const-string v0, ""

    if-nez p1, :cond_8

    move-object p1, v0

    :cond_8
    iput-object p1, p0, Lcom/food/diary/sync/DiarySyncManager$ProviderSnapshot;->name:Ljava/lang/String;

    .line 309
    if-nez p2, :cond_d

    move-object p2, v0

    :cond_d
    iput-object p2, p0, Lcom/food/diary/sync/DiarySyncManager$ProviderSnapshot;->packageName:Ljava/lang/String;

    .line 310
    if-nez p3, :cond_12

    move-object p3, v0

    :cond_12
    iput-object p3, p0, Lcom/food/diary/sync/DiarySyncManager$ProviderSnapshot;->authority:Ljava/lang/String;

    .line 311
    return-void
.end method
