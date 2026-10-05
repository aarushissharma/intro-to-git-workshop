# Git & GitHub Lab

A hands-on lab for learning Git the way it's used at internships and hackathons. Work through the labs in order. Each one builds on the last.

## Setup

1. **Install Git:** https://git-scm.com/downloads
   - Windows: use **Git Bash** (comes with the installer) for every command.
   - Check it worked: `git --version`
2. **Tell Git who you are.** Use your GitHub email so commits show up on your profile.
   ```bash
   git config --global user.name "Your Name"
   git config --global user.email "you@example.com"
   git config --global init.defaultBranch main
   ```
3. **Sign in to GitHub** (needed for Lab 6). GitHub doesn't accept your password for Git commands. Use the GitHub CLI (`gh auth login`, from https://cli.github.com) or sign in through VS Code.

## Labs

Labs 1 to 5 run entirely on your laptop, so you can break things safely.

| Lab | Concepts |
|---|---|
| [1. Git basics](labs/01-basics.md) | repo, working directory, staging, commit, log, diff, .gitignore |
| [2. Branches](labs/02-branches.md) | branch, switch, merge, HEAD |
| [3. Merge conflicts](labs/03-merge-conflicts.md) | why conflicts happen and how to resolve them |
| [4. Diverging branches](labs/04-diverging-branches.md) | remotes, fetch, push rejected, pull with merge vs rebase |
| [5. Undo and history](labs/05-undo-and-history.md) | restore, amend, revert, stash, blame, detached HEAD |
| [6. GitHub and pull requests](labs/06-github-and-prs.md) | fork, clone, upstream, push, pull request, code review, CI |
| [7. Team workflow](labs/07-team-workflow.md) | collaborators, feature branches, GitHub Pages (hackathon style) |
| [Bonus: Bug hunt](labs/bonus-bisect.md) | git bisect |

Commands and vocab are in [CHEATSHEET.md](CHEATSHEET.md).

## What's in this repo

```
labs/            The lab guides
scripts/         Lab setup scripts and the CI check
people/          Lab 6: add your file here through a pull request
team-template/   Lab 7: starter page for a team
.github/         CI workflow and pull request template
```
