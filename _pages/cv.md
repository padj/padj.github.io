---
layout: archive
title: "CV"
permalink: /cv/
author_profile: true
redirect_from:
  - /resume
---

{% include base_path %}

## Work experience
* Apr 2024 - present: Principal Operational Researcher; HEOR
* Sept 2022 - Apr 2024: Principal Data Scientist; HEOR
* May 2021 - Sept 2022: Senior Data Scientist; HEOR
* March 2020 - May 2021: Assistant Lecturer in Aerospace Engineering; Coventry University
  
## Education
* MSc & PhD in Computational Fluid Dynamics & Agent-based Modelling, University of Leeds, 2020
* MEng in Aeronautical and Aerospace Engineering, University of Leeds, 2015

## Skills
* Consulting and problem solving
* Numerical modelling; inc. health economic modelling, simulation, DES, etc. 
* System dynamics (i.e. dynamic prevalence prediction)
* Machine learning (i.e. risk prediction), including neural-network-based risk equations
* Metamodelling and explainable AI (e.g. SHAP analysis)
* Infectious disease and vaccination modelling
* Genomic/newborn screening economic evaluation
* Healthcare capacity and delivery optimisation
* Experience with real-world data (NHANES, CPRD, HES)
* Early drug pricing, revenue forecasting, launch sequence optimisation
* Fully- and semi-parametric survival analysis
* R Shiny app development

## Awards
* Best Poster, Genomics England Research Summit 2026 — "Estimating the value of genomic newborn screening in England: A pragmatic threshold analysis"
* TOP Poster, EASL 2026 — "Clinical and humanistic burden of metabolic dysfunction-associated steatotic liver disease and metabolic dysfunction-associated steatohepatitis in the United States: a system dynamics model"

## Publications
  <ul>{% for post in site.publications reversed %}
    {% include archive-single-cv.html %}
  {% endfor %}</ul>
  
## Conferences, talks, and presentations
  <ul>{% for post in site.talks reversed %}
    {% include archive-single-talk-cv.html %}
  {% endfor %}</ul>
 
