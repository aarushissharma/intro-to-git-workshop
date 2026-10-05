#!/usr/bin/env bash
# Builds a tiny repo with a merge conflict waiting to happen.
# Usage: bash scripts/make-conflict-lab.sh [path]
set -euo pipefail
LAB="${1:-$HOME/git-labs/conflict-lab}"
if [ -e "$LAB" ]; then echo "$LAB already exists. Delete it or pass a different path."; exit 1; fi
mkdir -p "$LAB" && cd "$LAB"
git init -q && git symbolic-ref HEAD refs/heads/main
c() { git -c user.name="Lab Bot" -c user.email="lab@example.com" commit -q -m "$1"; }

printf 'Pancakes\n2 cups flour\n1 cup milk\n2 eggs\nCook on medium heat\n' > recipe.txt
git add recipe.txt && c "Add pancake recipe"

git checkout -q -b alice
printf 'Pancakes\n2 cups flour\n1 cup oat milk\n2 eggs\nCook on medium heat\n' > recipe.txt
git add recipe.txt && c "Switch to oat milk"

git checkout -q main
printf 'Pancakes\n2 cups flour\n1.5 cups milk\n2 eggs\nCook on medium heat\n' > recipe.txt
git add recipe.txt && c "Use more milk for fluffier pancakes"

echo ""
echo "Conflict lab ready at: $LAB"
echo "Next: cd \"$LAB\" and follow labs/conflict-solo.md"
