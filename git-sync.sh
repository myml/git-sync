#!/bin/sh
set -e

origin=$1
target=$2
force=$3

git clone --bare "$target" .cache || true
git clone --reference-if-able .cache --bare "$origin" .git
git remote add upstream "$target"
git push "$force" --all --prune upstream
git push "$force" upstream --tags