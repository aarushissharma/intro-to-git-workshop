# Git Cheat Sheet

## Everyday commands

| Command | What it does |
|---|---|
| `git clone <url>` | Copy a repo to your computer |
| `git status` | See what changed. Run it constantly. |
| `git switch -c <branch>` | Create a branch and move onto it |
| `git switch <branch>` | Move to an existing branch |
| `git add <file>` | Stage a file for the next commit |
| `git commit -m "message"` | Save a snapshot of staged changes |
| `git push -u origin <branch>` | Upload a new branch to GitHub (after the first time, just `git push`) |
| `git fetch upstream` | Download the latest changes from the class repo without merging |
| `git merge upstream/main` | Merge those changes into your current branch |
| `git log --oneline --graph` | See your commit history |
| `git diff` | See unstaged changes line by line |

## Fixing mistakes

| Situation | Command |
|---|---|
| Unstage a file | `git restore --staged <file>` |
| Throw away changes to a file | `git restore <file>` (can't be undone!) |
| Fix your last commit message | `git commit --amend -m "new message"` (only before pushing) |
| Undo a commit that's already pushed | `git revert <hash>` |
| Shelve changes to switch branches | `git stash`, then later `git stash pop` |
| Abort a merge gone wrong | `git merge --abort` |
| Abort a rebase gone wrong | `git rebase --abort` |

## Vocab

- **Repository (repo):** a project folder tracked by Git, including its full history
- **Commit:** a saved snapshot of your changes, with a message
- **Branch:** a separate line of work that doesn't touch main
- **main:** the default branch, the "official" version
- **Clone:** download a copy of a repo
- **Fork:** your own copy of someone else's repo on GitHub
- **Remote:** a version of the repo hosted online. `origin` is your fork, `upstream` is the class repo
- **Push / Pull:** send commits up / bring changes down
- **Staging area:** where you choose what goes into the next commit
- **Pull request (PR):** a request to merge your branch, where others review it
- **Merge conflict:** two people changed the same lines, so Git asks you to choose
- **HEAD:** where you are right now in the history
- **.gitignore:** files Git should never track (secrets, `node_modules`, build output)
- **Issue:** a tracked task or bug on GitHub
- **CI:** automated checks that run on every PR (GitHub Actions)
