# Implementation Plan — padj.github.io Look-and-Feel Refresh (reconciled)

**Audience:** Claude Code, working directly in the `padj.github.io` repository.
**Goal:** Implement the remaining recommendations from the design review, moving the site off the stock Minimal Mistakes look toward an editorial, evidence-forward identity — **without breaking the Jekyll build or losing content.**

> **This is the reconciled v2 of the plan (2026-06-26).** It is updated to current `master` after PR #13 ("UX improvements") merged, and corrects two factual misreads of the codebase in v1. See *"Reconciliation notes"* below for exactly what changed and why.

This is a Jekyll site (Academic Pages, a fork of Minimal Mistakes). SCSS compiles via `assets/css/main.scss` → `main.css`. Work through the phases **in order**; each phase ends in a clean build and a commit. Later phases assume the design tokens from Phase 1 exist.

---

## Reconciliation notes (what changed from v1, and why)

**Already shipped in PR #13 — do not re-do:**
- Single accent applied to links + nav, and an **active nav state** in the masthead (Liquid `active` class + teal underline, `aria-current`). v1 Phase 3 step 2 is **done**.
- **Back-to-top** button, **Poster/Talk chips** on the talks list, and a **publications year filter** — all live (these were not in v1 at all).
- Homepage **title/excerpt** fixed and an **"At a glance"** highlights line added; avatar converted `.jfif → .jpg`; bio tense/links tidied.

**One factual correction to v1:**
1. **`_includes/head/custom.html` *is* wired in** (`_layouts/default.html:11`). v1 claimed it wasn't and routed font `<link>`s into `head.html`. Use the intended extension point `head/custom.html` instead.

**Codebase note for Phase 6 (read the variables carefully):** in `_sass/_variables.scss`, the `$large: 1200px` / `$x-large: 1800px` pair at lines 109–110 is **inside a commented-out block**; the *active* breakpoints are `$large: 925px` / `$x-large: 1280px` (lines 116–117), and the Susy `container` is `$large` (925px). So v1's Phase 6 premise holds: with `$right-sidebar-width* : 0px` and `.page` = `span(10 of 12 last)`, content caps at ~925px and leaves real unused width on ≥1280px screens. Widening is legitimate — confirm against screenshots first so the measure doesn't overshoot.

**Decisions — RESOLVED 2026-06-26:**
- **D1 — Accent hex → `#0d5c63` (deep teal).** Single `$accent`, AA on white everywhere (~6.9:1). Retire both `#2a8c8c` and `#176f6f`.
- **D2 — Web-font strategy → self-host.** Source Serif 4 + Public Sans (+ IBM Plex Mono for meta), served from `assets/fonts/` via `@font-face`. No third-party connection. Requires the `woff2` files committed to the repo.
- **D3 — Hero ambition → full hero + selected-work cards** (Phase 7), driven by `_data/selected.yml`.

**Environment reality:** there is **no local Ruby/Jekyll toolchain** on the working machine. `bundle`/`jekyll serve` cannot run here. Verify via careful diff + Liquid/SCSS reasoning, then a **branch → PR preview** (GitHub Pages builds `master` on merge). The `_config.dev.yml` overlay does exist for anyone building where Ruby is available.

---

## Recommendation map (post-reconciliation)

| # | Recommendation | Phase | Status |
|---|---|---|---|
| BM4 | Design tokens (single source of truth) | 1 | partial — accent/links exist; formalise tokens |
| QW1 | Real web-font pairing, drop system stack | 2 | **to do** (DECISION D2) |
| QW2 | Fix heading hierarchy (setext `<h1>` bug) | 2 | **to do** — still present on `/` |
| QW3 | One considered accent, applied consistently | 3 | mostly done — consolidate + retire stray cyan/grey (DECISION D1) |
| QW4 | Trim social links to the four used | 4 | **to do** |
| QW5 | One-line positioning statement | 5 | partial — homepage lead exists; add sidebar tagline |
| BM3 | Widen desktop reading lane | 6 | **to do** (widen; confirm via screenshots) |
| BM1 | Homepage hero + selected work | 7 | **to do** (DECISION D3) |
| BM2 | Surface visual work (figures, talk map) | 8 | **to do** |
| NEW | Type filter (Talks/Posters) on the talks page | 9 | **to do** (mirror publications filter) |
| BM5 | Editorial aesthetic pass | 10 | **to do** (respect already-shipped chips/filter) |

