#!/bin/bash
# =============================================================================
# restore-case-studies.sh
# Restores the unencrypted case study originals from _src/ back to work/.
# Use this when you want to edit content again before re-encrypting.
# =============================================================================

set -e
cd "$(dirname "$0")"

if [ ! -d _src ] || [ -z "$(ls -A _src 2>/dev/null)" ]; then
  echo "No backups in _src/. Nothing to restore."
  exit 1
fi

for f in _src/*.html; do
  name=$(basename "$f")
  cp "$f" "work/$name"
  echo "  ✓ restored work/$name"
done

echo
echo "Originals restored. Edit work/*.html normally, then run ./encrypt-case-studies.sh again to re-protect."
