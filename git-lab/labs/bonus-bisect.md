# Bonus Lab: Bug Hunt with git bisect

**Concepts:** binary search through history, git bisect, git revert

A bug slipped into one of 35 commits. Find it in about 6 steps instead of 35.

## Set up

From this repo's folder:

```bash
bash scripts/make-bisect-lab.sh
cd ~/git-labs/bisect-lab
```

## See the problem

```bash
./test.sh                  # FAIL: the price is wrong
git log --oneline | tail -1   # copy this hash: the first commit
git switch --detach <first-hash>
./test.sh                  # PASS: it worked back then
git switch main
```

So the bug is somewhere between the first commit and now. Every bug lands in a different commit, so your neighbor's answer won't match yours.

## Hunt manually

`git bisect` does a binary search. It checks out the middle commit and you tell it good or bad.

```bash
git bisect start
git bisect bad                 # the current commit is broken
git bisect good <first-hash>   # this one worked
```

At each step, run `./test.sh` and tell Git the result:

```bash
./test.sh
git bisect good    # if it passed
git bisect bad     # if it failed
```

When it finishes, Git prints **the first bad commit**. Look at what it changed:

```bash
git show <bad-hash>
git bisect reset   # go back to main
```

Notice the commit message sounds harmless. That's why reading the actual diff matters.

## Hunt automatically

If you have a test script, Git can do the whole search for you:

```bash
git bisect start
git bisect bad
git bisect good <first-hash>
git bisect run ./test.sh
git bisect reset
```

## Fix it like a pro

```bash
git revert <bad-hash>
./test.sh   # PASS
```

## Why this matters

On a real team, a bug can sit in thousands of commits. Binary search finds it in about 10 to 12 steps.