> Tokens (Phase 1) come first because typography, colour and layout all consume them.

---

## Phase 0 — Setup & safety net

**Files:** none (environment only).

**Steps:**
1. Start from current `master` and create a working branch: `git checkout -b feat/look-and-feel-refresh`.
2. **Build/preview reality:** there is no local Ruby/Jekyll here. Do **not** rely on `bundle exec jekyll serve` on this machine. Verify each phase by (a) careful diff + SCSS/Liquid review, then (b) pushing the branch and reviewing the **PR diff / preview**. A rendered preview only exists once changes reach `master` (which Pages serves) — or build locally *only* on a machine that has Ruby, using the shipped overlay: `bundle exec jekyll serve --config _config.yml,_config.dev.yml`.
3. If a Ruby environment is available, capture **baseline screenshots** of `/`, `/publications/`, `/cv/`, and one talk page at 1440px and 375px under `design_handoff_site_refresh/baseline/`. Otherwise capture them from the live site before merge. These are the before/after reference and are also the inputs for the Phase 6 diagnosis.

**Acceptance:** working branch created off latest `master`; before-state captured (live or local).

**Commit:** `chore: branch + baseline for look-and-feel refresh`

---

## Phase 1 — Formalise design tokens  *(BM4)*

Master already defines a teal accent and AA link colour ad hoc. This phase makes the system explicit and single-sourced. Do **not** restyle components yet — only declare/normalise tokens.

**Files:** `_sass/_variables.scss`

**DECISION D1 — settle the accent first.** Pick one `$accent` and delete the competing value. Recommended: deep teal `#0d5c63` (AA everywhere) or keep the shipped `#176f6f`. Avoid leaving both `#2a8c8c` and `#176f6f` in play.

**Steps:**
1. **Introduce semantic tokens** near the existing colour block, *after* the original `$gray` ramp so they win:
   ```scss
   /* ink + accent (refresh) */
   $text-color   : #1c2024;                 // richer than washed dark-grey
   $accent       : #0d5c63;                 // single brand accent (DECISION D1)
   $accent-hover : mix(#000, $accent, 18%);
   $accent-muted : mix(#fff, $accent, 88%); // tint for backgrounds/borders

   $primary-color       : $accent;          // theme's de-facto interactive colour
                                             // (buttons, notices, nav underline, chips,
                                             // back-to-top) — make it THE accent
   $border-color        : #e6e8eb;
   $link-color          : $accent;
   $link-color-hover    : $accent-hover;
   $link-color-visited  : $accent;
   $masthead-link-color       : $text-color;  // nav text reads as ink…
   $masthead-link-color-hover : $accent;      // …accent on hover/active
   ```
   > Note: PR #13 set `$primary-color: #2a8c8c` and `$link-color: #176f6f` directly. Replace those two lines rather than appending, so there's exactly one definition of each. Setting `$primary-color := $accent` means the PR #13 components (chips, year-filter pills, back-to-top, nav underline) inherit the new teal automatically — so Phase 3 is mostly verification rather than re-pointing.
