---
layout: single
title: "What actually is a health economic model?"
excerpt: "The explainer I wish existed before I had to learn this the hard way: what a health economic model is, what it isn't, and how to tell a trustworthy one from a dangerous one."
tags:
  - modelling
  - health economics
  - operational research
# Before publishing: move to _posts/ as YYYY-MM-DD-what-is-a-health-economic-model.md
# and add: date: YYYY-MM-DD  /  permalink: /posts/YYYY/MM/what-is-a-health-economic-model/
# Cross-link the podcast episode "What is a model? And when is it wrong?" (shaping-the-future-005)
---

Every so often someone asks me what I actually do, and "health economic modelling" is the kind of phrase that ends a conversation rather than starting one. So here's the explainer I wish someone had handed me before I had to work it out from the inside: what a health economic model is, in plain language, no jargon walls, aimed at a curious non-expert rather than a fellow modeller.

## Start from the decision

Every health economic model exists because somebody, somewhere, has to make a decision under uncertainty: should the health system pay for this new treatment? Is it worth funding, given everything else that money could do instead? That decision has to be made whether or not perfect information exists — a committee can't simply wait for certainty, because patients need an answer now, and the budget is finite regardless.

A health economic model is the tool built to make that decision *reasoned* rather than *guessed*. It takes what's known — trial results, cost data, disease progression evidence — and what's uncertain, and turns it into an estimate of whether a treatment is likely to be worth its cost, and how confident we can be in that answer.

## A model is a structured argument, not a crystal ball

The most important reframe I can offer is this: a model is not a prediction machine. It doesn't claim to know the future. It's a **structured argument** about the future — an explicit, checkable chain of reasoning that says "if these things are true, then this is the consequence for cost and health outcomes." Every assumption in that chain is written down, every input can be challenged, and every step from input to conclusion can be traced and re-run.

That's a very different object from a crystal ball, and the difference matters. A crystal ball asks you to trust it. A structured argument asks you to *inspect* it — and a model that can't survive inspection has failed at its actual job, regardless of how sophisticated it looks.

## The core ingredients, in plain terms

Underneath the jargon, almost every health economic model is built from the same handful of pieces:

- **States and events.** A simplified map of what can happen to a patient over time — well, unwell, on treatment, in hospital, recovered, or worse. The model tracks people moving between these states.
- **Costs.** What each state or event costs the health system — a drug, a hospital stay, a GP visit, an ongoing complication.
- **Outcomes.** Usually measured in QALYs — quality-adjusted life years — a single number that tries to capture both *how long* someone lives and *how well*, so that very different treatments (one that extends life, one that improves daily functioning) can be compared on the same scale.
- **Time.** Almost nothing in health happens instantly. Models have to represent how states, costs, and outcomes play out over months, years, sometimes a lifetime — and time is where uncertainty compounds fastest.

Put those four together and you can answer the underlying question: does this treatment produce enough extra health, for an acceptable extra cost, to be worth funding compared with what happens today?

## A small worked intuition: treat now vs. wait

No equations, just the shape of the reasoning. Imagine a treatment that works better the earlier it's given, but also carries a small risk of side effects. "Treat now" gets the benefit early but exposes everyone to that risk immediately. "Wait and see" avoids the risk for people who would have recovered anyway, but means some people miss the window where the treatment would have helped most, and arrive at treatment sicker.

Neither option is free of downside; the model's job is to trace both paths forward — who benefits, who's harmed, what each path costs the system — and add up which path produces more health for less cost, on average, across everyone who could receive either decision. That's it. That's the shape of the argument underneath almost every health economic model, however elaborate the actual mathematics gets.

## What separates a trustworthy model from a dangerous one

This is the part that actually matters, and it isn't about how advanced the mathematics is. A dangerous model is one where the assumptions are hidden, the uncertainty is hidden, or the conclusion is presented as more certain than the evidence supports. A trustworthy model is one where:

- The assumptions are stated plainly enough that someone outside the modelling team could find and challenge them.
- The uncertainty is shown, not smoothed away — a model that reports a single number with no sense of how much that number could move is hiding the most important part of the answer.
- The structure is proportionate to the decision — neither so simple it misses what matters, nor so elaborate that nobody outside the team can check it.
- It's been tested against reality wherever reality is available, and the limits of that testing are disclosed rather than glossed over.

None of that requires the model to be "right" in some absolute sense — no model is, and claiming otherwise is itself a warning sign. It requires the model to make its reasoning explicit and challengeable, so that the person making the real-world decision can see exactly what they're trusting and why.

*I go into this in more depth — including when a model is actually wrong, versus just uncertain — on the podcast episode ["What is a model? And when is it wrong?"](https://open.spotify.com/episode/0DwTFKASnGXPrijEyWWZgq). If you'd like to see the argument-not-crystal-ball idea applied to a real decision, our [publications]({{ "/publications/" | relative_url }}) are worked examples of exactly this kind of structured reasoning in practice.*
