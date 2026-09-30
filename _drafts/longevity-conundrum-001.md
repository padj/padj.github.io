---
layout: single
title: "The longevity conundrum"
excerpt: "The longevity conundrum describes an ageing population and a shrinking tax base, meaning we must do more with less."
tags:
  - modelling
  - population-level
  - operational research
# Before publishing: move to _posts/ as YYYY-MM-DD-longevity-conundrum-001.md
# and add: date: YYYY-MM-DD  /  permalink: /posts/YYYY-MM-DD-longevity-conundrum-001.md/
---

### Outline

#### Define the longevity conundrum
	a) Ageing population means increased healthcare demand.
	b) Shrinking workforce means a shrinking tax base. 
	c) Therefore: must do more with less.
	d) The definition is then: "How can a shrinking workforce meet the care needs of a growing, ageing population?"
	
#### Context: This is a global issue 

Every country in the world is experiencing growth in the size and the proportion of older persons in their population (ref3). South Korea, in particular, is now a "super-aged" society (ref4), reflecting the potential future population distribution for most developed nations. For South Korea, this is coupled with the world's lowest fertility rates, meaning no new children are being born to supplement the population, and leading to the expectation that the Korean workforce is expected to halve over the next 40 years with the economy following a similar trajectory (ref4). There's quite a good, albeit sensationalised, video by [Kurzgesagt](https://www.youtube.com/watch?v=Ufmu1WD2TSk) on this topic.

#### UK implications

If we narrow our focus to just the UK: The UK National Health Service (NHS) is already under immense pressure, and is struggling to meet targets for patient waiting times and quality of treatment (ref1). Accordingly, patient satisfaction is at an all-time low (ref2). Moreover, trends in life expectancy are rising, yet *healthy* life expectancy - that is, years spent in good health - has flatlined, meaning we're living more years in poor health, increasing demand for healthcare. 

#### What we did:

Quantify population distribution: We built an age- and sex-stratified dynamic population model of the UK, complete with births, deaths, and migration, in order to predict how the UK demographics will change in the future. 

[Placeholder for population pyramid figure (fig 2 from the poster].

We then quantified how healthcare resource usage (HCRU) may change with changing population distribution. We took established relationships between age and HCRU from the NHS SUS dataset (ref5), and applied them to our dynamic population. Similarly, we took existing UK government revenue and spending data by age and applied them to our dynamic population. Using this approach we can quantify the healthcare system and macroeconomic impacts of longevity on the UK. 

[Results from the deck]

The results indicate that the UK is on a dire trajectory; increasing life expectancy, stagnating healthy life years, reductions in births, and a shrinking workforce cause overall net fiscal contributions to fall off a cliff. 

This multifaceted challenge will encourage a feedback loop of:

- **Reduced resource**, leading to
- **Deprioritisation of healthcare to economically active people**, leading to 
- **Reduced economic productivity**, leading to
- **Reduced taxbase and a reduced healthcare budget**, leading to
- **Reduced resource**, and the loop continues. 

This is unsustainable. This loop must be broken by exogeneous forces, such as repriorisation of economic resources, increased efficiency in healthcare delivery, or policy changes to ensure the robustness of the taxbase.  

#### Conclusion:
This is a known issue. The UK Economic Affairs committee recently published a report on [preparing for an ageing society](https://publications.parliament.uk/pa/ld5901/ldselect/ldeconaf/236/236.pdf). [Add some take away from that here]. 

Our predictions indicate that the status quo is unsustainable and that change is needed to correct the trajectory of UK healthcare in the context of an ageing population. 



#### References:
1. UK Department of Health & Social Care, ‘Performance of the health service in England: Secretary of State for Health and Social Care annual-report 2022 to 2023’, 2025 (accessed 14/04/2025)
2. Lord Darzi, ‘Independent Investigation of the National Health Service in England’, 2024, (accessed 17/04/2025)
3. WHO, https://www.who.int/news-room/fact-sheets/detail/ageing-and-health (accessed 17/04/2025) 
4. Morgan Stanley, https://www.morganstanley.com/ideas/south-korea-population-decline-ageing-crisis (accessed 17/04/2025)
5. NHS England, Secondary Uses Service Dataset, https://digital.nhs.uk/services/secondary-uses-service-sus (accessed 17/04/2025) 