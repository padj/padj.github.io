# Implementation Plan — padj.github.io Look-and-Feel Refresh

**Audience:** Claude Code, working directly in the `padj.github.io` repository.
**Goal:** Sequentially implement every recommendation in section *"03 — What I'd change"* of the design review, moving the site off the stock Minimal Mistakes look toward an editorial, evidence-forward identity — **without breaking the Jekyll build or losing content.**

This is a Jekyll site (Academic Pages, a fork of Minimal Mistakes). SCSS compiles via `assets/css/main.scss` → `main.css`. Work through the phases **in order**; each phase ends in a clean build and a commit. Do not skip ahead — later phases assume the design tokens from Phase 1 exist.

---

## How to read this plan

Each phase has:
- **Implements** — which review recommendation(s) it satisfies (QW = quick win, BM = bigger move).
- **Files** — exact paths to touch.
- **Steps** — concrete edits, with code where it removes ambiguity.
- **Acceptance** — how to know it's done.
- **Commit** — the message to use.

The ten recommendations and the phase that delivers each:

| # | Recommendation | Phase |
|---|---|---|
| QW1 | Real web-font pairing, drop system stack | 2 |
| QW2 | Fix heading hierarchy | 2 |
| QW3 | One considered accent colour, applied consistently | 3 |
| QW4 | Trim social links to the four that are used | 4 |
| QW5 | One-line positioning statement under the name | 5 |
| BM1 | Real homepage hero + selected work (not a bio wall) | 7 |
| BM2 | Surface the visual work (talk map, figures, schematics) | 8 |
| BM3 | Rework the desktop grid / widen the content lane | 6 |
| BM4 | Define a small design system (tokens) | 1 |
| BM5 | Commit to an editorial, research-led aesthetic | 9 |

> Tokens (BM4) are built **first** because the typography, colour and layout phases all consume them.

---

## Phase 0 — Setup & safety net

**Files:** none (environment only).

**Steps:**
1. Create a working branch: `git checkout -b feat/look-and-feel-refresh`.
2. Confirm the site builds and serves locally:
   ```bash
   bundle install
   bundle exec jekyll serve --config _config.yml,_config.dev.yml --livereload
   ```
   (The repo ships a `_config.dev.yml` overlay — always include it for local work.)
3. Capture **baseline screenshots** of the homepage (`/`), a publication list (`/publications/`), the CV (`/cv/`) and one talk page, at 1440px and 375px widths. Save under `design_handoff_site_refresh/baseline/`. These are the before/after reference.
4. Note the SCSS compile path: edits to `_sass/*.scss` and `_variables.scss` are picked up automatically by `jekyll serve`.

**Acceptance:** site serves at `http://localhost:4000`, baseline screenshots captured.

**Commit:** `chore: branch + baseline screenshots for look-and-feel refresh`

---

## Phase 1 — Establish design tokens  *(Implements BM4)*

Define the system everything else references. Do **not** restyle components yet — only declare tokens.

**Files:** `_sass/_variables.scss`

**The one decision to confirm before coding:** the accent colour and type pairing below are a concrete, defensible recommendation for a simulation / health-economics researcher (serious, modern, not trendy). If the site owner has a preferred accent, swap the hex in one place — `$accent` — and everything inherits it.

**Steps:**

1. **Typefaces** — replace the system-font definitions. In `_sass/_variables.scss` find the `/* system typefaces */` block and set:
   ```scss
   /* typefaces */
   $serif        : "Source Serif 4", Georgia, "Times New Roman", serif;
   $sans-serif   : "Public Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
   $monospace    : "IBM Plex Mono", Monaco, Consolas, "Lucida Console", monospace;

   $global-font-family : $sans-serif;   // body + UI
   $header-font-family : $serif;        // headings now serif — this is the identity move
   $caption-font-family: $serif;
   ```

2. **Colour ramp + accent** — below the existing `$gray` ramp, override the semantic colours:
   ```scss
   /* ink + accent (refresh) */
   $text-color   : #1c2024;                 // richer than the old washed dark-grey
   $accent       : #0d5c63;                 // deep teal — single brand accent (CONFIRM)
   $accent-hover : mix(#000, $accent, 18%);
   $accent-muted : mix(#fff, $accent, 88%); // tint for backgrounds/borders

   $primary-color       : $text-color;      // masthead/structural, no longer the grey
   $border-color        : #e6e8eb;
   $link-color          : $accent;
   $link-color-hover    : $accent-hover;
   $link-color-visited  : $accent;
   $masthead-link-color       : $text-color;
   $masthead-link-color-hover : $accent;
   ```
   Place these **after** the original definitions of the same variables so they win.

