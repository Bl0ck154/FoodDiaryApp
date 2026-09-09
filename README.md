# Food Diary — Bl0ck154 build

A minimal personal diary Android app based on **Food Diary 5.0 (21)** / the open-source **DietDiaryApp** lineage, maintained here as a small patch set instead of a redesign.

## What is different

- Separate Android application ID: `com.bl0ck154.fooddiary`
  - can be installed alongside the original `com.food.diary`
  - has its own app data and preferences
- Visible app name stays **Food Diary**
- Maintainer metadata: **Bl0ck154**
- Google Mobile Ads metadata removed
- `INTERNET` permission removed
- obsolete original Google Backup API key removed
- legacy **Rate us** / **Invite friends** UI removed
- automatic Play Store rating prompt disabled
- optional JSON sync through Android's system document picker
  - choose `Backup / Restore -> Sync file…`
  - select Google Drive (or any Storage Access Framework provider)
  - the app keeps updating the selected `FoodDiary.json`
- local SQLite `Events.db` remains the source of truth

## Sync format

The sync file is a readable JSON snapshot containing:

- `id`
- `date`
- `time`
- `typeKey` / `type`
- `subTypeKey` / `subType`
- `description`

No account, OAuth implementation, custom backend, or background network service is added to Food Diary. The selected document provider handles cloud storage.

## Versioning

Current maintained build:

- application ID: `com.bl0ck154.fooddiary`
- version code: `50001`
- version name: `5.0.1-bl0ck1`

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
