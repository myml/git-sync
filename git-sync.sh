#!/bin/sh
set -e

origin=$1
target=$2
force=$3

rm -rf .cache .git

git clone --bare "$target" .cache || true
git clone --reference-if-able .cache --bare "$origin" .git
git remote add upstream "$target"

if [ "$force" ]; then
    git push --force --all --prune upstream
    git push --force --tags upstream
else
    git push --all --prune upstream
    git push --tags upstream
fi