# UI Experiments

A place to build small proofs of concept for user interface ideas. Each experiment is a self-contained set of plain HTML, CSS and JavaScript files: no framework, no build step, no dependencies to install. Open a file in a browser and it works.

**Live site:** https://ianlee74.github.io/ui-experiments/

## Experiments

| Experiment | What it explores | View |
| --- | --- | --- |
| [Required-field indicators](experiments/required-field-indicators/) | Eleven ways to show which form fields are required, and which can be skipped, before someone presses Submit, without asterisks. Includes a study of a progress rail in multi-column forms. | [Open](https://ianlee74.github.io/ui-experiments/experiments/required-field-indicators/) |

## Repository layout

```
.
├── index.html                  Landing page for the site; lists every experiment
├── experiments/
│   ├── _template/              Starting point for a new experiment (not published)
│   └── <experiment-name>/
│       ├── README.md           The problem, the ideas tried, findings and trade-offs
│       ├── index.html          The experiment's main page
│       ├── preview.png         1200×750 screenshot used on the landing page
│       └── *.html              Any extra pages the experiment needs
├── scripts/check.sh            Structure check run in CI (and locally)
└── .github/workflows/          Site deployment and checks
```

Each experiment folder stands on its own. Pages don't share CSS or JavaScript, so an experiment can be copied out of the repo, or changed freely, without breaking any other experiment.

## Viewing locally

Open any `index.html` directly in a browser. For links between pages to behave exactly as they do on the live site, serve the repo root:

```sh
python3 -m http.server 8000
# then open http://localhost:8000/
```

## Adding an experiment

1. Copy `experiments/_template/` to `experiments/<your-experiment-name>/`. Use lowercase words separated by hyphens.
2. Build the experiment in its `index.html`, and fill in its `README.md`.
3. Add a `preview.png` screenshot (1200×750).
4. Add a card for it to the root `index.html` and a row to the table above.
5. Run `scripts/check.sh` to confirm the structure is complete.

See [CONTRIBUTING.md](CONTRIBUTING.md) for the conventions experiments follow.

## Publishing

The site is published with GitHub Pages by the workflow in `.github/workflows/pages.yml`. It runs on every push to `main`, copies the landing page and the `experiments/` folder into the site, and deploys it.

One-time setup, done by a repository admin: **Settings → Pages → Build and deployment → Source: GitHub Actions**.

## License

[MIT](LICENSE)
