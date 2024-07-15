---
title: 'Introduction to Genetic Algorithms'
date: 2024-07-31
permalink: /posts/2024/07/GA/
tags:
  - Optimisation
  - Heuristic
  - Genetic Algorithm
---

# Genetic Algorithms

## Definitions
Genetic algorithms (GA) are a form of evolutionary heuristic optimisation. They work by mimicking the nature's survival of the fittest; that is, rewarding the fittest individuals with reproductive rights and killing off underperformers. The general process for a GA is as follows:

- initial population
- assess fitness
- select reproducers
- create offspring
- mutate
- elitism
- exterminate
- repeat

% Flow diagram %


## Test function
Here we use the two dimensional Ackley function to demonstrate a simple genetic algorithm. This is a function that features multiple local optima, designed to test optimisation approaches. 

% Ackley function definition here %

% Plot of the Ackley function %


## Demonstrate a single iteration
1. Create the initial population
Plot the function with overlain initial population

2. Select those that are allowed to reproduce
Plot the function with overlain population, highlighting those selected.

3. Create offspring
Plot the function with overlain population, highlighting newly born.

4. Mutate offspring
Plot the function with overlain population, highlighting mutation of newly born.

5. Identify and retain the elites
Plot the function with overlain population, highlighting elite individuals.

6. Exterminate underperformers
Plot the function with overlain population, highlighting those tagged for extermination.


## Summary
Plot the function with overlain initial population, final population, and some in between.







