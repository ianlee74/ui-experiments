# Contributing

Thanks for your interest. This repo collects small UI prototypes, so contributions are usually one of these:

- **A new experiment.** Open an issue with the "Experiment idea" template first so the idea can be discussed.
- **A new variation on an existing experiment.** For example, another concept tab for Required-field indicators.
- **A fix.** Broken behavior, an accessibility problem, a layout bug, or a typo.

## Conventions for experiments

- **Self-contained.** Each experiment lives in its own folder under `experiments/` and doesn't load CSS or JavaScript from other experiments. Plain HTML, CSS and JavaScript; no build step.
- **External resources.** Fonts from Google Fonts and pinned library versions from a public CDN are fine. Keep everything else in the folder.
- **Real interactions.** Prototypes should actually work: type into them, tab through them, submit them. Forms handle `submit` in script and never send data anywhere.
- **Both themes and phone width.** Define colors as CSS custom properties with light and dark values (`prefers-color-scheme`). Pages should work at about 390px wide without horizontal scrolling.
- **Accessible by default.** Every control has a label, focus is visible, decorative marks are `aria-hidden`, and motion respects `prefers-reduced-motion`.
- **Documented.** The experiment's `README.md` states the problem, the ideas tried, and the trade-offs of each. Keep the notes next to the work, in plain language.
- **Navigable.** Each page has a breadcrumb back to the landing page (`../../`).

## Checking your change

Run the structure check before opening a pull request:

```sh
scripts/check.sh
```

It confirms every experiment has an `index.html`, a `README.md` and a `preview.png`, and that the landing page links to it. CI runs the same check on every pull request.

Then open the pages in a browser, or serve the repo root with `python3 -m http.server 8000`, and try them in light and dark mode and at phone width.

## Pull requests

- Keep each pull request to one experiment or one fix.
- Describe what changed and how you tested it. Screenshots help.
- By contributing, you agree that your contribution is licensed under the repo's [MIT License](LICENSE).

## Code of conduct

This project follows the [Code of Conduct](CODE_OF_CONDUCT.md).
