# Lab 7: Team Workflow (Hackathon Style)

**Concepts:** collaborators, feature branches, splitting work, GitHub Pages

Do this in a group of 3 or 4. It's a mini hackathon: build and deploy one page together.

## Collaborator vs fork

On your own team, you don't fork. The repo owner adds teammates as **collaborators**, and everyone pushes branches to the same repo.

## Repo owner

1. Create a new **public** repo on GitHub and check **Add a README file**.
2. **Settings > Collaborators > Add people**: add each teammate.
3. Clone it, add the starter page, and push:
   ```bash
   git clone https://github.com/OWNER/REPO-NAME.git
   cd REPO-NAME
   cp PATH-TO-THIS-REPO/team-template/index.html .
   git add index.html
   git commit -m "Add page template"
   git push
   ```

## Teammates

1. Accept the invite (email or github.com/notifications).
2. Clone the team repo (no fork needed):
   ```bash
   git clone https://github.com/OWNER/REPO-NAME.git
   cd REPO-NAME
   ```

## Everyone

Each person picks a teammate number (1 to 4):

```bash
git pull
git switch -c section-yourname
```

Edit `index.html` **only inside your section**, then:

```bash
git add index.html
git commit -m "Fill in teammate 2 section"
git push -u origin section-yourname
```

Open a PR. A teammate reviews and merges it. Since everyone edited a different section, there are no conflicts. That's the point: **split work so people don't edit the same lines.**

## Deploy

Owner: **Settings > Pages**, set Source to **Deploy from a branch**, choose `main` and `/ (root)`, and save. In a minute or two the site is live at `https://OWNER.github.io/REPO-NAME/`.

## Hackathon habits

- One person sets up the project skeleton, everyone branches from it
- Split work by feature or file
- Pull before starting anything new
- Merge small PRs often instead of one giant merge at the end
- Deploy early so you always have a working link
- In the final hours, one person handles merges into main