3. **Type scale** — keep the existing `$type-size-*` em ladder but we'll consume it with more contrast in Phase 2. Add two semantic sizes for clarity:
   ```scss
   $type-size-display : 2.5rem;   // page titles
   $type-size-section : 1.5rem;   // in-content section headings
   ```

4. **Spacing rhythm** — add a simple scale used in later phases:
   ```scss
   $space-1: 0.5rem;  $space-2: 1rem;  $space-3: 1.5rem;
   $space-4: 2.5rem;  $space-5: 4rem;  $space-6: 6rem;
   ```

**Acceptance:** `jekyll serve` still compiles with no SCSS errors. The site will look *slightly* different (link colour, text colour) — that's expected; full restyle comes next.

**Commit:** `feat(tokens): introduce serif/sans pairing, teal accent, ink text, spacing scale`

---

## Phase 2 — Typography: web fonts + heading hierarchy  *(Implements QW1, QW2)*

**Files:** `_includes/head.html`, `_sass/_base.scss`, `_sass/_page.scss`, `_pages/about.md`, `_pages/publications.md`, and any other `_pages/*.md` using setext (`======` / `------`) headings.

**Steps:**

1. **Load the fonts.** `_includes/head/custom.html` is **not** wired into this theme's `head.html`, so add the link directly. In `_includes/head.html`, immediately *above* the `main.css` line, insert:
   ```html
   <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link href="https://fonts.googleapis.com/css2?family=Source+Serif+4:opsz,wght@8..60,400;8..60,500;8..60,600;8..60,700&family=Public+Sans:wght@400;500;600;700&family=IBM+Plex+Mono:wght@400;500&display=swap" rel="stylesheet">
   ```

2. **Heading scale** in `_sass/_base.scss` — the `h1..h6` block currently makes `h1` only `$type-size-3` (~25px) and section heads barely differ. Replace the size rules so the page title clearly dominates:
   ```scss
   h1 { margin-top: 0; font-size: $type-size-display; line-height: 1.1; letter-spacing: -0.01em; }
   h2 { font-size: $type-size-section; margin: 2.2em 0 0.5em; }
   h3 { font-size: $type-size-4; }      // ~20px
   h4 { font-size: $type-size-5; }      // ~16px
   ```
   Keep `font-family: $header-font-family` (now serif) on the heading group.

3. **Page title** in `_sass/_page.scss` — find `.page__title` and ensure it uses the display size and serif:
   ```scss
   .page__title {
     font-family: $header-font-family;
     font-size: $type-size-display;
     line-height: 1.1;
     letter-spacing: -0.01em;
   }
   ```

4. **Fix the in-content hierarchy bug.** On the homepage, `_pages/about.md` uses setext underlines, which Markdown renders as **`<h1>`** — so "My research interests" and "My background" currently match the page title. Convert them to `##` (h2):
   ```markdown
   ## My research interests
   ...
   ## My background
   ```
   Grep the repo for the same pattern and fix every page:
   ```bash
   grep -rln $'\n======' _pages _publications _talks _outreach
   ```
   Any body section heading that should sit *below* the page title becomes `##` or `###`. The single page-level title stays in front matter `title:` (rendered as the one `<h1>` by `single.html`).

**Acceptance:** Source Serif 4 renders on headings and Public Sans on body (check in DevTools → Computed → font-family, not the fallback). On `/`, the page title "About me" is visibly larger than "My research interests". No page has two competing `<h1>`s (check with `document.querySelectorAll('h1').length` — should be 1 per page).

**Commit:** `feat(type): load Source Serif 4 + Public Sans, establish heading hierarchy`

---

## Phase 3 — Colour & accent applied consistently  *(Implements QW3)*

Tokens exist (Phase 1); now make sure the old cyan is gone everywhere and the accent is used deliberately.

**Files:** `_sass/_variables.scss` (verify), `_sass/_navigation.scss`, `_sass/_buttons.scss`, `_sass/_sidebar.scss`, `_sass/_masthead.scss`.

**Steps:**
1. Grep for stray hard-coded colours and the old info cyan:
   ```bash
   grep -rn "52adc8\|#7a8288\|\$info-color" _sass
   ```
   Anything that was a link/interactive colour should resolve to `$accent`/`$link-color`; structural greys to `$text-color`/`$border-color`.
