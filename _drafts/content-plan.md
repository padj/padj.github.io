# Blog content plan

Working briefs for the first run of posts. Not published — `_drafts/` is ignored by GitHub Pages.
Each brief: **Angle** (the hook) · **Outline** (the beats) · **Takeaway** (one line the reader keeps) · **Practicalities** (length, cross-links, call-to-action).

Balance to aim for: every post should carry a *human* thread (curiosity, a mistake, a story) even when its job is to *demonstrate ability*.

---

## Section 1 — The "unlikely path" (human hook)

### 1a. What modelling fish taught me about modelling patients
- **Angle:** Two systems that look nothing alike — elvers climbing an eel pass and patients moving through a care pathway — are the same modelling problem underneath. Lead with the surprise.
- **Outline:**
  1. Open on a concrete image: tiny eels failing to climb a pass, and the CFD-informed agent-based model that explained why (link the Royal Society Open Science paper).
  2. Name the shared skeleton: heterogeneous individuals + rules + an environment that pushes back = emergent system behaviour.
  3. Map it across: elver → patient; flow field → care pathway constraints; passage efficiency → treatment success/throughput.
  4. The honest limit: where the analogy breaks (people have agency, data, ethics; fish don't).
  5. Why this transfer is a strength, not a gimmick — modelling intuition is domain-portable.
- **Takeaway:** The hard part of modelling isn't the subject; it's seeing the system. That skill travels.
- **Practicalities:** ~900–1,200 words. Cross-link the eel-pass publication and your PhD thesis. Soft CTA: "this is the kind of cross-domain thinking I bring to health economics."

### 1b. How I went from aircraft wings to drug pricing
- **Angle:** A career-pivot story told honestly — what pulled you, what you feared, what surprised you. People hire people whose path they understand.
- **Outline:**
  1. The setup: aerospace MEng, topology optimisation for satellite parts with Airbus, then fluid–structure interaction — then "captivated by fish."
  2. The pivot moment (2021): why leave engineering/academia for pharma data science?
  3. What transferred instantly (numerical modelling, simulation, rigour) vs. what you had to learn fast (health economics, reimbursement, real-world data).
  4. The thing nobody warned you about — one candid surprise about the industry.
  5. Where it led: senior → principal → founding the operational research group.
- **Takeaway:** Non-linear careers compound rather than reset; the detours are the value.
- **Practicalities:** ~1,000 words. Cross-link About + CV. CTA: invite "thinking of a similar jump?" conversations — humanising and networky.

### 1c. Things engineering gets right that health economics could borrow (and vice versa)
- **Angle:** A friendly, slightly opinionated two-way comparison. Opinion is what gives a blog a pulse.
- **Outline:**
  1. Frame: you've lived in both fields, so you can compare without tribalism.
  2. 2–3 things engineering does well HEOR could steal (e.g. verification & validation culture, sensitivity analysis as default, modular model architecture).
  3. 2–3 things HEOR does well engineering rarely does (e.g. structured uncertainty/probabilistic thinking, decision-relevance over precision, stakeholder transparency).
  4. The synthesis: what a blended practice looks like — and that this is literally what an OR group is for.
- **Takeaway:** The best models borrow discipline from wherever it's strongest.
- **Practicalities:** ~1,000–1,200 words. Keep claims fair and caveated. CTA: positions the OR group's distinctive approach.

---

## Section 2 — Demystifying the craft (advertises ability without selling)

### 2a. What actually *is* a health economic model?
- **Angle:** The explainer a curious non-expert (or a new client) wishes existed. Plain language, no jargon walls.
- **Outline:**
  1. Start from the decision: someone has to decide whether a treatment is worth funding, under uncertainty.
  2. A model is a structured argument about the future, not a crystal ball.
  3. The core ingredients in plain terms: states/events, costs, outcomes (QALYs), time.
  4. One small worked intuition (no equations) — e.g. "treat now vs wait" framed simply.
  5. What separates a trustworthy model from a dangerous one.
- **Takeaway:** A model's job is to make reasoning explicit and challengeable — not to be "right."
- **Practicalities:** ~900 words. **Cross-link the podcast episode "What is a model? And when is it wrong?"** — they reinforce each other. CTA: link to publications as worked examples.

### 2b. Why a spreadsheet isn't a system: the case for systems thinking in healthcare
- **Angle:** Most models treat parts in isolation; healthcare is a system where the parts interact. Make the failure mode visceral.
- **Outline:**
  1. A relatable example where ignoring the system gives the wrong answer (e.g. a treatment that "saves money" but overloads a downstream service).
  2. What "systems thinking" actually means — feedback, delays, stocks and flows.
  3. System dynamics as a tool (your stated interest: dynamic prevalence prediction).
  4. When you *don't* need it — being honest about proportionality.
- **Takeaway:** Optimising a part can pessimise the whole; model the system, not the slice.
- **Practicalities:** ~1,000 words. **Cross-link podcast "Why healthcare decisions fail without systems thinking"** and "The hidden consequences of healthcare decisions." CTA: system-dynamics capability.

### 2c. Discrete event simulation, explained with a coffee shop queue
- **Angle:** Make DES tangible with an everyday queue before touching healthcare. Teaching-by-analogy = engaging + showcases skill.
- **Outline:**
  1. The coffee shop: customers arrive, baristas serve, queues form — model it in your head.
  2. Why an average ("we serve 100/day") hides the thing that matters (the lunch-time queue).
  3. Translate to healthcare: patients, clinics, capacity, waiting.
  4. What DES tells you that a cohort model can't.
  5. The cost of realism — when DES is overkill.
- **Takeaway:** Averages lie about systems with queues; simulation shows you the variation that hurts.
- **Practicalities:** ~900 words. Optional: a tiny diagram or R/Shiny demo link (ties to your Shiny skill). CTA: DES / capacity-modelling services.

### 2d. When is a model wrong? (And why that's the wrong question)
- **Angle:** Reframe the most common question clients/critics ask. Mildly provocative title earns the click.
- **Outline:**
  1. "All models are wrong, but some are useful" — start there, then go past the cliché.
  2. Wrong vs. not-useful vs. not-fit-for-decision — three different failures.
  3. How to actually interrogate a model: assumptions, validation, sensitivity, decision-relevance.
  4. A short story of a model you re-examined and what changed (links to the "human/honesty" thread).
- **Takeaway:** Ask "is it fit for this decision?" not "is it right?"
- **Practicalities:** ~900–1,100 words. **Cross-link podcast "What is a model? And when is it wrong?"** CTA: signals QC/validation rigour.

---

## Section 4 — Opinion / forward-looking (positions you as a thinker)

### 4a. AI in health economics: hype, harm, and the useful bits
- **Angle:** A measured insider's take that neither dismisses nor worships AI. Trust comes from balance.
- **Outline:**
  1. Cut through the noise: what people *mean* by "AI" in HEOR right now.
  2. Hype — claims that don't survive contact with reimbursement reality.
  3. Harm — real risks (opacity, spurious confidence, validation gaps in regulated decisions).
  4. The useful bits — where ML genuinely helps (your risk-prediction work; evidence synthesis; automation of grunt work).
  5. A principled stance on where the line should sit.
- **Takeaway:** AI earns its place in HEOR where it's validated and decision-relevant — not where it's fashionable.
- **Practicalities:** ~1,200 words. Ties to your stated interest in AI in health economics. CTA: thought-leadership; pairs with the OR group's positioning.

### 4b. Population ageing is a systems problem, not a budget line
- **Angle:** Challenge the framing that ageing is just "more spending." Argue it's a structural systems shift.
- **Outline:**
  1. The usual framing (cost line goes up) and why it's too shallow.
  2. Ageing as compounding feedback: multimorbidity, workforce, capacity, informal care.
  3. What systems/dynamic models reveal that static projections miss.
  4. Levers worth modelling — prevention, capacity redesign, sequencing.
- **Takeaway:** You can't budget your way out of a structural shift you haven't modelled as a system.
- **Practicalities:** ~1,100 words. Directly maps to your research interest (population ageing). Cross-link 2b. CTA: capacity/system-dynamics work.

### 4c. The healthcare-capacity questions we keep modelling badly
- **Angle:** A confident "here's what the field gets wrong" piece — your most direct expertise claim.
- **Outline:**
  1. Name 3–4 capacity questions that are routinely modelled poorly (e.g. ignoring variability, static assumptions, optimising one node).
  2. For each: why the common approach fails, and what better looks like.
  3. The through-line: capacity is dynamic and stochastic; most models treat it as neither.
  4. What good practice requires (DES, system dynamics, honest uncertainty).
- **Takeaway:** Better capacity decisions start with admitting capacity is a moving, variable target.
- **Practicalities:** ~1,100–1,300 words. Pulls together DES + system dynamics + your capacity-modelling interest. CTA: strongest direct services pitch of the set.

---

## Suggested publishing order
1. **1a (fish → patients)** — most distinctive opener; pure personality + ability.
2. **2a (what is a model?)** — evergreen explainer, cross-links the podcast.
3. **1b (aircraft → drug pricing)** — human, networky.
4. Then alternate one explainer (2b/2c/2d) with one opinion piece (4a/4b/4c) to keep variety.

## Cross-cutting notes
- Every Section 2/4 post has a natural **podcast cross-link** — use them; they compound reach.
- Keep a recurring **honesty thread** (a mistake, a limit, a surprise) — it's the "human element" you asked for.
- Reuse real artefacts as evidence: the eel-pass paper, thesis, NHANES/CPRD/HES work, R Shiny apps, the OR group's existence.
- Don't publish a visible "coming soon" placeholder — go live only once 2–3 posts exist.