2. **Reconcile the active-nav underline.** It currently uses `$primary-color`. Since `$primary-color` becomes ink here, repoint the underline/active colour in `_sass/_navigation.scss` to `$accent` (verify the `.greedy-nav .visible-links a.active` / `&:before` rules added in PR #13 still read as accent, not ink).
3. **Type pairing tokens** (consumed in Phase 2 — declare now, don't load fonts yet):
   ```scss
   $serif      : "Source Serif 4", Georgia, "Times New Roman", serif;
   $sans-serif : "Public Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
   $monospace  : "IBM Plex Mono", Monaco, Consolas, "Lucida Console", monospace;
   $global-font-family : $sans-serif;
   $header-font-family : $serif;   // headings → serif: the identity move
   $caption-font-family: $serif;
   ```
4. **Semantic sizes + spacing scale:**
   ```scss
   $type-size-display : 2.5rem;   // page titles
   $type-size-section : 1.5rem;   // in-content section headings
   $space-1: 0.5rem; $space-2: 1rem; $space-3: 1.5rem;
   $space-4: 2.5rem; $space-5: 4rem; $space-6: 6rem;
   ```

**Acceptance:** SCSS compiles with no errors (verified locally where Ruby exists, else on the PR build). Exactly one definition each of `$accent`, `$link-color`, `$primary-color`. The PR #13 active-nav underline still renders in the accent.

**Commit:** `feat(tokens): single accent, ink text, serif/sans pairing, spacing scale`

---

## Phase 2 — Typography: web fonts + heading hierarchy  *(QW1, QW2)*

**Files:** `_includes/head/custom.html`, `_sass/_base.scss`, `_sass/_page.scss`, `_pages/about.md` (+ any other `_pages/*.md` using setext headings).

**Steps:**
1. **Load the fonts via the correct extension point.** `_includes/head/custom.html` *is* already included by `_layouts/default.html` — put the font loading there (not in `head.html`).
   - **If D2 = self-host (recommended):** add the `woff2` files under `assets/fonts/`, write `@font-face` blocks in a new `_sass/_fonts.scss`, `@import` it first in `main.scss`, and add `<link rel="preload">` for the two or three most-used weights in `head/custom.html`. No third-party connection.
   - **If D2 = Google CDN:** in `head/custom.html` add:
     ```html
     <link rel="preconnect" href="https://fonts.googleapis.com">
     <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
     <link href="https://fonts.googleapis.com/css2?family=Source+Serif+4:opsz,wght@8..60,400;8..60,500;8..60,600;8..60,700&family=Public+Sans:wght@400;500;600;700&family=IBM+Plex+Mono:wght@400;500&display=swap" rel="stylesheet">
     ```
   - **If D2 = keep system stack:** skip font loading; revert the Phase 1 typeface tokens to the system stack and treat QW1 as declined.
2. **Heading scale** in `_sass/_base.scss`. Currently `h1: $type-size-3` (~25px), `h2: $type-size-4`, `h3: $type-size-5` — too flat. Replace so the page title dominates and keep the serif family on the heading group:
   ```scss
   h1 { margin-top: 0; font-size: $type-size-display; line-height: 1.1; letter-spacing: -0.01em; }
   h2 { font-size: $type-size-section; margin: 2.2em 0 0.5em; }
   h3 { font-size: $type-size-4; }
   h4 { font-size: $type-size-5; }
   ```
3. **Page title** in `_sass/_page.scss` `.page__title` → display size + serif + tight line-height/letter-spacing.
4. **Fix the heading-hierarchy bug (QW2).** `_pages/about.md` uses setext `======` at lines 18 and 29, which Markdown renders as `<h1>` — so "My research interests" and "My background" currently compete with the page title (3× `<h1>` on `/`). Convert them to `##`:
   ```markdown
   ## My research interests
   ## My background
   ```
   Then sweep the repo for the same pattern and fix any other body section headings:
   ```bash
   grep -rln $'\n======' _pages _publications _talks _outreach
   ```
   The single page-level `<h1>` stays the front-matter `title:` rendered by the layout.

**Acceptance:** Source Serif 4 on headings + Public Sans on body (DevTools → Computed, not fallback). On `/`, `document.querySelectorAll('h1').length === 1`. Page title visibly larger than section headings.

**Commit:** `feat(type): web-font pairing + heading hierarchy (fix setext h1 bug)`

---

## Phase 3 — Finish the accent rollout  *(QW3)*

Tokens exist (Phase 1); active nav + link/badge colours already use the accent (PR #13). This phase removes any remaining stock greys/cyan and extends the accent to the few components PR #13 didn't touch.

**Files:** `_sass/_navigation.scss` (verify), `_sass/_buttons.scss`, `_sass/_sidebar.scss`, `_sass/_masthead.scss`, `_sass/_archive.scss` (verify chips), and a grep across `_sass`.

**Steps:**
1. **Hunt stray hard-coded colours / old cyan:**
   ```bash
   grep -rn "52adc8\|#7a8288\|\$info-color\|#2a8c8c\|#176f6f" _sass assets/css
   ```
   Anything interactive resolves to `$accent`/`$link-color`; structural greys to `$text-color`/`$border-color`. The only `#2a8c8c`/`#176f6f` references should be gone after Phase 1 consolidation.
2. **Verify, don't duplicate, the active-nav rules** added in PR #13 (`.greedy-nav .visible-links a.active` and the `:before` underline) now point at `$accent`.
3. **Confirm the talk chips** (`.archive__type-badge--poster` = accent, `--talk` = a neutral slate) still read correctly against the new tokens; adjust the slate if it clashes.
4. **Avatar ring** in `_sass/_sidebar.scss` — `.author__avatar img`: `padding: 4px; border: 2px solid $accent-muted;`
5. **Buttons** in `_sass/_buttons.scss` — default `.btn` uses `$accent` bg + white text, `$accent-hover` on hover; ensure white-on-accent ≥ 4.5:1 (true for `#0d5c63`).

**Acceptance:** `grep -rn "52adc8\|#2a8c8c" _sass assets` returns nothing. Links, buttons, nav hover/active, chips and avatar ring all read as one teal family.

**Commit:** `feat(color): consolidate single accent across nav, buttons, avatar, chips`

---

## Phase 4 — Trim social links to what's used  *(QW4)*

The populated `author:` keys are exactly **googlescholar, github, linkedin, orcid** (+ location, employer). Everything else is an empty branch.

**Files:** `_includes/author-profile.html`, `_includes/footer.html`, `_config.yml`.

**Steps:**
1. In `_includes/author-profile.html`, remove the dormant `{% if author.* %}` blocks for every network **except** `linkedin`, `github`, `googlescholar`, `orcid` (keep `location`, `employer`). ~25 unused branches go. Keep the `Follow` button only if a mobile dropdown survives Phase 7.
2. In `_includes/footer.html`, the follow block re-lists icons that duplicate the sidebar. Reduce to one quiet line (copyright + a single GitHub link) so social lives in **one** place.
3. In `_config.yml`, optionally delete the long list of empty `author:` keys for tidiness (cosmetic, low risk).

**Acceptance:** sidebar shows exactly four channels + location + employer; footer no longer repeats them; build clean.

**Commit:** `refactor(social): keep four real channels, de-duplicate footer`

---

## Phase 5 — Positioning statement  *(QW5)*

The homepage already has a role/excerpt and an "At a glance" line (PR #13). This phase adds the **sidebar** one-liner and tightens the homepage lead so the two reinforce each other (avoid duplication).

**Files:** `_includes/author-profile.html`, `_config.yml`, `_sass/_sidebar.scss`, `_pages/about.md`.

**Steps:**
1. Add an optional `author.tagline` to `_config.yml`:
   ```yaml
   tagline: "I build simulation & operational-research models for health economics."
   ```
   Render it in `author-profile.html` under `author.bio`:
   ```html
   {% if author.tagline %}<p class="author__tagline">{{ author.tagline }}</p>{% endif %}
   ```
   Style `.author__tagline` in `_sass/_sidebar.scss` (`font-size: $type-size-6; line-height: 1.4; margin-top: $space-1;`).
2. In `_pages/about.md`, ensure the lead is **one** crisp positioning sentence. If Phase 7's hero lands, fold the existing "At a glance" line into the hero rather than leaving both.

**Acceptance:** sidebar and top-of-`/` each state, in one line, what Thomas does and for whom — without repeating each other.

**Commit:** `feat(content): sidebar tagline + tightened homepage lead`

---

## Phase 6 — Widen the desktop reading lane  *(BM3)*

The active container caps at `$large: 925px` (the `1200px`/`1800px` pair at lines 109–110 is commented out), with `$right-sidebar-width* : 0px` and `.page` = `span(10 of 12 last)`. On ≥1280px screens this leaves a real band of unused width. Widen deliberately — but confirm against the Phase 0 screenshots so the measure doesn't overshoot.

**Files:** `_sass/_variables.scss`, `_sass/_page.scss`, `_sass/_masthead.scss`.

**Steps:**
1. **Raise the breakpoints/container** in `_sass/_variables.scss`: set the *active* `$large` / `$x-large` (lines 116–117) to e.g. `1100px` / `1400px`, and confirm the Susy map `container: $large` picks it up. Edit the active lines (or uncomment and adjust the 109–110 pair) — don't leave two competing definitions.
2. **Guard the measure.** A wider container must not produce 100ch lines. Cap the prose column — `.page__content { max-width: 48rem; }` (≈70–75ch) — while letting wide elements (figures, galleries, archive lists) use the fuller width.
3. **Align masthead to content.** Ensure `_sass/_masthead.scss` `&__inner-wrap` `max-width` tracks the new `$x-large` so the nav edge lines up with the content lane.

**Acceptance:** at 1440–1920px the content fills a deliberate, centred-feeling lane with no large dead band; prose measure stays 65–80ch; masthead and content share an edge. At 375px the layout stacks cleanly.

**Commit:** `feat(layout): widen reading lane, cap measure, align masthead`

---

## Phase 7 — Homepage hero + selected work  *(BM1)*

**DECISION D3 — confirm ambition.** Full hero + selected-work cards, or a lighter lead + CTAs built on the existing "At a glance" line.

**Files:** `_pages/about.md`, new `_includes/home-hero.html`, new `_includes/selected-work.html`, `_data/selected.yml`, new `_sass/_home.scss` (+ import in `main.scss`).

**Steps:**
1. `_includes/home-hero.html` — compact, text-first hero: name/role, one strong positioning sentence, 1–2 primary CTAs (`Publications`, `CV`). Serif display type + accent. No heavy background image required.
2. `_includes/selected-work.html` — a 2–3 card row of selected outputs, driven by `_data/selected.yml` so it's editable without markup:
   ```yaml
   - title: "Cardiovascular Risk Equations from the SELECT Trial"
     venue: "PharmacoEconomics, 2026"
     url: "/publication/2026-01-19-NN-SELECT-Risk-Equations-007"
     blurb: "Trial-based risk equations for secondary CV events in obesity."
   ```
3. In `_pages/about.md`: keep `author_profile: true`; at the top `{% include home-hero.html %}` then `{% include selected-work.html %}`; relocate the long "My background" prose below (or onto a dedicated `/about/` page). **Fold in the existing "At a glance" line** so it isn't duplicated. Do not delete the bio — relocate it.
4. `_sass/_home.scss` — hero + card styles from tokens (serif display, `$accent`, `$space-*`, `$border-color`; cards white with `1px solid $border-color` + subtle hover lift). Register after `@import "page";`.

**Acceptance:** `/` opens with hero + selected-work above the fold; full bio still reachable; cards link correctly; no orphaned/duplicated content.

**Commit:** `feat(home): hero + selected-work landing, relocate long bio`

---

## Phase 8 — Surface the visual work  *(BM2)*

Real assets exist in the repo: `files/ADA2024 - DKD value.png`, `files/ADA2024 - HE Ageing.png`, `files/ADA2024 - T2D SDM.png`, and the Leaflet talk map (`talkmap/map.html`, `_pages/talkmap.html`; `talkmap_link: false` in `_config.yml` hides the link).

**Files:** `images/`, new `_includes/work-gallery.html`, `_pages/about.md` or a new `/work/` page, `_pages/talks.html`, `_config.yml`.

**Steps:**
1. Copy the three ADA figures into `images/` with space-free names (e.g. `images/work-dkd-value.png`); keep originals in `files/`. Update references.
2. `_includes/work-gallery.html` — responsive `figure` + serif `figcaption` grid (2–4 thumbnails) captioned with the model type (system dynamics, agent-based, …). Reuse theme `figure.half`/`figure.third` or a grid in `_home.scss`.
3. Surface the talk map: set `talkmap_link: true` so `/talks/` links to it, and embed a small preview (an `<iframe>` thumbnail or a static screenshot linking through) on home or `/work/`.
4. If a clean model schematic isn't available, leave a clearly-marked placeholder `figure` + TODO comment — **do not fabricate** a diagram.

**Acceptance:** the three ADA figures + the talk map are visible and captioned; images optimised with `alt` text; map renders.

**Commit:** `feat(work): surface figures and talk map as a captioned gallery`

---

## Phase 9 — Talks & Posters type filter  *(NEW)*

Mirror the publications year filter on the Talks & Posters page so visitors can narrow to **Talks** or **Posters**. Reuse the *exact same* control so the two pages read as one system — extract the shipped `.pub-filter` into a shared component rather than duplicating it.

**Files:** `_sass/_archive.scss`, `_pages/publications.md`, `_pages/talks.html`, optional new `_includes/list-filter.html` (shared JS).

**Builds on PR #13:** the `.pub-filter` / `.pub-filter__btn` / `is-active` styles and the `data-year` filtering JS (publications), plus the `post.type` values `"Talk"` / `"Poster"` already used by the talk chips.

**Steps:**
1. **Generalise the filter styles** in `_sass/_archive.scss`: rename `.pub-filter` → `.list-filter` (keep `__btn` and `&.is-active`). This becomes the shared filter-bar for any listing; nothing about the visual design changes.
2. **Repoint publications** in `_pages/publications.md` to the shared class (`.pub-filter` → `.list-filter`), leaving the `data-year` items and JS otherwise unchanged. `grep -rn "pub-filter" _sass _pages` should return nothing afterwards.
3. **Add the type filter to `_pages/talks.html`**, deriving the set from the data exactly as publications derives years, and mapping the singular `post.type` to a plural label:
   ```liquid
   {% assign talks = site.talks | reverse %}
   {% capture type_list %}{% for post in talks %}{{ post.type | downcase }},{% endfor %}{% endcapture %}
   {% assign types = type_list | split: ',' | uniq %}

   <div class="list-filter" role="group" aria-label="Filter talks by type">
     <button type="button" class="list-filter__btn is-active" data-type="all">All</button>
     {% for t in types %}{% if t != '' %}<button type="button" class="list-filter__btn" data-type="{{ t }}">{{ t | capitalize }}s</button>{% endif %}{% endfor %}
   </div>

   <div class="talk-list">
     {% for post in talks %}
       <div class="talk-item" data-type="{{ post.type | downcase }}">
         {% include archive-single-talk.html %}
       </div>
     {% endfor %}
   </div>
   ```
   (`{{ t | capitalize }}s` → "Talks" / "Posters". If a future `type` doesn't pluralise cleanly, switch to an explicit label map.)
4. **Filtering JS** — identical pattern to the publications filter, keyed on `data-type` / `.talk-item`. To avoid two near-copies, optionally extract a tiny parameterised script into `_includes/list-filter.html` (item selector + attribute name) and include it on both pages; otherwise inline the same ~15 lines.
5. **Preserve the existing talk-map link block** (the `talkmap_link` conditional) — keep it above the new filter bar.

**Acceptance:** the Talks & Posters page shows All / Talks / Posters pills **visually identical** to the publications year filter; clicking filters in place with no reload; "All" restores everything; the per-item type chips still render. The publications year filter still works after the class rename.

**Commit:** `feat(talks): Talks/Posters type filter via shared list-filter component`

---

## Phase 10 — Editorial aesthetic pass  *(BM5)*

Tie it together. **Respect what PR #13 already shipped** (talk chips, the shared list-filter pills, back-to-top, active nav) — extend their styling into the system rather than rebuilding them.

**Files:** `_sass/_base.scss`, `_sass/_page.scss`, `_sass/_archive.scss`, `_sass/_notices.scss`, `_sass/_footer.scss`, `_sass/_masthead.scss`.

**Steps:**
1. **Vertical rhythm:** apply `$space-*` to section, list and figure spacing.
2. **Meta as mono:** render dates, venues, read-time, breadcrumbs in `$monospace` at a small letter-spaced size (`.page__meta`, `.page__date`, archive meta). Ensure the existing `.archive__type-badge` and `.list-filter__btn` sit comfortably with the new meta styling.
3. **Archive list:** `.archive__item-title` → serif; hairline `border-top: 1px solid $border-color` + generous padding so publications/talks read as a clean reference list.
4. **Masthead:** quieter and more confident — name in serif/medium weight, nav letter-spaced sans; thin `$border-color` underline. Consider removing the dated `animation: intro`.
5. **Footer:** one muted line (Phase 4); keep the AcademicPages credit, de-emphasised.
6. **Notices/blockquotes:** retint to the accent family (blockquote left-border → `$accent`).

**Acceptance:** every page shares one type scale, one accent, consistent spacing and mono meta. Side-by-side with baseline, it no longer reads as default Minimal Mistakes; PR #13 components look native to the new system.

**Commit:** `feat(aesthetic): editorial pass — rhythm, mono meta, archive + masthead + footer`

---

## Phase 11 — QA, accessibility, ship

**Files:** none new — verification across the site.

**Steps:**
1. **Responsive:** `/`, `/publications/`, `/talks/`, `/cv/`, `/outreach/`, a blog post, a single publication at 1440/1024/768/375px. Sidebar stacks, greedy-nav collapses, figures scale, no horizontal scroll, both list-filters (year + talk type) + back-to-top work.
2. **Contrast/a11y:** `$text-color` and `$accent` on white ≥ 4.5:1 (`#0d5c63` ≈ 6.9:1 ✓); white-on-accent buttons ≥ 4.5:1; every image has `alt`; one `<h1>` per page; nav keyboard-navigable; the list-filter buttons are real `<button>`s (they are) with discernible focus.
3. **Build:** only where Ruby exists — `JEKYLL_ENV=production bundle exec jekyll build`, optionally `html-proofer` over `_site`. On this machine, rely on the PR preview build instead.
4. **Diff vs baseline:** capture after-screenshots; eyeball against `baseline/`.
5. **Cross-browser:** spot-check Chrome + Firefox/Safari (web fonts, greedy-nav, smooth-scroll).

**Acceptance:** clean build, AA contrast, no broken links, responsive at all breakpoints.

**Commit:** `chore(qa): responsive + a11y + build verification`

**Then:** open a PR from `feat/look-and-feel-refresh` → `master` with before/after screenshots. Pages rebuilds on merge.

---

## Guardrails (apply throughout)

- **Don't break the build.** SCSS errors fail silently into an unstyled site. Where Ruby exists, build after each phase; otherwise lean on the PR preview before merging to `master`.
- **Tokens are the single source of truth.** Never hard-code a hex or font-family in a component partial — reference `_variables.scss`. After Phase 1 there must be exactly one `$accent`.
- **Preserve all content.** Relocating the bio is fine; deleting publications, talks, CV entries or outreach is not.
- **One accent.** Reach for a second saturated colour → stop; use tints of `$accent` or neutrals.
- **No invented assets.** Use the repo's real figures; leave captioned TODO placeholders where one is missing.
- **Don't regress PR #13.** Active nav, talk chips, year filter, back-to-top and the avatar `.jpg` are shipped — extend, don't overwrite.
- **Commit per phase** with the messages above so work is reviewable and reversible.
- **Confirm D1–D3 once** before the broad rollout, since they touch every page.

## Rollback

Each phase is its own commit on `feat/look-and-feel-refresh`. Revert a phase with `git revert <sha>`; abandon entirely by deleting the branch — `master` is untouched until the PR merges.
