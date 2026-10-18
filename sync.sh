#!/usr/bin/env bash
# Copy the latest site from the project folder, then commit and push to redeploy GitHub Pages.
set -euo pipefail
SRC="${1:?usage: ./sync.sh <folder with index.html and images/>}"
cd "$(dirname "$0")"
cp "$SRC/index.html" index.html
rsync -a --delete "$SRC/images/" images/
git add -A
git commit -m "Update site from project folder" || { echo "No changes"; exit 0; }
git push origin main
