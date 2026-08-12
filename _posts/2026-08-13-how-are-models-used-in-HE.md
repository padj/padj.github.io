---
layout: single
title: "How are models used in health economics?"
excerpt: "Having defined what a model is, let's discuss how models are used in health economics and the questions they are designed to answer."
tags:
    - modelling
    - health economics
    - operational research
---

In a [previous post]({{ "/what-is-a-model/" | relative_url }}) I discussed how I would define what a model actually is. The answer I landed on was pretty vague:

> **A model is a simplified representation of reality, designed for a specific purpose.**

So let's now narrow the focus and turn our attention to something more specific - health economic models and the questions they help answer.

## Why health economics needs models

Every health economic model exists because someone has to make a decision. For example, should the health system pay for this new treatment, given everything else the same money could do instead? Decisions cannot wait for perfect information, so we create models to help characterise 'what if' scenarios whether or not the evidence is complete.

It's also important to consider that all resources are finite, e.g. drug budgets. They may seem obvious, but what isn't necessarily as obvious is that a finite budget means every "yes" in the system is an implicit "no" elsewhere. Money spent on one treatment is money not spent on another. So the real question in health economics is rarely "does this work?" but "does this work well enough, for the cost, to be worth choosing over the alternative?"

A model helps turn that question from a guess into a reasoned argument - its output is not a prophecy but a structured argument of the form *if these inputs and assumptions hold, then this follows*. What changes in health economics is what we feed into that argument, and what we ask it to tell us.

## A glossary of the jargon

Health economics, as is the case with every other industry, has an unfortunate fondness for TLAs: three-letter acronyms. In terms of modelling, it's tempting to assume each describes a wildly different thing, but they mostly don't. They describe the same basic idea, comparisons of costs and consequences, but pointed at different questions. The useful way to tell them apart is not by their mathematics but by what each is built to answer.

| Model type | The question it answers |
| --- | --- |
| Cost-of-illness (COI) | How big is the problem? |
| Budget impact model (BIM) | Can we afford to introduce it? |
| Cost-offset model (COM) | Do the savings elsewhere pay some of it back? |
| Cost-minimisation analysis (CMA) | What is the cheapest way to the same outcome? |
| Cost-effectiveness model (CEM) | Is the extra health worth the extra cost? |

These run roughly from simplest to most involved, so I will take them in that order.

## Cost-of-illness: how big is the problem?

The simplest models compare nothing at all. A cost-of-illness (or burden) model asks what a disease costs — to the health system, to the wider economy, sometimes to patients and their families — and how that burden falls. There is no new treatment in the picture yet; the model is sizing the problem.

That won't tell you what to do, and it isn't something a body like NICE appraises. But it provides important context for everything that comes after it — the difference between "this condition affects a lot of people" and a defensible number. That number is often what motivates a submission in the first place.

## Budget impact: can we afford it?

Let's say that a trial has read out and the new treatment does look worthwhile. A budget impact model asks the blunt question that other models quietly ignore: what happens to the actual budget if we use it across the whole eligible population over the next one to five years?

This is mostly careful arithmetic — how many patients, at what price, displacing what — but it is the arithmetic that keeps a decision honest. A treatment can be excellent value per patient and still land as an unaffordable lump on a fixed annual budget. In England this has teeth: NICE operates a **budget impact test**, and a treatment expected to cost the NHS more than £20 million in any of its first three years can trigger commercial talks with NHS England about how it is introduced. Good value and affordable are different claims, and the budget impact model checks the second.

## Cost-offset: do the savings pay some of it back?

A close relative asks a slightly different question: when we spend on a treatment, what do we *stop* spending elsewhere? A drug that keeps people out of hospital, or delays an expensive complication, offsets part of its own treatment cost through savings elsewhere in the system.

A cost-offset model quantifies those savings. It rarely settles a decision on its own, but it can often help to reframe one - the headline figure for the budget impact looks different once you count the admissions and procedures that are avoided. It reinforces the idea that where we draw the model's boundaries — e.g. which costs do we include? — changes the answer, just as discussed in the last post.

## Cost-minimisation: the cheapest route to the same outcome

