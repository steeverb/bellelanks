#!/bin/bash
# =============================================================================
# encrypt-case-studies.sh
# Password-protects all 5 case study HTML files using StaticCrypt (AES-256).
#
# Workflow:
#   1. Edit case studies normally in work/*.html
#   2. Before pushing to GitHub, run this script:
#         ./encrypt-case-studies.sh "your-password"
#      (omit the password to be prompted privately)
#   3. Originals are backed up to _src/ (gitignored, never pushed)
#   4. The encrypted versions in work/*.html are what get committed and served
#   5. To edit again later, run ./restore-case-studies.sh first
#
# Requirements: Node.js (npx is used; no global install needed)
# =============================================================================

set -e
cd "$(dirname "$0")"

PASSWORD="$1"
if [ -z "$PASSWORD" ]; then
  read -rsp "Password to protect case studies with: " PASSWORD
  echo
  if [ -z "$PASSWORD" ]; then
    echo "No password provided. Aborting."
    exit 1
  fi
fi

if ! command -v npx >/dev/null 2>&1; then
  echo "Error: npx not found. Install Node.js from https://nodejs.org first."
  exit 1
fi

if [ ! -f password-page-overrides.html ]; then
  echo "Error: password-page-overrides.html is missing — needed to restyle the lock screen."
  exit 1
fi

# 1. Back up originals (only the first time — preserves clean source)
mkdir -p _src
for f in work/*.html; do
  name=$(basename "$f")
  if [ ! -f "_src/$name" ]; then
    cp "$f" "_src/$name"
    echo "→ backed up work/$name to _src/"
  fi
done

# 2. Encrypt from the clean source copies into work/, then inject editorial styles
echo
echo "Encrypting case studies…"
for src in _src/*.html; do
  name=$(basename "$src")
  npx --yes staticrypt "$src" --password "$PASSWORD" --short -d work > /dev/null

  # Inject the editorial restyle so the lock screen matches the site
  python3 - "$name" <<'PYEOF'
import sys, pathlib
name = sys.argv[1]
path = pathlib.Path(f"work/{name}")
src = path.read_text()
overrides = pathlib.Path("password-page-overrides.html").read_text()
# Idempotent — re-running is safe; we only inject once per file
if '</head>' in src and 'editorial-header' not in src:
    src = src.replace('</head>', overrides + '\n</head>')
    path.write_text(src)
PYEOF

  echo "  ✓ work/$name"
done

echo
echo "Done. Visitors will need the password to view the 5 case studies."
echo "Originals are in _src/ (gitignored — won't be pushed)."
echo "To revert and edit, run: ./restore-case-studies.sh"
