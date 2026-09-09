#!/usr/bin/env python3
from pathlib import Path
import re
import shutil
import sys

APP_ID = "com.bl0ck154.fooddiary"
OLD_ID = "com.food.diary"
SYNC_ID = "0x534e43"


def read(path: Path) -> str:
    return path.read_text(encoding="utf-8")


def write(path: Path, text: str) -> None:
    path.write_text(text, encoding="utf-8")


def replace_once(text: str, old: str, new: str, label: str) -> str:
    if old not in text:
        if new in text:
            return text
        raise RuntimeError(f"Cannot find {label}")
    return text.replace(old, new, 1)


def patch_manifest(root: Path) -> None:
    path = root / "AndroidManifest.xml"
    text = read(path)
    text = text.replace(f"package=\"{OLD_ID}\"", f"package=\"{APP_ID}\"")
    text = text.replace(f"android:name=\"{OLD_ID}.provider.permission.READ\"", f"android:name=\"{APP_ID}.provider.permission.READ\"")
    text = text.replace(f"android:name=\"{OLD_ID}.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION\"", f"android:name=\"{APP_ID}.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION\"")
    text = text.replace(f"android:authorities=\"{OLD_ID}.provider\"", f"android:authorities=\"{APP_ID}.provider\"")
    text = text.replace(f"android:readPermission=\"{OLD_ID}.provider.permission.READ\"", f"android:readPermission=\"{APP_ID}.provider.permission.READ\"")
    text = text.replace(f"android:authorities=\"{OLD_ID}.acra\"", f"android:authorities=\"{APP_ID}.acra\"")
    text = text.replace(f"android:authorities=\"{OLD_ID}.androidx-startup\"", f"android:authorities=\"{APP_ID}.androidx-startup\"")

    # No network transport is used by the maintained build. Keep ACCESS_NETWORK_STATE
    # because legacy code still queries connectivity, but remove INTERNET itself.
    text = re.sub(r"\s*<uses-permission android:name=\"android.permission.INTERNET\"/>\n", "\n", text, count=1)
    text = re.sub(r"\s*<meta-data android:name=\"com.google.android.gms.ads.APPLICATION_ID\"[^\n]*/>\n", "\n", text, count=1)
    text = re.sub(r"\s*<meta-data android:name=\"com.google.android.backup.api_key\"[^\n]*/>\n", "\n", text, count=1)

    marker = "<application "
    start = text.find(marker)
    if start < 0:
        raise RuntimeError("application element not found")
    close = text.find(">", start)
    maintain = "\n        <meta-data android:name=\"app.maintainer\" android:value=\"Bl0ck154\"/>"
    if "app.maintainer" not in text:
        text = text[: close + 1] + maintain + text[close + 1 :]
    write(path, text)


def patch_version(root: Path) -> None:
    path = root / "apktool.yml"
    text = read(path)
    text = re.sub(r"(?m)^  versionCode: .*?$", "  versionCode: 50001", text, count=1)
    text = re.sub(r"(?m)^  versionName: .*?$", "  versionName: 5.0.1-bl0ck1", text, count=1)
    write(path, text)


def patch_resources(root: Path) -> None:
    strings = root / "res/values/strings.xml"
    text = read(strings)
    text = re.sub(r"<string name=\"about_copyright\">.*?</string>",
                  "<string name=\"about_copyright\">Maintained by Bl0ck154 • based on DietDiaryApp</string>", text, count=1)
    text = re.sub(r"<string name=\"about_github\"\s*/>",
                  "<string name=\"about_github\">https://github.com/Bl0ck154/FoodDiaryApp</string>", text, count=1)
    write(strings, text)

    drawer = root / "res/menu/activity_main_drawer.xml"
    if drawer.exists():
        text = read(drawer)
        text = re.sub(r"\s*<item[^>]*android:id=\"@id/nav_invite\"[^>]*/>", "", text)
        text = re.sub(r"\s*<item[^>]*android:id=\"@id/nav_rate\"[^>]*/>", "", text)
        write(drawer, text)


def patch_export_authority(root: Path) -> None:
    path = root / "smali/com/food/diary/fragments/ExportAsyncTask.smali"
    text = read(path)
    text = text.replace(f"content://{OLD_ID}.provider/", f"content://{APP_ID}.provider/")
    write(path, text)


def copy_sync_smali(root: Path, repo: Path) -> None:
    src = repo / "patch/smali/com/food/diary/sync"
    dst = root / "smali/com/food/diary/sync"
    dst.mkdir(parents=True, exist_ok=True)
    for item in src.glob("*.smali"):
        shutil.copy2(item, dst / item.name)


