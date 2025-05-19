---
title: "Use of metamodels in health economics to bypass complexity and democratize modelling"
collection: talks
type: "Talk"
permalink: /talks/2025-05-15-Metamodelling-007
venue: "ISPOR US 2025"
date: 2025-05-15
location: "Montréal, Quebec, Canada"
---

This study outlines the potential usage of neural-network-based metamodels within health economics.

---

Abstract: OBJECTIVES: 
All models, of necessity, simplify. However, the ability to incorporate and retain complexity is a requirement to ensure face validity and increase the accuracy of modelled outcomes. Model complexity impacts on the transparency of the underlying coding and increases run-times and hardware requirements. We demonstrate the utility of metamodeling to reduce computational burden and facilitate increased accessibility to complex models. A dynamic prevalence model of CKD was developed in R based on a system of ordinary differential equations (ODEs). A training and test sets of 20,000 and 10,000 model runs, respectively, were generated using Latin hypercube sampling, based on the variance of three model parameters, and used to fit a neural network based on mean absolute percentage errors (MAPE) between model and metamodel results. The resulting metamodel reduced the underlying ODEs to a series of linear algebraic expressions. Results, run-times and hardware requirements for the two models were compared. The metamodel was able to accurately recreate the results of the underlying model (overall MAPE in training: 0.178%, overall MAPE in testing: 0.139%, worst scenario fit in testing: 0.427%). In testing, the metamodel was significantly faster than the original model (31 times faster for a single run). Metamodels can reduce the computational burden of models on the end-user enabling, for example, the development of real-time dashboards for complex simulation models or broader value messaging. Similarly, the use of neural networks for metamodeling reduces complex models to a series of linear algebraic equations facilitating their usage in software such as Excel and enabling direct mathematical optimisation. This approach also enables the use of interpretable machine learning techniques, such as SHAP analysis, to increase transparency of the metamodel results. Each of these contributes to the democratization of knowledge and value messaging.  

Lay abstract: All models simplify reality with the intention of generating insights and can be thought of as a trade-off between simplicity and accuracy. Too simple, and they won't be accurate enough to produce useful insights. Too complex and they won't be accessible enough to be useful. Metamodels (models of models) offer a potential way of simplifying a complex health economic model to give the best of both worlds.

Recommended citation: Vodyanov, A., Padgett, T., McEwan, P. (2025) Use of metamodels in health economics to bypass complexity and democratize modelling. ISPOR US 2025, 15 May 2025; Presentation.