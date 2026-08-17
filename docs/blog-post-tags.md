# Suggested blog post tags

A controlled vocabulary for the `tags:` field on blog posts (`_posts/`). The aim is a small, stable set of tags that group posts usefully on the [tag archive](../_pages/tag-archive.html) (`/tags/`) — rather than a long tail of one-post tags that group nothing.

Companion to [`docs/writing-style-guide.md`](writing-style-guide.md), which covers the mechanics of front matter. This document covers *which* tags to pick.

## How tags work here

- Tags are rendered by the Liquid tag archive at `/tags/` (`tag_archive` in `_config.yml`), which groups every post in `_posts/` by tag. There is no category archive in active use — **use tags, not `categories:`**.
- The archive leads with a filter nav listing every tag **with its post count**, and clicking one filters the page to that tag. So a thin vocabulary is visible to readers, not just untidy behind the scenes: a tag showing `1` is a filter that goes nowhere.
- A tag only earns its place once it applies to more than one post. A tag with a single post produces a heading with one item under it.
- Tags are slugified for the anchor and filter link (`health economics` → `/tags/#health-economics`). Keep the spaces in the front matter and let the archive do that; don't pre-hyphenate.
- Tags are not keywords for search engines, and they are not a summary. That job belongs to `title` and `excerpt`.
- Tags run on two axes: **what the post is about methodologically** (the craft) and **what health topic it concerns** (the disease or population area). Most posts want at least one of the first and — where the post is genuinely about a health topic rather than about modelling in the abstract — one of the second.

## Mechanics

- Lower-case, spaces allowed (`health economics`, not `Health-Economics` or `healthEconomics`).
- Singular or plural — pick whichever reads naturally, then stay consistent with the list below (`modelling`, not `models`).
- **2–4 tags per post.** One is usually too few to be useful; five or more means the tags have stopped discriminating between posts.
- **Typical shape: 1–3 craft tags plus at most one topic tag.** A post about ageing capacity modelling is `operational research`, `longevity` — not a list of every condition older patients present with.
- British spelling, in line with the rest of the site (`modelling`, `behaviour`).
- Order: most central to the post first. It has no functional effect, but it reads better in the post header.

## Core vocabulary (craft)

These are the tags already in use across published posts and drafts. Prefer them over inventing something new.

| Tag | Use it when the post... |
|---|---|
| `modelling` | is about the craft of building or reasoning with models — the default tag for most posts here |
| `health economics` | concerns HTA, cost-effectiveness, drug pricing, payer decisions, or health-system value |
| `operational research` | deals with queues, capacity, flow, scheduling, or simulation of processes |
| `engineering` | draws on the engineering world — fluid dynamics, structures, or the prior career |
| `science` | is about scientific practice, method, or epistemics more broadly than one field |

## Secondary vocabulary (craft)

Suggestions for topics in the [content plan](../_drafts/content-plan.md) that the core tags don't cover. Add these as the posts that need them are actually published — not in advance.

| Tag | Use it when the post... |
|---|---|
| `simulation` | is specifically about DES, agent-based, or individual-based simulation, as distinct from modelling in general |
| `systems thinking` | argues for treating something as a system rather than a sum of parts |
| `ai` | is about AI or machine learning, in health economics or elsewhere |
| `careers` | is about career paths, moving between fields, or how the work is actually done day to day |
| `outreach` | is a write-up of a public-engagement event (note: the `_outreach/` collection is the primary home for these) |

## Disease and topic-area tags

The second axis: *what* the post is about, rather than *how* it was modelled. These are deliberately broad — a therapy or population area, not a condition, trial, or drug name. One per post is almost always enough.

| Tag | Use it when the post... |
|---|---|
| `longevity` | concerns ageing and its consequences — population ageing, healthy life expectancy, the workforce and informal-care knock-ons. **This is the tag for all ageing topics**; do not also introduce `ageing` or `population ageing` |
| `multimorbidity` | is about people living with several conditions at once — combined burden, competing risks, or why single-condition models struggle with them |
| `obesity` | is about obesity or overweight — population-level burden, prevention, or the treatment landscape |
| `cardiovascular` | is about cardiovascular disease or cardiovascular risk |
| `infectious disease` | is about transmission, vaccination, or outbreak dynamics |
| `antimicrobial resistance` | is about AMR — burden, trends, or stewardship |
| `public health` | takes a population and prevention view rather than a treatment or reimbursement one |

Each of these is grounded in something already on the site — a publication, a stated research interest on the [homepage](../_pages/about.md), or a brief in the content plan — so each has a plausible second post behind it rather than being speculative. Three notes:

- **`longevity`, `multimorbidity` and `public health` are population tags, not disease tags.** They will often sit alongside a disease tag (`obesity`, `longevity`) where a post covers both — that's fine, but it uses up the topic slot twice, so only do it when both are genuinely central.
- **`longevity` and `multimorbidity` overlap but are not the same thing.** Multimorbidity is a common *consequence* of ageing, not a synonym for it: use `longevity` for the demographic shift, `multimorbidity` for the several-conditions-at-once problem, and both only when a post is squarely about the intersection.
- **`antimicrobial resistance` and `cardiovascular` currently have one paper each behind them.** They pass the "is this a real strand of the work" test but not yet the two-post test — worth holding until a second post is in view.

Obvious future extensions when a post actually needs one, following the same pattern: `oncology`, `rare disease`, `mental health`, `respiratory`, `diabetes`. I have not added these to the table because nothing on the site indicates a post is coming — add them at the point of use, not now.

## Tags to avoid

- **Anything that applies to every post** — `blog`, `thoughts`, `writing`. These group nothing.
- **Single-use topical tags** — `eels`, `coffee shop`, `NICE`. If it names one post's subject, it belongs in the title, not the tags. Note the distinction from the section above: a broad *area* (`obesity`) can catalogue several posts; a specific condition, trial, drug, or institution names one.
- **Near-duplicates of an existing tag** — `health econ`, `models`, `OR`, `ageing`, `comorbidity`. The archive treats these as separate headings, silently fragmenting the group.
- **Audience or format labels** — `technical`, `explainer`, `long read`. The post type distinction in the style guide is editorial, not a tag.
- **The placeholder tags in `_drafts/`** — `test1`, `category1`, `edge case`, `Jekyll` all come from the theme's example content and should never reach `_posts/`.

## Adding a new tag

Reasonable to do — the vocabulary should grow with the blog. Before adding one:

1. Check the lists above for a tag that already covers it.
2. Confirm you can name at least one *other* post — published or planned — that would carry the same tag.
3. For a topic tag, check you are naming an *area* and not one post's subject, and pitch it at the same breadth as the existing rows.
4. Add it to this document at the same time, so the next post picks the same wording rather than a variant.

If those conditions don't hold, publish with the core tags only. A post with two accurate tags is better catalogued than one with four, three of which lead nowhere.
