#!/usr/bin/env bash
# Runs the same checks as the GitHub Action. Run it yourself before pushing:
#   bash scripts/check.sh

cd "$(git rev-parse --show-toplevel)" || exit 1
fail=0
err() { echo "  FAIL: $1"; fail=1; }

echo "Checking people/ files..."
for f in people/*.md; do
  base=$(basename "$f")
  [ "$base" = "_template.md" ] && continue
  if ! echo "$base" | grep -Eq '^[a-z0-9]+(-[a-z0-9]+)*\.md$'; then
    err "$f: use lowercase letters, numbers, and hyphens only (like jane-doe.md)"
  fi
  for field in "Name" "Major" "Fun fact"; do
    if ! grep -Eq "^${field}:[[:space:]]*[^[:space:]]" "$f"; then
      err "$f: fill in the '${field}:' line"
    fi
  done
done

echo "Checking for leftover conflict markers..."
for f in $(git ls-files people); do
  if grep -nE '^(<<<<<<<|>>>>>>>)( |$)|^=======$' "$f" >/dev/null; then
    err "$f still has conflict markers. Delete the <<<<<<<, =======, and >>>>>>> lines."
  fi
done

echo "Checking for secrets..."
if git ls-files | grep -Eq '(^|/)\.env$'; then
  err "a .env file is committed. Remove it with: git rm --cached .env"
fi
patterns='AKIA[0-9A-Z]{16}|ghp_[A-Za-z0-9]{36}|github_pat_[A-Za-z0-9_]{40,}|sk-[A-Za-z0-9_-]{20,}|AIza[0-9A-Za-z_-]{35}|-----BEGIN [A-Z ]*PRIVATE KEY-----'
for f in $(git ls-files | grep -v '^scripts/check.sh$'); do
  if grep -Eq "$patterns" "$f" 2>/dev/null; then
    err "$f looks like it contains a secret key. Remove it and rotate the key."
  fi
done

if [ $fail -eq 0 ]; then
  echo "All checks passed!"
else
  echo "Some checks failed. Fix the issues above, commit, and push again."
fi
exit $fail
