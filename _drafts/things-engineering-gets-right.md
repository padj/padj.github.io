---
layout: single
title: "Things engineering gets right (that health economics could borrow)"
excerpt: "The companion to my earlier post: what the engineering world I came from does better than health economics — and the habits worth stealing."
tags:
  - modelling
  - health economics
  - engineering
  - operational research
# Before publishing: move to _posts/ as YYYY-MM-DD-things-engineering-gets-right.md
# and add: date: YYYY-MM-DD  /  permalink: /posts/YYYY/MM/things-engineering-gets-right/
# This is the SECOND of a two-part pair. The companion is "Things health economics gets right".
---

A little while ago I wrote about [three things health economics does better than engineering]({{ "/blog/" | relative_url }}) — uncertainty as the main event, decision-relevance over precision, and transparency for a non-technical audience. I promised a companion piece making the case in the other direction, because fair is fair, and because I genuinely believe the traffic runs both ways.

A quick reminder of where I'm standing. I spent the first half of my working life as an engineer, building simulations of fluids, structures, and — improbably — fish. I spent the second half building health economic models that help decide whether a treatment is worth funding. Crossing between the two has made me unusually aware of the habits each field takes for granted, and how often a habit that's second nature in one would be revelatory in the other.

So here's the return leg: three things the engineering world does genuinely well that health economics could learn from. As before, this isn't "my old field was better" — I've seen engineering produce both elegant work and expensive nonsense. It's a list of disciplines worth importing.

## 1. Verification and validation as a culture, not a chore

In engineering, "verification and validation" — V&V — is not an optional appendix tacked on at the end. It's a discipline with its own standards, terminology, and dedicated sceptics whose entire job is to try to break your model before reality gets the chance.

The distinction itself is worth stating, because it's sharper in engineering than in most fields:

- **Verification** asks *"did I build the model right?"* — is the thing I built a faithful implementation of the equations and logic I intended? Did the code do what the maths says?
- **Validation** asks *"did I build the right model?"* — does the model actually correspond to reality? Does it predict what really happens?

Both are treated as first-class work, with their own time and budget. A serious engineering model is expected to survive a deliberate, hostile attempt to falsify it: comparison against analytical solutions where they exist, against experimental data where they don't, against simplified limiting cases where neither is available. The default posture is *assume the model is wrong until it has earned trust.*

Health economics does validate — face validity, internal validity, cross-validation against trial data, external validation against independent datasets — and best practice is genuinely rigorous. But in my experience it's more often something done near the end of a project, under deadline pressure, than a structural habit built into how the model is constructed from day one. The consequence is that errors get found late, when they're expensive and embarrassing, rather than early, when they're cheap.

Borrowing engineering's instinct wholesale — treating "try to break this model" as a continuous activity owned by someone other than the person who built it — would catch a great many problems while they're still easy to fix. The cultural shift isn't "validate more." It's "assume you're wrong, and resource the search for the proof."

## 2. Sensitivity analysis as a reflex, not a deliverable

Ask an experienced engineer how sensitive a wing's behaviour is to a particular parameter, and they'll usually already know — not because they ran a formal study, but because they've been poking the model throughout its development. Nudge an input, watch the output, build intuition. By the time the model is finished, they have a feel for which inputs are load-bearing and which barely matter.

Health economics, interestingly, takes sensitivity analysis *more* seriously on paper. It's mandatory — reimbursement bodies require deterministic and probabilistic sensitivity analyses as a condition of submission. That's a real strength, and it's more formalised than anything in routine engineering practice.

But there's a subtle trap in that strength. Because sensitivity analysis is a required *output*, it can curdle into a box-ticking exercise: produced at the end to satisfy a checklist, presented as a tornado diagram in an appendix, and never actually used to *understand* the model. The engineering habit is the opposite — sensitivity exploration as a tool you reach for constantly, mid-build, to answer "what is this result actually driven by?"

The fix here isn't methodological; health economics already has better sensitivity machinery than engineering does. It's attitudinal. Use the tools you're already required to produce as instruments of understanding throughout development, not as evidence assembled after the fact. A model whose sensitivities you discovered on the last day is a model you defend; a model whose sensitivities you've felt the whole way through is a model you understand.

## 3. Modular architecture

Engineering models are typically built from interchangeable components. You can change the material model without touching the geometry. Swap the solver without rewriting the problem. Replace a turbulence model with a different one and rerun. The boundaries between parts are deliberate, and they're respected. This is partly culture and partly the tooling — much engineering simulation lives in environments that enforce modularity — but the effect is that models are reusable, independently testable, and survivable when a single assumption changes.

A great deal of health economic modelling is not like this, and the reason is largely the medium. When a model lives in a single sprawling spreadsheet — as so many do — structure and content bleed into each other. Change one structural assumption and you may find yourself editing forty interlinked cells across six tabs and quietly praying you caught them all. The model works, but it's brittle: hard to QC, hard to adapt, hard to hand to someone else, and hard to reuse on the next asset.

Good health economic modellers already fight for this — separating inputs from calculations from outputs, building in clear parameter sheets, increasingly reaching for scripted languages like R where modularity is natural rather than heroic. But it's still a fight against the grain of the dominant tool, rather than the path of least resistance it is in engineering. Borrowing engineering's structural instinct — build in components with clean interfaces, so that any one part can be changed, tested, or replaced in isolation — pays off every single time a model has to survive contact with a new question. And in this field, they always do.

## The synthesis

Lay this post beside its companion and the two lists turn out to be almost perfectly complementary. Engineering brings **structural rigour**: verification and validation as culture, sensitivity exploration as reflex, modular architecture. Health economics brings **decision discipline**: uncertainty as the main event, decision-relevance over precision, transparency for outsiders. A model built with both instincts would be unusually hard to fool *and* unusually easy to trust.

That blend isn't hypothetical for me — it's more or less why I now work in operational research within health economics rather than in either field alone. The value is precisely in importing the discipline of one world into the problems of another. The best models I've seen don't belong to a single tradition; they borrow whatever is strongest from wherever it lives.

If you build models in either field, I'll repeat the uncomfortable takeaway from the first post, because it cuts both ways: the habit you're proudest of is probably the one the other discipline would question first. That's worth sitting with. It's usually where the next improvement is hiding.

*If you're working on a problem that sits awkwardly between disciplines — capacity, simulation, value under uncertainty — that intersection is exactly what our operational research group exists for. Feel free to [get in touch]({{ "/about/" | relative_url }}).*
