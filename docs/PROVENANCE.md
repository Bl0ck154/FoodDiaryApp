# Provenance

## Lineage

The package analyzed for this maintained build is Food Diary 5.0 (21), package `com.food.diary`.

Its database model, event schema, class names and UI lineage match the Apache-2.0 project `canyapan/DietDiaryApp`:

- https://github.com/canyapan/DietDiaryApp

The maintained build does not claim original authorship. It identifies **Bl0ck154** as the current maintainer and preserves the Apache 2.0 license notice.

## Exact base fingerprint

Universal Food Diary 5.0 APK used for reproducible patch validation:

- SHA-256: `1a9e7b59e74413dce56cf86193f890f79d3028dade7458cc845dd8a51afe26ad`
- original application ID: `com.food.diary`
- versionCode: `21`
- versionName: `5.0`
- minSdk: `19`
- targetSdk: `34`

The DEX payload of this universal APK was checked against the split bundle supplied for analysis and matched.

## Maintained identity

- application ID: `com.bl0ck154.fooddiary`
- visible label: `Food Diary`
- maintainer: `Bl0ck154`
- release signing certificate SHA-256: `81314eb714174d95f791b0f2ec8170ddd8657b8d6c01665e4f91b5729f0adaae`

Changing only the application ID/authorities while retaining the original Java package namespace is intentional. Android application identity is determined by the application/package ID and signing identity; Java class packages do not need to be renamed merely to install the maintained build alongside the original.
