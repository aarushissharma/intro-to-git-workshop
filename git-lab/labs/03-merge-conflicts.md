# Lab 3: Merge Conflicts

**Concepts:** merge conflict, conflict markers, resolving, aborting a merge

## Why conflicts happen

Git merges changes automatically when they touch **different** lines. When two branches change the **same** line, Git can't know which version you want, so it asks you.

## Set up

From this repo's folder:

```bash
bash scripts/make-conflict-lab.sh
cd ~/git-labs/conflict-lab
```

This creates a repo with a pancake recipe where two branches changed the same line.

## Look first

```bash
git log --oneline --graph --all
git diff main alice
```

`main` changed the milk amount. `alice` switched to oat milk.

## Trigger the conflict

```bash
git merge alice
git status
```

Open `recipe.txt`:

```
<<<<<<< HEAD
1.5 cups milk
=======
1 cup oat milk
>>>>>>> alice
```

- Between `<<<<<<< HEAD` and `=======` is **your** version (the branch you're on)
- Between `=======` and `>>>>>>>` is the **incoming** version

## Resolve it

Edit the file to what it should be, for example `1.5 cups oat milk`, and **delete all three marker lines**. Then:

```bash
git add recipe.txt
git commit -m "Merge alice: use 1.5 cups oat milk"
git log --oneline --graph --all
```

The graph shows the two branches joining.

## Panic button

If a merge goes wrong before you commit:

```bash
git merge --abort
```

Everything goes back to how it was before the merge.

## Recap

- Conflicts are normal, not errors
- Fix the file, remove the markers, `add`, `commit`
- In VS Code, conflicts show up with buttons like "Accept Both Changes"
