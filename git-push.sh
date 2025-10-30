#!/bin/bash


set -e  # Exit if any command fails

BRANCH="main"
COMMIT_MSG=${1:-"Auto commit on $(date '+%Y-%m-%d %H:%M:%S')"}

# Ensure user identity is configured
if ! git config user.name >/dev/null; then
  echo "⚙️  Setting Git username..."
  git config --global user.name "Darshan"
fi

if ! git config user.email >/dev/null; then
  echo "⚙️  Setting Git email..."
  git config --global user.email "darshancr9695@gmail.com"
fi

echo "📦 Adding all changes..."
git add .

echo "💬 Committing with message: '$COMMIT_MSG'"
git commit -m "$COMMIT_MSG" || echo "⚠️ Nothing new to commit."

# Ensure branch name is main
git branch -M $BRANCH

echo "🚀 Pushing changes to 'main'..."
git push -u origin $BRANCH

echo "✅ Successfully pushed to 'main' branch!"
