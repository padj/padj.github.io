# Writing style guide

A reference for writing content on this site in Thomas's voice — blog posts (`_posts/`), the homepage bio (`_pages/about.md`), outreach write-ups (`_outreach/`), and podcast episode descriptions (`_podcast/`).

It's distilled from the genuinely-authored live content, chiefly the post [_posts/2026-08-04-what-is-a-model.md](../_posts/2026-08-04-what-is-a-model.md), which is the strongest single signal. Use it to keep new writing (and any AI-assisted drafting) sounding like Thomas rather than like a generic blog. Anything in `_drafts/` is heavily AI-co-authored and is **not** representative — do not imitate it.

The reader to picture throughout is a *curious non-expert*: intelligent, interested, but not a fellow specialist. Explain, don't assume.

---

## Voice & tone

- **First person, curious, understated.** Lead with genuine curiosity rather than authority. Open questions honestly instead of asserting a settled answer:
  > "The word *model* appears everywhere in science, but I don't think it's ever that well defined."
- **Claim things as your own view, with a hedge where a hedge is honest.** Signal the perspective you're speaking from:
  > "In fact, I would argue, as a modeller, that the decision of where the *bounds* of the model are, is the most important aspect of model building."
- **Let personality and dry humour through** where it's natural — but keep it light and self-deprecating, never performative:
  > "I aim to write up each one as a blog post — though time is rarely on my side."
  > "However, I ended up being entirely captivated by another topic: fish."
- **Be honest about the limits of your own framing.** Acknowledge the reader's likely reaction rather than papering over it:
  > "This may seem like it's verging on a politician's answer, but that conditional wording matters."
- **Warm and plain in short-form.** Podcast and outreach descriptions are conversational and unfussy — a couple of sentences that say what happened and why it mattered, sometimes ending on a genuine question the episode explores ("what even is a model? What does it do? What's the point?").

---

## Structure & formatting conventions

- **Lead a key idea with a headline definition in a blockquote,** then unpack it — often via a short numbered breakdown:
  > **A model is a simplified representation of reality, designed for a specific purpose.**

  followed immediately by:
  > This definition has two key parts:
  > 1. A model is simplified — reality contains much more detail than can be practically captured in a model.
  > 2. A model has a purpose — the right model depends on what it's for.
- **Ground the abstraction in a concrete, everyday analogy first,** then generalise. A city map, walking from A to B, airport bottlenecks, a zombie outbreak — the reader meets something familiar before the concept:
  > "Consider a map of a city. It is a simplified representation of reality (a city) and it has a purpose (navigation)."
- **Use bulleted lists with a bold lead term, then a plain-language gloss.** The bold word is the concept; the sentence after it does the explaining:
  > - **Purpose.** What are we trying to understand, predict, compare, or decide?
  > - **Bounds.** What is *inside* the model versus what is *outside* the model?
- **Open or pivot sections with a rhetorical question.** Section headings themselves are often plain and short ("A map is a model", "The ingredients of a model", "Models as structured arguments").
- **Use a second blockquote to state a principle mid-argument,** not only for the opening definition:
  > "If the inputs and assumptions within our model are reasonable, and if these rules describe the important relationships, then this is what follows."
- **Keep the scaffolding light.** A short intro paragraph with no heading, then a handful of `##` sections. Don't over-structure — the "What is a model?" post carries its whole argument in four sections plus a sign-off.

---

## Language & mechanics

- **British spelling and conventions throughout:** modelling, modeller, focussed, favour, stratified, optimisation, ageing.
- **Vary sentence length.** Mix longer, qualified sentences with short punchy ones ("They leave things out on purpose."). Em-dashes and parenthetical asides are welcome and characteristic — use them for the aside, the caveat, the second thought.
- **Italicise the term under discussion** (*model*, *bounds*, *a priori*, *model's purpose*) when you want the reader to notice you're being precise about it.
- **Explain jargon in plain language rather than assuming it.** When a technical term appears (SEIR-like model, dynamic transmission modelling, agent-based models), gloss it or surround it with enough plain context that a non-expert isn't lost.
- **Prefer plain framing over inflated claims.** "A model is never just a formula separated from context" does more work than any superlative would.

---

## Cross-linking & sign-offs

- **Weave internal links into the prose** where a related episode, outreach session, or publication genuinely supports the point — not as a link dump. Use Jekyll's `relative_url` filter for internal links:
  ```markdown
  [what zombies can teach us about public health]({{ "/outreach/Oxford-IF-zombies" | relative_url }})
  ```
- **Close a post with an italic sign-off paragraph** that points the reader to related podcast / outreach / publications content:
  > *For a conversation about this topic, including when a model is wrong and when it is still useful, listen to the podcast episode ["What is a model? And when is it wrong?"]({{ "/podcast/shaping-the-future-005" | relative_url }}).*
- **Front matter conventions:** posts use `layout: single`, a `title`, a one-sentence `excerpt` that captures the core idea, and lower-case `tags`. Outreach and podcast items set `collection`, `permalink`, and (for outreach) `date`, `venue`, `location`. Dated updates are appended inline in the body ("Update 2026-08-05: …") rather than editing the original text.
- **External links point to the real thing** (HEOR, the university, the eTheses repository, the Spotify episode) and are described plainly.

---

## Things to avoid

These are anti-patterns — they do **not** match Thomas's voice. Some appear in `_drafts/`; that content is AI-co-authored and should not be imitated.

- **Over-structuring.** Too many headings, nested sub-sections, or a heading for every paragraph. Keep the section count low and let paragraphs carry the argument.
- **Bolding everything.** Bold is for the lead term of a list item or a genuine definition — not for scattering emphasis through ordinary prose.
- **Clichéd framing and buzzwords:** "crystal ball", "in today's fast-paced world", "unlock", "leverage", "game-changer", "deep dive", "at the end of the day". If a phrase could open any LinkedIn post, cut it.
- **Inflated authority.** Don't posture as the definitive expert. The voice earns trust by being curious and honest about uncertainty, not by claiming certainty it doesn't have.
- **Generic filler and throat-clearing.** No empty preambles ("It is important to note that…"), no restating the heading as the first sentence, no padding to reach a length.
- **American spelling** (modeling, favor, optimization) — always use the British form.
- **Link dumps and forced cross-references.** Only link where the connection is real and helps the reader; a related-content sign-off is a curated pointer, not an SEO exercise.
- **Losing the reader in jargon.** Don't write for a fellow specialist. If a term needs a glossary, it needs a plain-language gloss instead.
