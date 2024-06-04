#!/bin/sh
set -e
set -x
origin=$1
target=$2

rm -rf .cache .git

git clone --bare "$target" .cache || true
git clone --reference-if-able .cache --bare "$origin" .git
git remote add upstream "$target"

force=
if [ "$SYNC_FORCE_PUSH" ]; then
  force="--force"
fi

if [ "$SYNC_BRANCH_PATTERN" ]; then
    git branch --format '%(refname)' --list $SYNC_BRANCH_PATTERN | xargs -i git push $force --prune upstream {}
else
    git push $force --all --prune upstream
fi
git push $force --tags upstream