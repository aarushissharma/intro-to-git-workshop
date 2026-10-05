# Lab 6: GitHub and Pull Requests

**Concepts:** fork, clone, origin, upstream, push, pull request, code review, CI

This is exactly what your first week at an internship looks like: get the code, make a branch, open a PR, get it reviewed.

Replace `YOUR-USERNAME` with your GitHub username and `THIS-REPO-URL` with this repo's URL.

## Fork vs clone

- **Clone:** copies a repo to your laptop
- **Fork:** copies a repo to your GitHub account

You fork when you're not allowed to push to the original repo, like here or in open source.

## 1. Fork and clone

Click **Fork** at the top of this repo's page. Then:

```bash
git clone https://github.com/YOUR-USERNAME/git-lab.git
cd git-lab
git remote add upstream THIS-REPO-URL
git remote -v
```

- `origin` = your fork (you can push here)
- `upstream` = the original repo (you get updates from here)

## 2. Branch and make a change

```bash
git switch -c add-yourname
cp people/_template.md people/jane-doe.md
```

Fill in your file. Use lowercase and hyphens in the file name.

## 3. Commit and push

```bash
bash scripts/check.sh
git add people/jane-doe.md
git commit -m "Add Jane Doe to people"
git push -u origin add-yourname
```

`-u` links your branch to the one on GitHub, so next time you can just type `git push`.

## 4. Open a pull request

Go to your fork on GitHub and click **Compare & pull request**. Check that the base is the original repo's `main`, fill in the description, and create it.

A **pull request** asks the maintainers to merge your branch. It's where code review happens.

## 5. Watch CI

A GitHub Action automatically runs `scripts/check.sh` on your PR. This is **CI (continuous integration)**: automated checks that run on every change.

- Green check: passed
- Red X: click **Details** to see why. Fix it, commit, and push again. The PR updates by itself.

## 6. Review someone else's PR

1. Open a classmate's PR and go to **Files changed**
2. Hover over a line and click **+** to comment
3. Click **Review changes**, then **Comment** or **Approve**

Good reviews are specific and kind: "Small typo on line 2" beats "looks good."

## 7. Stay up to date

After PRs get merged, your fork falls behind. Catch up with:

```bash
git switch main
git fetch upstream
git merge upstream/main
git push
```

## Recap

```
fork -> clone -> branch -> commit -> push -> pull request -> review -> merge
```
