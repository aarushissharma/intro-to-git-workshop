# Lab 2: Branches

**Concepts:** branch, switch, merge, HEAD, main

Continue in your Lab 1 repo:

```bash
cd ~/git-labs/basics
```

## What's a branch?

A branch is a separate line of work. You can experiment without touching `main`, the "official" version. On a team, everyone works on their own branch.

```bash
git branch            # lists branches. The * marks where you are
```

## Create a branch and work on it

```bash
git switch -c add-feature
echo "print('new feature')" >> app.py
git add app.py
git commit -m "Add new feature"
git log --oneline
```

## Switch back to main

```bash
git switch main
cat app.py            # the feature is gone!
git switch add-feature
cat app.py            # it's back
```

Nothing was deleted. Each branch just points to a different commit. **HEAD** is a pointer to where you are right now.

## See the branches

```bash
git log --oneline --graph --all
```

## Merge the branch into main

```bash
git switch main
git merge add-feature
cat app.py            # now main has the feature
```

This was a **fast-forward** merge: main hadn't changed, so Git just moved main forward to the branch's commit.

## Clean up

```bash
git branch -d add-feature
```

## Recap

- `git switch -c <name>` creates a branch and moves onto it
- Merge from the branch you want to receive the changes (usually main)
- Name branches by what they do, like `fix-login` or `add-search`
