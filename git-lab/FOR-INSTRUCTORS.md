# For Instructors

## Before the session

1. Push this repo to the club's GitHub org (public).
2. Replace `THIS-REPO-URL` in `labs/06-github-and-prs.md`.
3. **Settings > Actions > General:** loosen the approval setting for fork PR workflows, or be ready to click **Approve and run** on each PR.
4. **Settings > Rules > Rulesets:** require a PR and the `check` status check for `main`.
5. Run every lab script once on a Mac and in Git Bash on Windows.

## Suggested flow

Demo Labs 1 to 4 live on the projector while students follow along, then let people work through 5 to 7 at their own pace with mentors floating.

## Common problems

| Problem | Fix |
|---|---|
| `403` or permission denied on push | They cloned the original instead of their fork. `git remote set-url origin https://github.com/THEIR-USERNAME/git-lab.git` |
| `Support for password authentication was removed` | Use `gh auth login` or sign in through VS Code |
| `fatal: not a git repository` | Wrong folder. `cd` into the repo |
| Commits don't show on their profile | `user.email` doesn't match their GitHub email |
| `Need to specify how to reconcile divergent branches` | That's Lab 4. Use `git pull --no-rebase` or `git pull --rebase` |
| Stuck in an editor after `git commit` | Vim: type `:wq` and Enter. Next time use `-m "message"` |
| Pages shows 404 | Wait a couple of minutes, check the file is `index.html` at the repo root |
