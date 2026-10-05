#!/usr/bin/env bash
# Builds a repo with 35 commits. One of them secretly breaks the code.
# Usage: bash scripts/make-bisect-lab.sh [path]
set -euo pipefail
LAB="${1:-$HOME/git-labs/bisect-lab}"
if [ -e "$LAB" ]; then echo "$LAB already exists. Delete it or pass a different path."; exit 1; fi
mkdir -p "$LAB" && cd "$LAB"
git init -q && git symbolic-ref HEAD refs/heads/main
c() { git -c user.name="Lab Bot" -c user.email="lab@example.com" commit -q -m "$1"; }

write_price() {
  cat > price.sh <<EOS
#!/usr/bin/env bash
# Final price of a \$100 item after the student discount
PRICE=100
DISCOUNT=$1
echo \$(( PRICE - PRICE * DISCOUNT / 100 ))
EOS
}

write_price 10
cat > test.sh <<'EOS'
#!/usr/bin/env bash
result=$(bash price.sh)
if [ "$result" = "90" ]; then
  echo "PASS: price is $result"
  exit 0
else
  echo "FAIL: expected 90, got $result"
  exit 1
fi
EOS
chmod +x test.sh price.sh
echo "# Store features" > features.md
git add . && c "Add price calculator and test"

msgs=("Add shopping cart page" "Add login button" "Fix typo in footer" "Add dark mode toggle"
"Update README" "Add search bar" "Improve loading speed" "Add product images"
"Fix mobile layout" "Add wishlist" "Tidy up price.sh formatting" "Add order history"
"Rename variables for clarity" "Add newsletter signup" "Fix broken link" "Add reviews section"
"Update dependencies" "Add gift cards" "Fix checkout button color" "Add size guide"
"Add store locator" "Improve accessibility labels" "Add coupon field" "Fix date format"
"Add shipping estimates" "Refactor header" "Add recently viewed items" "Add FAQ page"
"Fix footer spacing" "Add sale banner" "Add contact form" "Fix favicon"
"Add return policy page" "Improve error messages")

# The bug lands somewhere between commit 8 and commit 30
bad=$(( RANDOM % 23 + 8 ))
i=0
for m in "${msgs[@]}"; do
  i=$((i + 1))
  echo "- $m" >> features.md
  if [ "$i" -eq "$bad" ]; then write_price 1; fi
  git add . && c "$m"
done

echo ""
echo "Bisect lab ready at: $LAB"
echo "Something broke the price somewhere in the last 34 commits."
echo "Next: cd \"$LAB\" and follow labs/bisect.md"