Sometimes two treatments essentially do the same thing clinically. If we genuinely believe the health outcomes are equivalent, the comparison collapses to a single question: which is cheaper? That is cost-minimisation analysis, the simplest of the true comparisons because it only has to add up costs.

The catch is the assumption. "The outcomes are the same" is a strong claim which underpins the whole model, so cost-minimisation is only appropriate once clinical equivalence has been robustly established, e.g. via a head-to-head trial or via an indirect treatment comparison. When this assumption holds, the mathematics collapse to something very straightforward.

## Cost-effectiveness: is the extra health worth the extra cost?

This is the one most people probably mean by health economic modelling, and it is the core of how treatments are appraised. It's also the most complex and therefore the most interesting to work on. 

In a CEM, rather than assume outcomes are equal, we measure the difference in *both* cost and health and set them side by side. That needs the pieces I have skirted around so far:

- **Costs.** What each treatment and its consequences cost the system over time — the drug, the hospital stays, the ongoing care.
- **Outcomes.** How much *health* each treatment produces. This is measured in **QALYs**: quality-adjusted life years; a single number that captures both *how long* someone's life is and the *quality* of the life lived. This is what lets us compare a treatment that extends life against one that improves daily life on the same scale.
- **Time.** Almost nothing in health happens at once, so the model follows costs and outcomes over months, years, sometimes a lifetime.

Together these feed the headline result: the **incremental cost-effectiveness ratio, or ICER**. This is the extra cost per extra QALY associated with treatment A, as compared with treatment B. NICE's reference case is built on exactly this kind of cost-effectiveness analysis, and a treatment is broadly considered good value at somewhere around £20,000–£30,000 per QALY gained, with room to move for particularly severe conditions.

The shape of the reasoning is clearer without any equations. Imagine a treatment that works better the earlier it is given, but carries a small risk of side effects. Treating everyone now captures the early benefit but exposes everyone to the risk immediately; waiting spares that risk for people who would have recovered anyway, but means some miss the window and arrive sicker. Neither path is free of downside. The model's job is to follow both — who benefits, who is harmed, what each costs — and work out which produces more health for the money, on average, across everyone. That is the whole argument, however elaborate the mathematics on top of it becomes.

## Acknowledging the rest

That is not the full alphabet soup of three-letter acronyms, but they're the main ones. Others include cost-consequence analysis, and cost-benefit analysis. The former lays a range of costs and effects side by side without collapsing them into one ratio. The latter goes further and puts a monetary value on the health outcomes themselves. Both of these appear far less often in my own work, and I would not hold myself out as an authority on them — but it would be misleading to draw the map and quietly leave them off it.

## A note on structure, not just purpose

Everything above is about *what question* a model answers, but there's a second, separate axis: *how* it is built. For example, the same cost-effectiveness question can be answered with a simple decision tree, a Markov (state-transition) model, a partitioned survival model, or a discrete event simulation — running, very roughly, from simplest to most flexible. 

The choice of model structure is heavily dependent on the context of the question being answered. However, that choice deserves much more than a paragraph, so I will come back to each of these modelling approaches in their own posts rather than cram the detail in here. The podcast episode [What model do I use and why?]({{ "/podcast/shaping-the-future-006" | relative_url }}) is a good starting point in the meantime.

## How it all feeds a decision

Together, these models feed an overall narrative:
- Cost-of-illness says the problem is worth attention.
- Budget impact and cost-offset say that we can afford the proposed treatment.
- Cost-effectiveness argues the treatment is good value.

Different questions, different models, all feeding one decision from different perspectives.

The last thing worth saying is that the models don't make the decisions. In a process like NICE's, models provide evidence that is put in front of a committee. This evidence is then weighed alongside everything the models leave out — and a committee can only trust what it can inspect. Which is where the last post ended: the value of a model is not the number it produces, but that it makes its reasoning explicit enough to challenge. What did we assume? What is it sensitive to? What would change the answer?

*For the conversation behind this one — including when a model is wrong versus merely uncertain — listen to the podcast episode ["What is a model? And when is it wrong?"]({{ "/podcast/shaping-the-future-005" | relative_url }}). If you'd like to see these arguments made in practice rather than in the abstract, my [publications]({{ "/publications/" | relative_url }}) are worked examples of exactly this kind of reasoning.*
