#!/usr/bin/env bash
# One-time setup + push to GitHub. Usage: ./deploy.sh https://github.com/YOUR-USER/curative-letter-generator.git
set -e
REPO_URL="$1"
if [ -z "$REPO_URL" ]; then echo "Usage: ./deploy.sh <github-repo-url>"; exit 1; fi
[ -d .git ] || git init
git add .
git commit -m "Update curative letter generator" || echo "Nothing new to commit"
git branch -M main
git remote remove origin 2>/dev/null || true
git remote add origin "$REPO_URL"
git push -u origin main
echo "Pushed. Render will auto-deploy if the repo is already connected."