2. **Active nav state** in `_sass/_navigation.scss` (`.greedy-nav` / `.visible-links a`): give links an accent hover and an accent underline on the current page:
   ```scss
   .greedy-nav a:hover { color: $accent; }
   .greedy-nav a { border-bottom: 2px solid transparent; }
   .greedy-nav a.active,
   .greedy-nav a:hover { border-bottom-color: $accent; }
   ```
   (Active class: Minimal Mistakes doesn't add one automatically — optionally add a Liquid check in `_includes/masthead.html` comparing `link.url` to `page.url` and append `class="active"`.)
3. **Avatar ring** in `_sass/_sidebar.scss` — `.author__avatar img` currently has `border: 1px solid $border-color`. Make it the accent at a restrained weight:
   ```scss
   .author__avatar img { padding: 4px; border: 2px solid $accent-muted; }
   ```
4. **Buttons** in `_sass/_buttons.scss` — ensure the default `.btn` uses `$accent` background with white text and `$accent-hover` on hover; remove reliance on `$primary-color` grey.

**Acceptance:** `grep -rn "52adc8" _sass assets` returns nothing. Links, button, nav hover, and avatar ring all read as the same teal family. No element still shows the old cyan.

**Commit:** `feat(color): apply single accent to links, nav, buttons, avatar; retire cyan`

---

## Phase 4 — Trim social links to what's used  *(Implements QW4)*

Keep only LinkedIn, GitHub, Google Scholar, ORCID (the four populated in `_config.yml`'s `author:` block).

**Files:** `_includes/author-profile.html`, `_includes/footer.html`, `_config.yml`.

**Steps:**
1. In `_includes/author-profile.html`, delete the dormant `{% if author.* %}` blocks for every network **except** `linkedin`, `github`, `googlescholar`, `orcid`, plus `location` and `employer`. This removes ~25 unused branches and slims the markup. Keep the `Follow` button only if Phase 7 keeps a mobile dropdown; otherwise remove it.
2. In `_includes/footer.html`, the `page__footer-follow` block currently re-lists Twitter/Facebook/GitHub/Feed — duplicating the sidebar. Reduce it to a single quiet line (e.g. the copyright + one "GitHub" link) or remove the follow list entirely so social lives in **one** place (the sidebar).
3. In `_config.yml`, leave the four populated keys; you may delete the long list of empty `author:` keys for tidiness (optional, cosmetic).

**Acceptance:** sidebar shows exactly four social links + location + employer. Footer no longer repeats the same icons. Build clean.

**Commit:** `refactor(social): keep four real channels, de-duplicate footer follow list`

---

## Phase 5 — Positioning statement under the name  *(Implements QW5)*

A one-line "what I do" above the bio, so a 3-second visitor understands the work.

**Files:** `_includes/author-profile.html` (sidebar), and the top of `_pages/about.md`.

**Steps:**
1. In `_includes/author-profile.html`, under `.author__name` and the existing `author.bio`, the bio currently reads "Principal Operational Researcher". Tighten the sidebar to: name → role (bio) → one positioning clause. Add (driven by a new optional `author.tagline` in `_config.yml`):
   ```html
   {% if author.tagline %}<p class="author__tagline">{{ author.tagline }}</p>{% endif %}
   ```
   And in `_config.yml` `author:` add:
   ```yaml
   tagline: "I build simulation & operational-research models for health economics."
   ```
   Style `.author__tagline` in `_sass/_sidebar.scss`: `font-size: $type-size-6; color: mix(#000,$text-color,0%); line-height: 1.4; margin-top: $space-1;`
2. In `_pages/about.md`, add a single emphasised lead sentence directly under the `# About me` title, before "Hello!…", e.g. a one-line summary of focus areas. (Keep it to one sentence — the hero in Phase 7 will carry the heavier positioning.)

**Acceptance:** the sidebar and the top of `/` each state, in one line, what Thomas does and for whom.

**Commit:** `feat(content): add positioning tagline to sidebar and homepage lead`

---

## Phase 6 — Rework the desktop grid / widen the content lane  *(Implements BM3)*

On wide screens the content hugs the left and a band of white sits unused.

**Files:** `_sass/_variables.scss` (Susy container), `_sass/_page.scss`, `_sass/_sidebar.scss`.

**Steps:**
1. In `_sass/_variables.scss`, the Susy map sets `container: $large` where `$large: 925px`. Widen the reading container and raise the x-large cap:
   ```scss
   $large   : 1100px !default;
   $x-large : 1320px !default;
   ```
   Adjust the `$susy` `container` to `$large` (already references it) so the grid spans wider.
2. In `_sass/_page.scss`, the main content uses `span(8 of 12)` / `span(10 of 12)` depending on sidebar. Two acceptable approaches — pick one and apply consistently:
   - **(a) Wider single column:** keep the left author sidebar, give `.page` content `span(9 of 12)` and increase its `max-width` so paragraphs sit on a comfortable ~70–75ch measure rather than crammed left.
   - **(b) Centred measure:** on pages without the author sidebar (publications, talks, CV when `author_profile: false`), centre the content column with `margin: 0 auto` and a `max-width: 46rem` for ideal line length.
3. Ensure the masthead `&__inner-wrap` `max-width` (in `_sass/_masthead.scss`) tracks the new `$x-large` so the nav aligns with the wider content.

**Acceptance:** at 1440px the content fills a deliberate, centred-feeling lane (no large dead band on the right); paragraph measure is 65–80 characters. At 375px the layout stacks cleanly (sidebar above content).

**Commit:** `feat(layout): widen reading lane and rebalance desktop grid`

---

## Phase 7 — Homepage hero + selected work  *(Implements BM1)*

Replace the "open on a wall of bio text" homepage with a real hero and 2–3 pieces of selected work.

**Files:** `_pages/about.md`, new `_includes/home-hero.html`, new `_includes/selected-work.html`, `_sass/` (new partial `_home.scss` + import in `assets/css/main.scss`).

**Steps:**
1. Create `_includes/home-hero.html` — a compact hero: name/role, the positioning line (one strong sentence), and 1–2 primary CTAs (`Publications`, `CV`). Use `<h1>`/serif display type and the accent. Keep it text-first and fast (no heavy background image required; an optional subtle accent rule or a single figure is enough).
2. Create `_includes/selected-work.html` — a 2–3 card row of *selected* outputs (e.g. the SELECT risk-equations paper in *PharmacoEconomics*, a flagship talk, the talk map). Each card: title, venue/year, one-line description, link. Drive it from a small front-matter list or a `_data/selected.yml` you create, so it's editable without touching markup:
   ```yaml
   # _data/selected.yml
   - title: "Cardiovascular Risk Equations from the SELECT Trial"
     venue: "PharmacoEconomics, 2026"
     url: "/publication/2026-01-19-NN-SELECT-Risk-Equations-007"
     blurb: "Trial-based risk equations for secondary CV events in obesity."
   - ...
   ```
3. In `_pages/about.md`, restructure: keep `author_profile: true`, but at the top `{% include home-hero.html %}` then `{% include selected-work.html %}`, and move the long "My background" prose **below** (or onto a dedicated `/about/` page, with `/` becoming the landing). Don't delete the bio — relocate it.
4. Add `_sass/_home.scss` for hero + card styles (use tokens: serif display, `$accent`, `$space-*`, `$border-color`; cards = white, `1px solid $border-color`, subtle hover lift). Register it in `assets/css/main.scss` after `@import "page";`.

**Acceptance:** `/` opens with a hero + selected-work cards above the fold; full biography still reachable (lower on `/` or on `/about/`). Cards link correctly. No orphaned content.

**Commit:** `feat(home): hero + selected-work landing, relocate long bio`

---

## Phase 8 — Surface the visual work  *(Implements BM2)*

The work is highly visual; show it. The repo already contains assets to use.

**Files:** `images/` (copy in figures), new `_includes/work-gallery.html` (or reuse `_includes/feature_row` / `_includes/gallery`), `_pages/about.md` or a new `/work/` page, `_pages/talks.html` (surface the talk map).

**Available assets in the repo:**
- `files/ADA2024 - DKD value.png`, `files/ADA2024 - HE Ageing.png`, `files/ADA2024 - T2D SDM.png` — conference figures.
- `talkmap/map.html` + `_pages/talkmap.html` — an interactive Leaflet map of talk locations (currently `talkmap_link: false` in `_config.yml`, so it's hidden).

**Steps:**
1. Copy the three ADA figures into `images/` (keep originals in `files/`); rename without spaces, e.g. `images/work-dkd-value.png`. Update references accordingly.
2. Build `_includes/work-gallery.html` — a responsive figure grid (`figure` + serif `figcaption`, which the theme already styles) showing 2–4 model/figure thumbnails with captions naming the model type (system dynamics, agent-based, etc.). Use the theme's `figure.half` / `figure.third` helpers or a CSS grid in `_home.scss`.
3. Surface the talk map: set `talkmap_link: true` in `_config.yml` so `/talks/` links to it, **and** embed a small preview (an `<iframe src="/talkmap/map.html">` thumbnail or a static screenshot linking through) on the home or `/work/` page.
4. If a clean model schematic isn't available as an asset, leave a clearly-marked placeholder `figure` with a caption and a TODO comment so the owner can drop one in — do **not** invent/fake a diagram.

**Acceptance:** at least the three ADA figures and the talk map are visible and captioned on the site (home/work). Images are optimised (reasonable file size) and have `alt` text. Talk map opens and renders.

**Commit:** `feat(work): surface figures and talk map as a captioned gallery`

---

## Phase 9 — Editorial aesthetic pass  *(Implements BM5)*

Tie it together so every page feels deliberate, not stock.

**Files:** `_sass/_base.scss`, `_sass/_page.scss`, `_sass/_archive.scss`, `_sass/_notices.scss`, `_sass/_footer.scss`, `_sass/_masthead.scss`.

**Steps:**
1. **Vertical rhythm:** apply the `$space-*` scale to section spacing, list spacing, and figure margins so spacing is consistent rather than ad hoc.
2. **Meta as mono:** render dates, venues, read-time and breadcrumbs in `$monospace` (IBM Plex Mono) at a small size with letter-spacing — a quiet editorial signal. Touch `.page__meta`, `.page__date`, `.archive__item` meta in `_sass/_archive.scss`/`_page.scss`.
3. **Archive list (publications/talks):** restyle `.archive__item-title` (serif), give each item a hairline `border-top: 1px solid $border-color` and generous padding, so the publications page reads as a clean reference list.
4. **Masthead:** make it quieter and more confident — name in serif or medium-weight, nav in `$sans-serif` small caps or letter-spaced; thin `$border-color` underline. Remove the default intro animation if it feels dated (`_sass/_masthead.scss` `animation: intro`).
5. **Footer:** simplify to one line (Phase 4) in muted ink/mono; keep the AcademicPages credit but de-emphasise.
6. **Notices/blockquotes:** retint to the accent family (`_sass/_notices.scss`, `_sass/_base.scss` blockquote left-border → `$accent`).

**Acceptance:** publications, talks, a blog post, the CV and the homepage all share one type scale, one accent, consistent spacing and mono meta. Side-by-side with the Phase 0 baseline, the site no longer reads as default Minimal Mistakes.

**Commit:** `feat(aesthetic): editorial pass — rhythm, mono meta, archive + masthead + footer`

---

## Phase 10 — QA, accessibility, build & ship

**Files:** none new — verification across the site.

**Steps:**
1. **Responsive:** check `/`, `/publications/`, `/talks/`, `/cv/`, `/outreach/`, a blog post, and a single publication at 1440 / 1024 / 768 / 375px. Sidebar stacks, nav collapses (greedy-nav), figures scale, no horizontal scroll.
2. **Contrast/a11y:** verify `$text-color` on white and `$accent` on white both meet WCAG AA (≥4.5:1 for body). Teal `#0d5c63` on white ≈ 6.9:1 ✓; confirm any white-on-accent button ≈ ≥4.5:1. All images have `alt`; one `<h1>` per page; nav is keyboard-navigable.
3. **Build:** run a production build and confirm no errors / no broken links:
   ```bash
   JEKYLL_ENV=production bundle exec jekyll build
   ```
   Optionally run `html-proofer` over `_site` if available.
4. **Diff against baseline:** capture after-screenshots into `design_handoff_site_refresh/after/` and eyeball against `baseline/`.
5. **Cross-browser:** spot-check Chrome + Safari/Firefox (web fonts, greedy-nav).

**Acceptance:** clean production build, AA contrast, no broken links, responsive at all breakpoints.

**Commit:** `chore(qa): responsive + a11y + production build verification`

**Then:** open a PR from `feat/look-and-feel-refresh` → default branch with before/after screenshots in the description. GitHub Pages will rebuild on merge.

---

## Guardrails (apply throughout)

- **Don't break the build.** Run `jekyll serve` after every phase; SCSS errors fail silently into an unstyled site.
- **Tokens are the single source of truth.** Never hard-code a hex or font-family in a component partial — reference `_variables.scss`. If you need a new value, add a token.
- **Preserve all content.** Relocating the bio is fine; deleting publications, talks, CV entries or outreach posts is not.
- **One accent.** If you reach for a second saturated colour, stop — use tints of `$accent` or neutrals instead.
- **No invented assets.** Don't fabricate diagrams, logos, or data. Use the repo's real figures; leave captioned TODO placeholders where a real asset is missing.
- **Commit per phase** with the messages above so the work is reviewable and reversible.
- **Confirm the accent + fonts once** (Phase 1) with the site owner before the broad colour/type rollout, since they touch every page.

## Rollback

Each phase is its own commit on `feat/look-and-feel-refresh`. To revert a phase, `git revert <sha>`. To abandon entirely, delete the branch — `main` is untouched until the PR merges.
