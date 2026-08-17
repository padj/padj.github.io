# Writing style guide

A reference for anyone — human or AI agent — drafting content for this site: blog posts (`_posts/`), the homepage bio (`_pages/about.md`), outreach write-ups (`_outreach/`), and podcast episode descriptions (`_podcast/`). The goal is consistency with Thomas's voice so that drafts need minimal editing before publishing.

## How to use this guide (for AI agents)

- Read the **Voice & tone**, **Structure**, and **Language & mechanics** sections before drafting; run the **Pre-submit checklist** at the end before handing back.
- Match the mechanical specs exactly — front matter, British spelling, link syntax, maths, figures. These are objective and are where most avoidable editing comes from.
- **Never invent facts.** Anecdotes, credentials, citations, links, dates, numbers, and internal cross-references must be real. Where you'd need one you can't verify, leave a placeholder (see [Handling gaps](#handling-gaps--never-fabricate)). This matters more than sounding polished.
- The strongest single exemplar of voice is the published post [`_posts/2026-08-04-what-is-a-model.md`](../_posts/2026-08-04-what-is-a-model.md). When in doubt, re-read it.
- **Ignore `_drafts/`.** That content is heavily AI-co-authored and is *not* representative of Thomas's voice — do not use it as a model.

---

## Post types

There are two, distinguished by depth rather than topic. Pick the lighter one unless the content genuinely needs the extra room.

| | **General post** | **Technical post** |
|---|---|---|
| Length | ~500–900 words | ~900–1500 words |
| Purpose | Explain one idea to a curious non-expert | Work through something with more machinery |
| Extras | Prose, analogies, short lists | May include equations, diagrams, and visualisations |
| Default? | Yes — most posts are this | Only when equations/figures earn their place |

Length is a guide, not a quota. Do not pad to reach a count; if the idea is done in 450 words, stop. Technical posts get more room *because* equations and figures take space, not as licence to waffle.

---

## Voice & tone

Aim to reproduce Thomas's voice in full, including his dry humour and asides — but see the guardrail below.

- **First person, curious, understated.** Lead with genuine curiosity rather than authority. Open questions honestly instead of asserting a settled answer:
  > "The word *model* appears everywhere in science, but I don't think it's ever that well defined."
- **Claim things as your own view, with a hedge where a hedge is honest.** Signal the perspective you're speaking from:
  > "In fact, I would argue, as a modeller, that the decision of where the *bounds* of the model are, is the most important aspect of model building."
- **Let personality and dry, self-deprecating humour through** where it arises naturally:
  > "I aim to write up each one as a blog post — though time is rarely on my side."
  > "However, I ended up being entirely captivated by another topic: fish."
- **Be honest about the limits of your own framing.** Acknowledge the reader's likely reaction rather than papering over it:
  > "This may seem like it's verging on a politician's answer, but that conditional wording matters."
- **Warm and plain in short-form.** Podcast and outreach descriptions are conversational — a couple of sentences saying what happened and why it mattered, sometimes ending on a genuine question the episode explores ("what even is a model? What does it do? What's the point?").

**Guardrail on humour (important for agents):** humour here is incidental — it surfaces from a real observation, never manufactured to hit a quota. A forced or generic joke is worse than none and creates editing. If a light aside doesn't arrive naturally, write it straight. When you're unsure whether an aside lands, leave a placeholder (`[TODO: Thomas — aside here if wanted?]`) rather than inventing one.

---

## Structure & formatting conventions

There is no single mould. The pattern below is Thomas's default for **explainer posts** ("What is a model?"), and it's a strong choice when introducing a concept — but don't force every post into it. Project write-ups, reflections, and event recaps have their own natural shapes.

### The explainer pattern (a strong default, not mandatory)

1. **Short intro paragraph, no heading** — often opening on a question or an admission of uncertainty.
2. **Headline definition in a blockquote,** then unpacked — often via a short numbered breakdown:
   > **A model is a simplified representation of reality, designed for a specific purpose.**

   followed immediately by:
   > This definition has two key parts:
   > 1. A model is simplified — reality contains much more detail than can be practically captured in a model.
   > 2. A model has a purpose — the right model depends on what it's for.
3. **A concrete, everyday analogy before the abstraction** — a city map, walking from A to B, airport bottlenecks, a zombie outbreak. The reader meets something familiar first:
   > "Consider a map of a city. It is a simplified representation of reality (a city) and it has a purpose (navigation)."
4. **A few `##` sections** with plain, short headings ("A map is a model", "The ingredients of a model").
5. **An italic sign-off** cross-linking related content (see below).

### Conventions that apply to any post

- **Bulleted lists use a bold lead term, then a plain-language gloss.** The bold word is the concept; the sentence after it does the explaining:
  > - **Purpose.** What are we trying to understand, predict, compare, or decide?
  > - **Bounds.** What is *inside* the model versus what is *outside* the model?
- **Open or pivot a section with a rhetorical question** where it helps.
- **Use a blockquote to state a principle mid-argument,** not only for the opening definition:
  > "If the inputs and assumptions within our model are reasonable, and if these rules describe the important relationships, then this is what follows."
- **Italicise the term under discussion** (*model*, *bounds*, *a priori*) when being precise about it.
- **Keep the scaffolding light.** A handful of sections, not a heading per paragraph.

---

## Language & mechanics

- **British spelling and conventions throughout.** The site locale is `en-UK`. Common trap words:

  | Use | Not |
  |---|---|
  | modelling, modeller, modelled | modeling, modeler, modeled |
  | optimisation, optimise, analyse | optimization, optimize, analyze |
  | behaviour, favour, colour, rigour | behavior, favor, color, rigor |
  | centre, metre (but "parameter") | center, meter |
  | ageing, organisation, recognise, generalise | aging, organization, recognize, generalize |
  | licence (noun) / license (verb) | license (noun) |
  | practice (noun) / practise (verb) | practice (verb) |
  | maths | math |

  Note Thomas writes **"focussed"** (double *s*). Prefer "use" over "utilise". Program → **programme** for events/schedules, but keep **program** for code.
- **Vary sentence length.** Mix longer, qualified sentences with short punchy ones ("They leave things out on purpose."). Em-dashes and parenthetical asides are characteristic — use them for the aside, the caveat, the second thought.
- **Explain jargon in plain language.** When a technical term appears (SEIR-like model, dynamic transmission modelling, agent-based models), gloss it or surround it with enough plain context that a non-expert isn't lost. Write for a curious non-specialist, never a fellow expert.
- **Prefer plain framing over inflated claims.** "A model is never just a formula separated from context" does more work than any superlative would.
- **Markdown flavour is GFM** (kramdown). Heading IDs are generated automatically. Smart quotes are on, so write straight quotes/apostrophes and let the build curl them.

### Maths (technical posts)

MathJax v2.7.4 is loaded site-wide, so LaTeX works in any post:

- **Inline:** `$...$` or `\(...\)` — e.g. `The basic reproduction number $R_0$ determines...`
- **Display:** `$$...$$` on its own line, or `\[...\]`.
- Equation auto-numbering is **on** across the site, so displayed equations get numbers automatically — don't hand-number them.
- Keep notation defined in words the first time it appears; the non-expert reader still applies.

### Figures & visualisations (technical posts)

- **Static images** live in the top-level `/images/` directory. Reference them with root-relative Markdown and always give alt text, followed by an italic caption line:
  ```markdown
  ![Schematic of the SEIR compartments](/images/seir-schematic.png)
  *Figure 1. Compartments and flows in the zombie SEIR model.*
  ```
- **Interactive visualisations** (Shiny apps, dashboards) are **linked out to their hosted home**, not embedded — as Thomas did with the public zombie model. Link in prose with a plain description.
- If a figure or its file doesn't exist yet, insert a placeholder (see below) rather than referencing a path you haven't verified.

---

## Cross-linking & sign-offs

- **Weave internal links into the prose** where a related episode, outreach session, or publication genuinely supports the point — not as a link dump. Use Jekyll's `relative_url` filter for all internal links:
  ```markdown
  [what zombies can teach us about public health]({{ "/outreach/Oxford-IF-zombies" | relative_url }})
  ```
- **Only link to content that exists.** Verify the target permalink against the file in `_podcast/`, `_outreach/`, `_publications/`, etc. If you want to link something that isn't there, leave a placeholder.
- **Close a post with an italic sign-off paragraph** pointing to related podcast / outreach / publications content:
  > *For a conversation about this topic, including when a model is wrong and when it is still useful, listen to the podcast episode ["What is a model? And when is it wrong?"]({{ "/podcast/shaping-the-future-005" | relative_url }}).*
- **External links point to the real thing** (HEOR, the university, the eTheses repository, the Spotify episode) and are described plainly.

---

## Front matter

Set front matter exactly per collection. Layout, `author_profile`, `comments`, `share`, etc. are applied automatically by `_config.yml` defaults — you rarely need to set them. Dates are ISO `YYYY-MM-DD`. Tags are lower-case — see [`docs/blog-post-tags.md`](blog-post-tags.md) for which tags to pick.

**Blog post** (`_posts/`, filename `YYYY-MM-DD-slug.md`):
```yaml
---
layout: single
title: "What is a model?"
excerpt: "One sentence capturing the core idea."
tags:
    - modelling
    - health economics
---
```

**Outreach** (`_outreach/`):
```yaml
---
title: "What can zombies teach us about public health? - Oxford"
collection: outreach
permalink: /outreach/Oxford-IF-zombies
excerpt: "Outreach as part of the Oxford Science & Ideas Festival"
date: 2025-10-31
venue: "Oxford Science & Ideas Festival"
location: "Oxford"
---
```

**Podcast** (`_podcast/`):
```yaml
---
title: "What is a model? And when is it wrong?"
collection: podcast
permalink: /podcast/shaping-the-future-005
excerpt: ""
date: 2026-06-18
---
```

Conventions:
- `permalink` matches the filename and collection, e.g. `/podcast/shaping-the-future-006`.
- `excerpt` is one plain sentence for posts (it's used as the summary). Podcast excerpts are left empty; the body carries the description.
- Append later updates inline in the body ("Update 2026-08-05: …") rather than editing the original text.

---

## Handling gaps — never fabricate

Thomas's voice runs on *real* personal detail (aerospace, a fish-behaviour PhD, HEOR, specific talks and episodes). An agent must **not** invent any of it. Where a draft needs something you can't verify — a personal anecdote, a specific result, a citation, a date, a figure, or an internal link — insert a clearly marked placeholder inline where the content belongs:

```
[TODO: Thomas — add the anecdote about X here]
[TODO: verify link — does /podcast/... exist?]
[TODO: figure — schematic of Y, not yet created]
```

This applies to numbers and claims too: do not soften a fabricated statistic into vague prose — flag it. A draft full of honest placeholders is far less work to finish than one where invented details have to be hunted down and removed.

---

## Templates

### General post
```markdown
---
layout: single
title: "A question, or a plain statement"
excerpt: "One sentence capturing the core idea."
tags:
    - tag-one
    - tag-two
---

Short intro, no heading — open on curiosity or a question, not a thesis.

## First plain-headed section
Everyday analogy or concrete example first, then the idea.

## Second section
- **Lead term.** Plain-language gloss.
- **Lead term.** Plain-language gloss.

Closing thought that restates the point without grandeur.

*Sign-off: for more on this, see [related episode]({{ "/podcast/..." | relative_url }}).*
```

### Technical post
```markdown
---
layout: single
title: "A precise but still plain title"
excerpt: "One sentence capturing the core idea."
tags:
    - modelling
    - tag-two
---

Short intro framing the problem and why it's worth the extra depth.

## Setup
Define terms in words. Introduce notation as you go: the rate $\lambda$ is...

## The model
$$
\frac{dS}{dt} = -\beta S I
$$

![Schematic of the model](/images/your-figure.png)
*Figure 1. Caption in plain language.*

## What it tells us
Interpret the maths back in plain terms for the non-expert.

*Sign-off cross-linking related content via {{ "/path" | relative_url }}.*
```

---

## Things to avoid

Anti-patterns that do **not** match Thomas's voice. Several appear in `_drafts/`; that content is AI-co-authored and must not be imitated.

- **Over-structuring** — too many headings, nested sub-sections, a heading per paragraph. Keep the section count low.
- **Bolding everything** — bold is for the lead term of a list item or a genuine definition, not scattered emphasis in prose.
- **Clichés and buzzwords** — "crystal ball", "in today's fast-paced world", "unlock", "leverage", "game-changer", "deep dive", "at the end of the day". If a phrase could open any LinkedIn post, cut it.
- **Manufactured humour** — jokes inserted to seem personable. Humour must arise from a real observation or not appear.
- **Inflated authority** — don't posture as the definitive expert. Trust is earned by curiosity and honesty about uncertainty.
- **Generic filler and throat-clearing** — no "It is important to note that…", no restating the heading as the first sentence, no padding.
- **American spelling** — always the British form (see table above).
- **Fabricated detail** — invented anecdotes, credentials, statistics, citations, or links. Use placeholders instead.
- **Link dumps and forced cross-references** — link only where the connection is real and helps the reader.
- **Losing the reader in jargon** — if a term needs a glossary, give it a plain-language gloss instead.

---

## Pre-submit checklist (run before handing back)

- [ ] **Post type** chosen; length within range (~500–900 general, ~900–1500 technical); no padding.
- [ ] Opens with curiosity or a question, not a thesis statement or a cliché.
- [ ] Structure is light; headings are plain and short; nothing forced into the explainer mould that doesn't fit it.
- [ ] Analogy/concrete example precedes the abstraction (for explainer content).
- [ ] Bulleted lists use **bold lead term + gloss**; bold not overused elsewhere.
- [ ] **British spelling** throughout (checked against the trap-word table).
- [ ] Jargon glossed in plain language; written for a curious non-expert.
- [ ] Maths uses `$...$` / `$$...$$`; equations not hand-numbered; figures in `/images/` with alt text + caption.
- [ ] Internal links use `{{ "/path" | relative_url }}` and point to content that actually exists.
- [ ] Italic sign-off cross-links related, real content.
- [ ] Front matter correct for the collection (fields, `permalink`, ISO date, lower-case tags).
- [ ] **No fabricated** anecdotes, facts, numbers, citations, or links — every gap is a marked `[TODO: …]` placeholder.
- [ ] No buzzwords, filler, inflated authority, or manufactured humour.

> Note on scope: this guide is distilled largely from a single published post plus the bio, outreach, and podcast descriptions. It's a solid foundation, not a large corpus — revisit and refine it as more of Thomas's writing accumulates.
