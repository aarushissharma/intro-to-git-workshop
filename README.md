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


## What's in this repo

```
labs/            The lab guides
scripts/         Lab setup scripts and the CI check
people/          Lab 6: add your file here through a pull request
team-template/   Lab 7: starter page for a team
.github/         CI workflow and pull request template
```
