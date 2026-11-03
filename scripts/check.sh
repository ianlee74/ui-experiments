#!/usr/bin/env bash
# Checks that every experiment is complete and listed on the landing page.
# Run from anywhere: scripts/check.sh
set -euo pipefail
cd "$(dirname "$0")/.."

status=0
fail() { echo "FAIL: $1"; status=1; }

for dir in experiments/*/; do
  name=$(basename "$dir")
  [[ "$name" == _* ]] && continue

  [[ "$name" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]] || fail "$name: folder name should be lowercase words joined by hyphens"
  for file in index.html README.md preview.png; do
    [[ -f "$dir$file" ]] || fail "$name: missing $file"
  done
  grep -q "experiments/$name/" index.html || fail "$name: not linked from the landing page (index.html)"
  grep -q "experiments/$name/" README.md || fail "$name: not listed in the root README.md"

  # Every page needs a <title> and a way back to the landing page.
  for page in "$dir"*.html; do
    grep -q "<title>" "$page" || fail "$page: missing <title>"
    grep -q 'href="../../"' "$page" || fail "$page: missing breadcrumb link to the landing page"
  done
done

if [[ $status -eq 0 ]]; then
  echo "All experiments look complete."
fi
exit $status
