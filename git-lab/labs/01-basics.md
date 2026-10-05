# Lab 1: Git Basics

**Concepts:** repository, working directory, staging area, commit, log, diff, .gitignore

## Make a repo

```bash
mkdir -p ~/git-labs/basics
cd ~/git-labs/basics
git init
ls -a
```

`git init` creates a hidden `.git` folder. That folder **is** the repository: it holds every commit and branch. Your files are just the current working copy.

## The three places your changes live

```
Working directory  --git add-->  Staging area  --git commit-->  Repository
(files you edit)                (next commit)                  (saved history)
```

Create a file and watch it move through each place:

```bash
echo "# My Project" > README.md
git status            # untracked: Git sees it but isn't tracking it
git add README.md
git status            # staged: it'll be in the next commit
git commit -m "Add README"
git status            # clean: everything is saved
```

## Make a few more commits

```bash
echo "print('hello')" > app.py
git add app.py
git commit -m "Add hello script"

echo "print('goodbye')" >> app.py
git diff              # see exactly what changed, line by line
git add app.py
git commit -m "Add goodbye message"
```

## Read your history

```bash
git log
git log --oneline
git show HEAD         # the latest commit and what it changed
```

Each commit has a **hash** (like `a1b2c3d`), a unique ID you can use to refer to it.

## Why staging exists

Staging lets you choose what goes into a commit. Try it:

```bash
echo "x = 1" >> app.py
echo "notes to self" > notes.txt
git add app.py
git status            # app.py is staged, notes.txt is not
git commit -m "Add variable"
```

Only `app.py` went into that commit.

## Ignore files with .gitignore

Some files should never be committed: secrets, dependencies, build output.

```bash
echo "API_KEY=secret123" > .env
git status            # .env shows up. Dangerous!
echo ".env" > .gitignore
git status            # .env is gone, .gitignore appears instead
git add .gitignore
git commit -m "Ignore .env"
```

**Never commit secrets.** If a key gets pushed to GitHub, revoke it and make a new one. Deleting the commit isn't enough, because it stays in history and anyone could already have it.

## Recap

- `git status` is your best friend. Run it constantly.
- `add` picks changes, `commit` saves them, `log` shows history.
