# Lab 4: Diverging Branches

**Concepts:** remote, origin, fetch, push rejected, pull with merge vs rebase

## The scenario

It's 2 AM at a hackathon. You and your teammate both start from the same commit on `main`.

- Your teammate adds run instructions to the README and **pushes**.
- You add an about page and **commit**, but you never pulled their change.

Now your `main` and GitHub's `main` each have a commit the other doesn't. Your history has **diverged**:

```
                 C  (yours: "Add about page")      <- your main
                /
  A  ----------
  "Start        \
   project"      B  (teammate's: "Add run instructions")  <- origin/main
```

Git can't just stack one on the other, so it asks you to choose how to combine them. This happens constantly on teams, and the error messages scare people the first time.

## Set up

From this repo's folder:

```bash
bash scripts/make-diverge-lab.sh
cd ~/git-labs/diverge-lab/you
```

## 1. Git doesn't know yet

```bash
git status
```

It says your branch is **ahead of 'origin/main' by 1 commit**, which makes it look like you just need to push. That's misleading. Git only knows what GitHub looked like the **last time you fetched**, so it has no idea your teammate pushed.

## 2. Fetch and look again

```bash
git fetch
git status
```

Now it says something like: *Your branch and 'origin/main' have diverged, and have 1 and 1 different commits each.*

See the fork in the road:

```bash
git log --oneline --graph --all
```

## 3. Try to push (it fails)

```bash
git push
```

GitHub rejects it. If it accepted your push, your teammate's commit would be erased. You'll see `rejected` and `non-fast-forward`, which means "pull their work first."

## 4. Try to pull (Git asks you to choose)

```bash
git pull
```

Depending on your Git version, you'll get a hint or an error saying you need to specify how to reconcile divergent branches. There are two ways:

| | Merge | Rebase |
|---|---|---|
| Command | `git pull --no-rebase` | `git pull --rebase` |
| What it does | Adds a merge commit that joins both paths | Moves your commit to sit on top of theirs |
| History | Shows the fork and the join | One straight line |
| Good for | Shared branches, beginners | Your own work before pushing |

## 5a. Fix it with merge

```bash
git pull --no-rebase
```

If an editor opens for the merge message, save and close it (in Vim, type `:wq` and press Enter). Then:

```bash
git log --oneline --graph --all
git push
```

The graph shows both paths joining at a merge commit.

## 5b. Reset the lab and try rebase

```bash
cd ~
rm -rf ~/git-labs/diverge-lab
bash PATH-TO-THIS-REPO/scripts/make-diverge-lab.sh
cd ~/git-labs/diverge-lab/you
git pull --rebase
git log --oneline --graph --all
git push
```

Your commit now sits on top of your teammate's in a straight line. Notice your commit has a **new hash**. Rebase rewrites your commits, which is why you never rebase commits other people already have.

## 6. Check from your teammate's side

```bash
cd ../teammate
git pull
git log --oneline
```

They now have both commits.

## Set a default so you don't get asked again

Pick one:

```bash
git config --global pull.rebase false   # always merge
git config --global pull.rebase true    # always rebase
```

## How to avoid this at hackathons

- `git pull` before you start any new task
- Work on your own branch, not directly on `main`
- Push small commits often so the gap stays small
