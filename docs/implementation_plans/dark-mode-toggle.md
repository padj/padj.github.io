# Dark mode toggle

## Problem
The site (Academic Pages / Minimal Mistakes Jekyll theme) only has a light theme. Colours are compile-time SCSS variables (`_sass/_variables.scss`) used across ~15 partials, often via `mix()`, so they cannot be switched at runtime.

## Approach
1. **Colour tokens as CSS custom properties.** Define a light token set on `:root` and a dark set on `html[data-theme="dark"]` (new partial `_sass/_themes.scss`, imported right after `variables`). Tokens include: `--bg`, `--text`, `--text-muted` (replaces `mix(#fff,$text-color,25/30%)`), `--gray`, `--gray-muted` (`mix(#fff,$gray,25%)`), `--gray-light`, `--gray-lighter`, `--border`, `--accent`, `--accent-hover`, `--accent-muted`, `--accent-tint-25/50/75`, `--code-bg`, `--surface` (cards/overlays), `--shadow`, `--input-border`, `--overlay-bg` (the `rgba(255,255,255,.7/.85)` backgrounds).
2. **Point SCSS vars at tokens** in `_variables.scss` (e.g. `$text-color: var(--text)`), and replace every `mix()`/`lighten()` on a themed colour in partials with the matching precomputed token. Brand/status colours (success/warning/etc., social brands) stay static SCSS. Notices keep SCSS mixes but get dark-appropriate backgrounds via a small override.
3. **Dark palette:** near-black bg (~`#121417`), off-white text (~`#e3e6e8`), borders ~`#2a2f34`, accent lightened teal (~`#4fb3bb`) meeting WCAG AA on the dark bg. Add `color-scheme: light dark` so form controls/scrollbars adapt.
4. **Syntax highlighting:** move `.highlight` token colours in `_syntax.scss` to vars with a dark (Solarized-dark style) set.
5. **No-flash init script** inline in `_includes/head.html` (before CSS): read `localStorage.theme`, else `prefers-color-scheme`, set `data-theme` on `<html>`.
6. **Toggle button** in `_includes/masthead.html` at the right of the nav, outside the greedy-nav overflow so it's always visible on mobile. Font Awesome sun/moon icons, `aria-label` + `aria-pressed`, keyboard accessible. Styles in `_masthead.scss`.
7. **Toggle JS** in `assets/js/_main.js` (or small inline script): flip `data-theme`, persist to localStorage, update icon/aria; also listen for OS preference changes when no manual choice stored. Rebuild `main.min.js` via `npm run build:js` if `_main.js` changes (or keep the toggle script inline/standalone to avoid the minify step).
8. **Smooth transition:** brief `background-color/color` transition, disabled under `prefers-reduced-motion`.
9. **Docs:** save this plan to `docs/implementation_plans/` and add a short note to README/CHANGELOG.

## Verification
- `bundle exec jekyll build` (and serve) succeeds.
- Visual check in browser canvas of home, a post, blog/tags archive, CV/publications, and mobile nav in both themes; verify persistence across reloads and no flash.
- Spot-check contrast of text/links/accent in dark mode.

## Notes
- Greedy-nav JS measures widths; the toggle must be excluded from its calculation (place it as a sibling of `#site-nav`, not inside `.visible-links`).
- Images/logos are left as-is.
