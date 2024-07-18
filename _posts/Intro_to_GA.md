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

## Definition
Genetic algorithms (GA) are a form of evolutionary heuristic optimisation[link]. As such, they can be used to optimise any function, including those that are not continuously differentiable. Solutions to the function being optimised are called individuals and a collection of individuals is called a population. GAs work by mimicking nature's survival of the fittest; that is, rewarding the fittest individuals with reproductive rights and killing off individuals that are underperforming, where 'fitness' is determined based on the value of the function for the given solution. This causes the population to become fitter with each passing generation. 

A genetic algorithm has the following general structure:

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
Params: population size, bounds
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







