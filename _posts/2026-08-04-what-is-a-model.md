---
layout: single
title: "What is a model?"
excerpt: "A model is a purposeful way of deciding what matters, what can be ignored, and what follows from the assumptions we make."
tags:
    - modelling
    - science
    - engineering
    - health economics
---

The word *model* appears everywhere in science, but I don't think it's ever that well defined. You may hear of people modelling the orbit of a satellite, or the spread of a disease, or maybe the strength of a bridge. You may have also heard of statistical models, computational models, physical models, or AI models. So what actually is a *model*?

> **A model is a simplified representation of reality, designed for a specific purpose.**

This definition has two key parts: 
1. A model is simplified - reality contains much more detail than can be practically captured in a model. 
2. A model has a purpose - the right model depends on what it's for. 

## A map is a model
Consider a map of a city. It is a simplified representation of reality (a city) and it has a purpose (navigation). It likely shows roads, rivers, railway stations, and other buildings. It's unlikely to show every single tree and bush. That doesn't mean it's a bad model - if you're trying to find your way from the train station to a particular building then those details are superfluous.

Now imagine you want to plan a route to run around this city, you may want more detail: e.g. footpaths, cycle paths, elevation data. In this case our original city map may no longer be suitable. That doesn't mean it's incorrect, just that it's the wrong model for this purpose. 

Scientific and mathematical models work in the same way. They leave things out on purpose. In fact, I would argue, as a modeller, that the decision of where the *bounds* of the model are, is the most important aspect of model building. The art is not to include everything; it is to leave out the details that do not matter for the *model's purpose* while keeping the features that do. This is a bit of an art as it's often difficult to know *a priori* what the model will and won't be sensitive to. 

I explored this idea in a very literal way in an outreach session: [what zombies can teach us about public health]({{ "/outreach/Oxford-IF-zombies" | relative_url }}): the audience could engage with a deliberately simplified zombie outbreak model, then see how the same reasoning applies to real public-health decisions.

## The ingredients of a model
Most models can be understood as a small collection of (likely overlapping) ingredients:

- **Purpose.** What are we trying to understand, predict, compare, or decide?
- **Bounds.** What is *inside* the model versus what is *outside* the model? 
- **Assumptions.** What does our model assume about the world?
- **Structure.** What are the components of our model and how are they connected?
- **Inputs.** What information does our model use?

Consider a simple model of transit time. The purpose might be to estimate the time required to walk from A to B. Now we could create a complicated model of biomechanics and aerodynamics to estimate walking speed based on the surface area and gait of a specific person. However, this is obviously unnecessarily complicated for our purpose, and it would be much simpler to assume an average velocity and distance. In this case our model becomes:

- **Purpose.** How long will my walk take?
- **Bounds. (e.g.)** Air resistance is not included in the model.
- **Assumptions. (e.g.)** Incline doesn't affect velocity. Traffic is negligible. 
- **Structure.** Mathematical/algebraic expression
- **Inputs.** Walking distance and average walking velocity. 

The model is useful because it is simple enough to calculate and the burden of inputs is small. However, if we intend to use this model to understand how long it takes passengers to move through an airport and where bottlenecks may form, it is unlikely to be sufficient. A model is never just a formula separated from context. Choosing between equations, simulations, and other approaches is itself part of modelling. The podcast episode [What model do I use and why?]({{ "/podcast/shaping-the-future-006" | relative_url }}) explores how that choice follows from the research question.

## Models as structured arguments
It is tempting to think of models as gospel: an infallible machine that produces an answer. However, a better way to think about it is as a structured argument:

> If the inputs and assumptions within our model are reasonable, and if these rules describe the important relationships, then this is what follows.

This may seem like it's verging on a politician's answer, but that conditional wording matters. The result of our model is only valid under the assumptions we've made. 

The most valuable habit modelling teaches is to make hidden choices visible. What exactly are we assuming? What evidence supports it? What would happen if it were wrong? What information would most improve the answer?

Those are not questions reserved for professional modellers. They are useful whenever someone presents a number, a forecast, or a confident conclusion. A model helps us move from "the model says so" to a more useful conversation about evidence, assumptions, consequences, and uncertainty.

So, what is a model? It is a purposeful simplification: a map of a system that helps us reason about a question. Its value is not that it reproduces the whole world. Its value is that it helps us see which parts of the world matter.

*For a conversation about this topic, including when a model is wrong and when it is still useful, listen to the podcast episode ["What is a model? And when is it wrong?"]({{ "/podcast/shaping-the-future-005" | relative_url }}). You can also read about [why healthcare decisions fail without systems thinking]({{ "/podcast/shaping-the-future-001" | relative_url }}), a related example of how the boundary around a model changes the answer it can give.*
