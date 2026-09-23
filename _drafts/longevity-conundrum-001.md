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

Outline:

1. Define the longevity conundrum
	a) Ageing population means increased healthcare demand.
	b) Shrinking workforce means a shrinking tax base. 
	c) Therefore: must do more with less.
	d) The definition is then: "How can a shrinking workforce meet the care needs of a growing, ageing population?"
	
2. Context: This is a global issue - every country in the world is experiencing growth in the size and the proportion of older persons in their population (ref3). South Korea, in particular, is now a "super-aged" society (ref4), reflecting the potential future population distribution for most developed nations. For South Korea, this is coupled with the world's lowest fertility rates, meaning no new children are being born to supplement the population, and leading to the expectation that the Korean workforce is expected to halve over the next 40 years with the economy following a similar trajectory (ref4). 

3. If we narrow our focus to just the UK: The UK National Health Service (NHS) is already under immense pressure, and is struggling to meet targets for patient waiting times and quality of treatment (ref1). Accordingly, patient satisfaction is at an all-time low (ref2). Moreover, trends in life expectancy are rising, yet *healthy* life expectancy - that is, years spent in good health - has flatlined, meaning we're living more years in poor health, increasing demand for healthcare. 

What we did:
4. Quantify population distribution: We built an age- and sex-stratified dynamic population model of the UK, complete with births, deaths, and migration, in order to predict how the UK demographics will change in the future. 

[Placeholder for population pyramid figure (fig 2 from the poster].

5. We then quantified how healthcare resource usage (HCRU) may change with changing population distribution. We took established relationships between age and HCRU from the NHS SUS dataset (ref5), and applied them to our dynamic population. Similarly, we took existing UK government revenue and spending data by age and applied them to our dynamic population. Using this approach we can quantify the healthcare system and macroeconomic impacts of longevity on the UK. 

[Results from the deck]

Conclusion:
6. This is a known issue. The UK Economic Affairs committee recently published a report on [preparing for an ageing society](https://publications.parliament.uk/pa/ld5901/ldselect/ldeconaf/236/236.pdf). [Add some take away from that here]. 





References:
1. UK Department of Health & Social Care, ‘Performance of the health service in England: Secretary of State for Health and Social Care annual-report 2022 to 2023’, 2025 (accessed 14/04/2025)
2. Lord Darzi, ‘Independent Investigation of the National Health Service in England’, 2024, (accessed 17/04/2025)
3. WHO, https://www.who.int/news-room/fact-sheets/detail/ageing-and-health (accessed 17/04/2025) 
4. Morgan Stanley, https://www.morganstanley.com/ideas/south-korea-population-decline-ageing-crisis (accessed 17/04/2025)
5. NHS England, Secondary Uses Service Dataset, https://digital.nhs.uk/services/secondary-uses-service-sus (accessed 17/04/2025) 