def patch_event_helper(root: Path) -> None:
    path = root / "smali/com/food/diary/db/EventHelper.smali"
    text = read(path)

    for name in ("insert", "update", "delete"):
        sig = rf"\.method public static {name}\(Landroid/content/Context;Lcom/food/diary/models/Event;\)Z\n.*?\.end method"
        match = re.search(sig, text, re.S)
        if not match:
            raise RuntimeError(f"EventHelper.{name}(Context, Event) not found")
        method = match.group(0)
        if "DiarySyncManager;->schedule" in method:
            continue
        method = method.replace("    .locals 1", "    .locals 2", 1)
        method = method.replace("    new-instance v0, Lcom/food/diary/db/DatabaseHelper;",
                                "    move-object v1, p0\n\n    new-instance v0, Lcom/food/diary/db/DatabaseHelper;", 1)
        close_return = "    invoke-virtual {v0}, Lcom/food/diary/db/DatabaseHelper;->close()V\n\n    return p0"
        replacement = (
            "    invoke-virtual {v0}, Lcom/food/diary/db/DatabaseHelper;->close()V\n\n"
            f"    if-eqz p0, :cond_sync_{name}\n\n"
            "    invoke-static {v1}, Lcom/food/diary/sync/DiarySyncManager;->schedule(Landroid/content/Context;)V\n\n"
            f"    :cond_sync_{name}\n"
            "    return p0"
        )
        if close_return not in method:
            raise RuntimeError(f"EventHelper.{name} successful return shape changed")
        method = method.replace(close_return, replacement, 1)
        text = text[:match.start()] + method + text[match.end():]

    write(path, text)


def patch_main_activity(root: Path) -> None:
    path = root / "smali/com/food/diary/MainActivity.smali"
    text = read(path)

    # Disable the legacy Play Store rating prompt. It would point at the new,
    # intentionally non-Play-Store application id.
    pat = re.compile(r"\.method private checkAppRateStatus\(\)V\n.*?\.end method", re.S)
    repl = ".method private checkAppRateStatus()V\n    .locals 0\n\n    return-void\n.end method"
    if pat.search(text):
        text = pat.sub(repl, text, count=1)

    if ".method protected onStart()V" not in text:
        hook = """

.method protected onStart()V
    .locals 0

    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onStart()V

    invoke-static {p0}, Lcom/food/diary/sync/DiarySyncManager;->schedule(Landroid/content/Context;)V

    return-void
.end method
"""
        text += hook
    write(path, text)


def patch_backup_restore(root: Path) -> None:
    path = root / "smali/com/food/diary/BackupRestoreActivity.smali"
    text = read(path)

    menu_pat = re.compile(r"\.method public onCreateOptionsMenu\(Landroid/view/Menu;\)Z\n.*?\.end method", re.S)
    menu_repl = """.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 4

    invoke-virtual {p0}, Lcom/food/diary/BackupRestoreActivity;->getMenuInflater()Landroid/view/MenuInflater;
    move-result-object v0
    const v1, 0x7f0e0001
    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    const/4 v0, 0x0
    const v1, 0x534e43
    const/16 v2, 0x64
    const-string v3, "Sync file…"
    invoke-interface {p1, v0, v1, v2, v3}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;
    move-result-object v0

    const/4 p1, 0x1
    return p1
.end method"""
    if not menu_pat.search(text):
        raise RuntimeError("BackupRestoreActivity.onCreateOptionsMenu not found")
    text = menu_pat.sub(menu_repl, text, count=1)

    options_pat = re.compile(r"\.method public onOptionsItemSelected\(Landroid/view/MenuItem;\)Z\n.*?\.end method", re.S)
    options_repl = """.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I
    move-result v0

    const v1, 0x534e43
    if-ne v0, v1, :cond_sync_next
    invoke-static {p0}, Lcom/food/diary/sync/DiarySyncManager;->launchPicker(Landroid/app/Activity;)V
    const/4 p1, 0x1
    return p1

    :cond_sync_next
    const v1, 0x102002c
    if-ne v0, v1, :cond_home_next
    invoke-virtual {p0}, Lcom/food/diary/BackupRestoreActivity;->finish()V
    const/4 p1, 0x1
    return p1

    :cond_home_next
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z
    move-result p1
    return p1
.end method"""
    if not options_pat.search(text):
        raise RuntimeError("BackupRestoreActivity.onOptionsItemSelected not found")
    text = options_pat.sub(options_repl, text, count=1)

    if ".method protected onActivityResult(IILandroid/content/Intent;)V" not in text:
        result_hook = """

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    invoke-static {p0, p1, p2, p3}, Lcom/food/diary/sync/DiarySyncManager;->handleActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)Z
    move-result v0
    if-nez v0, :cond_done

    invoke-super {p0, p1, p2, p3}, Landroidx/appcompat/app/AppCompatActivity;->onActivityResult(IILandroid/content/Intent;)V

    :cond_done
    return-void
.end method
"""
        text += result_hook
    write(path, text)


def main() -> None:
    if len(sys.argv) != 2:
        raise SystemExit("usage: patch_apktool.py <apktool-decoded-dir>")
    root = Path(sys.argv[1]).resolve()
    repo = Path(__file__).resolve().parents[1]
    if not (root / "AndroidManifest.xml").exists():
        raise SystemExit(f"not an apktool directory: {root}")
    patch_manifest(root)
    patch_version(root)
    patch_resources(root)
    patch_export_authority(root)
    copy_sync_smali(root, repo)
    patch_event_helper(root)
    patch_main_activity(root)
    patch_backup_restore(root)
    print(f"Patched {root} for {APP_ID}")


if __name__ == "__main__":
    main()
