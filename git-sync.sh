#!/bin/sh
set -e
origin=$1
target=$2

rm -rf .cache .git

if [ "$SYNC_MIRROR_CACHE" ]; then
    echo + git clone --bare "\$SYNC_MIRROR_CACHE" .cache || true
    git clone --bare "$SYNC_MIRROR_CACHE" .cache || true
fi

echo + git clone --reference-if-able .cache --bare "\$origin" .git
git clone --reference-if-able .cache --bare "$origin" .git
echo + git remote add upstream "\$target"
git remote add upstream "$target"

set -x

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