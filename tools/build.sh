#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "usage: APKTOOL_JAR=/path/to/apktool.jar $0 /path/to/FoodDiary-5.0.apk" >&2
  exit 2
fi

BASE_APK="$(realpath "$1")"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
APKTOOL_JAR="${APKTOOL_JAR:?Set APKTOOL_JAR to Apktool 3.x jar}"
WORK="$ROOT/.work"
DIST="$ROOT/dist"
DECODED="$WORK/decoded"
UNSIGNED="$DIST/FoodDiary-Bl0ck154-v5.0.3-bl0ck3-unsigned.apk"

rm -rf "$WORK"
mkdir -p "$WORK" "$DIST"

java -jar "$APKTOOL_JAR" d -f "$BASE_APK" -o "$DECODED"
python3 "$ROOT/tools/patch_apktool.py" "$DECODED"
java -jar "$APKTOOL_JAR" b "$DECODED" -o "$UNSIGNED"

printf 'Built: %s\n' "$UNSIGNED"
printf 'Sign with your own persistent key, or use the official APK from GitHub Releases.\n'
