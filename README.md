This is the repo for my personal website which can be found at [padj.github.io](padj.github.io). It is forked from [academicpages](https://academicpages.github.io), a Github Pages template for academic websites. This was forked (then detached) by [Stuart Geiger](https://github.com/staeiou) from the [Minimal Mistakes Jekyll Theme](https://mmistakes.github.io/minimal-mistakes/), which is © 2016 Michael Rose and released under the MIT License. See LICENSE.md.

## Light / dark theme

The site supports light and dark themes. First-time visitors get their OS/browser preference (`prefers-color-scheme`); the sun/moon button in the masthead overrides it and the choice is remembered in `localStorage`.

- Colour palettes live in `$light-palette` / `$dark-palette` in `_sass/_variables.scss` and are emitted as CSS custom properties by `_sass/_themes.scss`. Themed SCSS variables (e.g. `$text-color`, `$accent`) resolve to `var(--…)`, so use them (or the `theme-tint()` / `theme-shade()` / `theme-alpha()` helpers) instead of Sass colour functions like `mix()` on themed colours.
- The initial theme is applied by an inline script in `_includes/head.html` (prevents a flash); the toggle logic is in `assets/js/theme-toggle.js`.
