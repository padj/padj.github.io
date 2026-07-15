---
layout: single
title: "What modelling fish taught me about modelling patients"
excerpt: "Elvers climbing a fish pass and patients moving through a care pathway are the same modelling problem underneath. Here's what an eel taught me about healthcare."
tags:
  - modelling
  - health economics
  - engineering
  - operational research
# Before publishing: move to _posts/ as YYYY-MM-DD-fish-to-patients.md
# and add: date: YYYY-MM-DD  /  permalink: /posts/YYYY/MM/fish-to-patients/
---

Picture a young eel — an elver, a few centimetres long — trying to climb a fish pass: a sloped channel built past a weir so migrating fish can get upstream. Most of the time it fails. It's swept back, tries again, fails again, and either eventually finds a route through or gives up and dies within reach of the water it needed. Multiply that elver by a few thousand, add a CFD-derived flow field describing exactly how the water moves through the structure, and you have the model I spent the first half of my career building: an [individual-based model of juvenile eel movement](https://royalsocietypublishing.org/doi/full/10.1098/rsos.191505), used to explain why some fish pass designs let elvers through and others quietly kill a migration.

I don't think about eels much anymore. But I think about that model constantly, because it turns out to be the same model I build now — just with the fish replaced by patients, and the weir replaced by a waiting list.

## The shared skeleton

Strip away the domain-specific language and both problems have an identical structure:

- **Heterogeneous individuals.** Not every elver is the same size, strength, or starting position — and that variation matters enormously to the outcome. Not every patient has the same disease severity, comorbidities, or starting point in a pathway — and that variation matters just as much.
- **Rules governing behaviour.** An elver responds to the hydraulic stimuli it senses: it turns toward slower flow, pushes harder against stronger currents up to a point, then gives up. A patient moves through a pathway according to clinical rules, referral criteria, and capacity constraints: triaged, treated, discharged, or made to wait.
- **An environment that pushes back.** The flow field doesn't care how tired the elver is; it's shaped by the structure's geometry and the water discharge on the day. A care pathway doesn't care how much a patient wants treatment; it's shaped by clinic capacity, staffing, and everyone else in the queue at the same time.

Put those three ingredients together — heterogeneous individuals, rules, and a pushback environment — and you get **emergent system behaviour**: outcomes that can't be read off any single individual's characteristics, because they only appear once you simulate the population moving through the constrained environment together. That's the object both models are actually trying to capture. Everything else is vocabulary.

## Mapping it across

| Fish pass | Care pathway |
|---|---|
| Elver | Patient |
| Flow field (velocity, depth) | Capacity constraints (staff, beds, appointment slots) |
| Passage attempt | Referral, admission, treatment episode |
| Passage efficiency | Treatment success / throughput |
| Pass geometry (slope, length) | Pathway design (referral criteria, care setting) |

The eel-pass work found that passage efficiency was highest for shallow slopes and low discharges — in other words, an elver's chance of success depends less on how strong or determined it is than on the shape of the environment it's forced through. That result should sound familiar to anyone who models healthcare capacity: a patient's chance of timely treatment often depends less on how sick they are and more on how the pathway ahead of them is designed and how loaded it happens to be that week. In both cases, the individual isn't really the lever. The structure is.

## Where the analogy breaks

I want to be honest about the limits, because this transfer is a strength precisely because it's specific, not because it's total.

Elvers don't have agency in any meaningful sense — they respond to hydraulic stimuli, full stop. Patients have preferences, fears, and the ability to decline treatment, delay a referral, or seek care elsewhere, and a model that pretends otherwise will mislead you. Elvers don't generate data about their own experience; patients (mostly) do, and that data carries consent, privacy, and equity obligations an eel pass never has to think about. And the stakes are different in kind, not just degree — a poorly designed fish pass costs a population its migration; a poorly designed pathway costs individual people their health, sometimes their life. Ethics has to sit inside the second model in a way it never needed to inside the first.

So the mapping in that table is a scaffold, not a substitution. It tells you where to *look* for structure — where the heterogeneity lives, where the constraints bind, where emergent behaviour will surprise you — but it doesn't tell you what to conclude. That still requires taking the domain seriously on its own terms.

## Why this is a strength, not a gimmick

It would be easy to read this as a cute after-dinner anecdote — "I used to model fish, now I model patients, funny how life goes." I don't think that's the interesting part. The interesting part is that the hard skill in both jobs was never really about fish, or about patients. It was about learning to see a mess of individuals, rules, and constraints as a *system*, and knowing which structural questions to ask before you write a single line of code: what varies between individuals and does it matter, what are the rules of movement, what is the environment doing to push back, and where will the emergent behaviour surprise you.

That skill is domain-portable in a way that's easy to underrate when you're inside a single field for long enough to forget you have it. Modelling intuition built on fish passes transferred, more or less intact, to healthcare capacity. My [PhD thesis](https://etheses.whiterose.ac.uk/28307/) spent years on the fish version of this problem before I ever touched a health economic model — and I'd argue that time wasn't a detour from the skill I use now. It was where I built it.

*If you're modelling a system where individuals, rules, and a pushing-back environment collide — capacity, pathways, anything that behaves like a population moving through constraints — that's exactly the kind of problem our operational research group exists for. Feel free to [get in touch]({{ "/about/" | relative_url }}).*
