---
layout: single
title: "Things health economics gets right (that engineering could borrow)"
excerpt: "I've built models in two very different worlds. Here's what health economics does better than the engineering field I came from — and what engineering could learn from it."
tags:
  - modelling
  - health economics
  - engineering
  - operational research
# Before publishing: move to _posts/ as YYYY-MM-DD-things-health-economics-gets-right.md
# and add: date: YYYY-MM-DD  /  permalink: /posts/YYYY/MM/things-health-economics-gets-right/
# This is the FIRST of a two-part pair. The follow-up is "Things engineering gets right".
---

I've now spent roughly equal halves of my working life in two fields that, on the surface, have almost nothing in common. In the first, I was an engineer: I built simulations of fluids, structures, and — for reasons that still surprise me — fish. In the second, I build health economic models that help decide whether a treatment is worth funding. Aerospace engineering and health economics don't share conferences, vocabulary, or dress code.

What they do share is the thing I actually do all day: build a model of something too complex to reason about by hand, and then trust it enough to make a decision with real consequences. And having crossed from one world to the other, I've been struck by how much each field could learn from the other's habits.

This post is about the direction people expect least. When I tell engineers I moved into health economics, there's sometimes a faint assumption that I traded "hard" modelling for something softer. That assumption is wrong, and this post is my argument for why. Here are three things health economics does genuinely better than the engineering I came from — habits I wish I could ship back across the divide.

*(I'll make the case in the other direction — what engineering does better, and what health economics should steal from it — in a follow-up post. Fair is fair.)*

## 1. Uncertainty is the main event, not an error bar

This is the one I'd most like to send back to engineering, so I'll start here.

In a lot of engineering, the workflow is deterministic by habit: take your best estimate of each input, compute the answer, apply a safety factor to cover what you don't know, and move on. That works beautifully when your inputs are well-characterised — the stiffness of a known alloy, the density of air at a known altitude. The uncertainty is real, but it's small and bounded, so a safety factor absorbs it.

Health economics doesn't have that luxury, and as a result it has built something more sophisticated. Here, uncertainty isn't a nuisance to be papered over with a margin — it's the central object of analysis. We don't ask "what is the cost-effectiveness of this treatment?" so much as "given everything we don't know, how confident can we be in the decision?"

That shows up in standard equipment that has no real engineering equivalent:

- **Probabilistic sensitivity analysis (PSA):** rather than running the model once with best-guess inputs, we assign each uncertain parameter a probability distribution and run the model thousands of times, producing a *distribution* of outcomes. The result isn't a number; it's a picture of how the decision behaves across the full range of what might be true.
- **Value of information analysis:** we can put a price on our own ignorance — quantifying how much it would be worth to run another trial and reduce a specific uncertainty before committing. That's a genuinely beautiful idea: reasoning formally about whether you know enough to decide yet.
- **Decision uncertainty itself as an output:** we report the probability that we've made the *wrong* call, not just the call.

An engineer's safety factor says "I'll build in slack to be safe." A health economist's PSA says "let me show you exactly how the decision changes as my assumptions change, and how often it flips." For messy, poorly-characterised problems — which describes most of the real world — the second instinct is far sharper. It's the difference between hiding uncertainty and interrogating it.

## 2. Decision-relevance over precision

Engineers — and I say this with affection, having been one — can fall in love with precision for its own sake. One more mesh refinement. One more decimal place on the drag coefficient. The model becomes a craft object, polished long past the point where extra polish changes anything that matters.

Health economics keeps asking a more disciplined question: *does this change the decision?*

It's a deceptively powerful filter. If a more elaborate model structure, a more granular cost breakdown, or another six months of data collection wouldn't change whether the treatment gets funded, then — however intellectually satisfying it might be — it isn't worth building. The model exists to serve a decision, not to be admired.

This keeps three things honest at once. It keeps **scope** honest: you build the simplest model that can answer the actual question. It keeps **effort** honest: you spend your time where it can change an outcome, not where it merely adds detail. And it keeps **communication** honest: you can always answer "why is the model like this?" with "because that's what the decision required," rather than "because I could."

I've come to think of it as a kind of professional humility built into the method. The question isn't "how good is my model?" — it's "is my model good enough for *this* decision, and how would I know?" Engineering has the technical sophistication to model almost anything to almost any fidelity; health economics has the discipline to ask whether it should.

## 3. Transparency for a non-technical audience

A health economic model often has to be explained to, and trusted by, people who will never open the file: clinicians, payers, reimbursement committees, sometimes patients. The people with the power to act on the model are frequently not modellers. That single fact has shaped the entire field for the better.

Because of it, health economics has developed real, hard-won skill at making assumptions explicit and reasoning legible to outsiders. Reference cases and reporting standards (the kind published by reimbursement bodies and methods groups) exist precisely so that a model's logic can be inspected, challenged, and reproduced by someone who didn't build it. "Trust me, the model says so" is not an acceptable answer. You have to show your working, and you have to show it to a sceptic who doesn't speak your technical language.

Engineering, by contrast, more often hands models from one specialist to another. The audience for a CFD simulation is usually another engineer who can read it on its own terms, so the field rarely has to clear the bar of explaining itself to a non-expert with veto power. That's not a criticism — it's just a different operating environment. But it means engineering has had less evolutionary pressure to make its reasoning transparent to outsiders.

Being forced to make your reasoning challengeable by someone outside your discipline is a feature, not a tax. It catches assumptions you'd stopped noticing. It exposes the places where you've substituted convention for justification. And it produces models that are trusted because they can be examined — not in spite of being unexaminable.

## The common thread

Look at the three together and they share a spine: health economics is organised around the *decision* and the *decider*, not around the model. Uncertainty matters because it changes decisions. Precision is rationed by whether it changes decisions. Transparency exists because someone outside the model has to own the decision. The model is never the point; it's an instrument for reasoning well under pressure, in public, about things that matter.

That's not soft. It's a different — and in many ways more demanding — kind of rigour than the one I trained in.

None of which means engineering has nothing to teach in return. It has plenty, and some of it is exactly the structural discipline that health economics most often lacks. That's the subject of the companion to this post — **"Things engineering gets right (that health economics could borrow)"** — which I'll publish next. If you build models in either world, I'd wager the habit you're proudest of is the one the *other* field would question first. That's usually where the next improvement is hiding.

*If you're working on a problem that sits awkwardly between disciplines — capacity, simulation, value under uncertainty — that intersection is exactly what our operational research group exists for. Feel free to [get in touch](mailto:).*
