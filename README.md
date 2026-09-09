# Food Diary — Bl0ck154 build

A minimal personal diary Android app based on **Food Diary 5.0 (21)** / the open-source **DietDiaryApp** lineage, maintained here as a small patch set instead of a redesign.

## What is different

- Separate Android application ID: `com.bl0ck154.fooddiary`
  - can be installed alongside the original `com.food.diary`
  - has its own app data and preferences
- Visible app name stays **Food Diary**
- Maintainer metadata: **Bl0ck154**
- Google Mobile Ads metadata removed
- `INTERNET`, `READ_EXTERNAL_STORAGE`, and `WRITE_EXTERNAL_STORAGE` permissions removed
- obsolete original Google Backup API key removed
- legacy **Rate us** / **Invite friends** UI removed
- automatic Play Store rating prompt disabled
- original-style **Backup & Sync** screen keeps Food Diary's toolbar + tabs
  - **Export** tab uses Android's system file picker
  - **Import** tab migrates an old Food Diary CSV with duplicate protection
  - **Sync** tab explicitly distinguishes Google Drive from local storage
  - Google Drive is considered connected only when the selected DocumentsProvider is actually Google Drive
  - local/non-Drive targets are labeled **local backup only**, never cloud sync
  - the selected JSON target is refreshed automatically after record changes
- local SQLite `Events.db` remains the source of truth

## Migrating from the original app

Android isolates `com.food.diary` and `com.bl0ck154.fooddiary` because they are different application identities and are signed with different keys. The maintained build therefore cannot silently read the original app's private `Events.db`.

One-time migration:

1. In the original Food Diary, export/share the history as CSV.
2. Open **Backup & Sync** in this build.
3. Tap **Import old Food Diary CSV** and select that file.

The importer de-duplicates matching events and does not require broad storage permissions.

## Sync format

The sync file is a readable JSON snapshot containing:

- `id`
- `date`
- `time`
- `typeKey` / `type`
- `subTypeKey` / `subType`
- `description`

No Google OAuth token or password is handled by Food Diary. Android's Storage Access Framework delegates the target to a DocumentsProvider. If the user chooses Google Drive in the system picker, the Google Drive app/provider and its signed-in account own the cloud access. If the user chooses Downloads, Files, or another local provider, the app reports that target as local backup only.

## Versioning

Current maintained build:

- application ID: `com.bl0ck154.fooddiary`
- version code: `50003`
- version name: `5.0.3-bl0ck3`

Future releases should increase `versionCode` so Android accepts them as in-place updates.

## Repository layout

- `src/` — readable source for the added sync component
- `patch/smali/` — compiled smali injected into the exact v5.0 APK
- `tools/patch_apktool.py` — deterministic manifest/resource/smali patcher
- `tools/build.sh` — decode -> patch -> rebuild helper
- `docs/PROVENANCE.md` — base build fingerprints and lineage notes

The original APK is intentionally **not committed**. Supply a Food Diary 5.0 (21) universal APK to the build script.

## Build

Requirements:

- Java/JDK
- Apktool 3.x
- Android SDK build-tools (`zipalign`, `apksigner` for signing)
- Python 3

```bash
APKTOOL_JAR=/path/to/apktool.jar ./tools/build.sh /path/to/FoodDiary-5.0.apk
```

The script creates an unsigned APK under `dist/`. Official APKs in GitHub Releases are signed with the dedicated Bl0ck154 FoodDiaryApp release key; that private key is not stored in this repository.

## Provenance and license

This project preserves the original application's Apache 2.0 attribution. See [`docs/PROVENANCE.md`](docs/PROVENANCE.md) and [`LICENSE`](LICENSE).

Maintained by **[Bl0ck154](https://github.com/Bl0ck154)**.
