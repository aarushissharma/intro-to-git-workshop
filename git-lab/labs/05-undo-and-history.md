# Lab 5: Undo and History

**Concepts:** restore, amend, revert, stash, blame, detached HEAD

Everyone makes Git mistakes. The skill is knowing how to recover. Use your Lab 1 repo:

```bash
cd ~/git-labs/basics
```

## Undo, from least to most serious

**Edited a file and want to throw the changes away:**
```bash
echo "oops" >> app.py
git restore app.py        # careful: this can't be undone
```

**Staged something by accident:**
```bash
echo "oops" >> app.py
git add app.py
git restore --staged app.py   # unstaged, but the edit is still there
git restore app.py            # now it's gone
```

**Typo in your last commit message (before pushing):**
```bash
echo "test" > test.txt
git add test.txt
git commit -m "Add tset file"
git commit --amend -m "Add test file"
```

**Undo a commit that's already pushed:**
```bash
git revert HEAD
git log --oneline
```

An editor opens for the commit message. Save and close it (in Vim, type `:wq` and press Enter), or skip the editor with `git revert --no-edit HEAD`.

`revert` makes a **new** commit that undoes the old one. It doesn't rewrite history, so it's safe on shared branches like main.

## Stash: pause your work

You're halfway through something and need to switch branches:

```bash
echo "half-finished idea" >> app.py
git stash                 # changes are shelved
git status                # clean
git stash pop             # changes come back
git restore app.py
```

## Read history

```bash
git log --oneline --graph --all
git log -p -- app.py      # every change ever made to one file
git blame app.py          # who last changed each line, and when
```

## Visit the past

Copy an old hash from `git log --oneline`:

```bash
git switch --detach <hash>
cat app.py                # the file as it was back then
git switch main           # back to the present
```

"Detached HEAD" just means you're looking at a commit instead of a branch. It's safe to look around.

## Recap

| Situation | Command |
|---|---|
| Throw away edits | `git restore <file>` |
| Unstage | `git restore --staged <file>` |
| Fix last commit (not pushed) | `git commit --amend` |
| Undo a pushed commit | `git revert <hash>` |
| Pause work | `git stash` / `git stash pop` |
