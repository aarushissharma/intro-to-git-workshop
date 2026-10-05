#!/usr/bin/env bash
# Simulates you and a teammate both committing to main at the same time.
# Creates a fake GitHub (a bare repo) plus two clones: yours and your teammate's.
# Usage: bash scripts/make-diverge-lab.sh [path]
set -euo pipefail
LAB="${1:-$HOME/git-labs/diverge-lab}"
if [ -e "$LAB" ]; then echo "$LAB already exists. Delete it or pass a different path."; exit 1; fi
mkdir -p "$LAB" && cd "$LAB"

# "GitHub": a bare repo that both clones push to
git init -q --bare github.git
git -C github.git symbolic-ref HEAD refs/heads/main

# Starting point: a team project with one commit
git clone -q github.git you 2>/dev/null
cd you
git symbolic-ref HEAD refs/heads/main
git config user.name "You"
git config user.email "you@example.com"
printf '# Hackathon App\n\nA campus event finder.\n' > README.md
printf 'function home() {\n  return "Welcome";\n}\n' > app.js
git add . && git commit -q -m "Start project"
git push -q -u origin main
cd ..

# Your teammate clones, commits, and pushes first
git clone -q github.git teammate
cd teammate
git config user.name "Teammate"
git config user.email "teammate@example.com"
printf '\n## How to run\n\nOpen index.html in a browser.\n' >> README.md
git add README.md && git commit -q -m "Add run instructions to README"
git push -q origin main
cd ..

# Meanwhile you commit locally without pulling first
cd you
printf '\nfunction about() {\n  return "About us";\n}\n' >> app.js
git add app.js && git commit -q -m "Add about page"

echo ""
echo "Diverge lab ready at: $LAB"
echo "  $LAB/you       <- your laptop (go here)"
echo "  $LAB/teammate  <- your teammate's laptop"
echo "  $LAB/github.git <- pretend GitHub"
echo "Next: cd \"$LAB/you\" and follow labs/diverging-branches.md"
