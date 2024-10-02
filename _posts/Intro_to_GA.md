---
title: 'Introduction to Genetic Algorithms'
date: 2024-10-02
permalink: /posts/2024/10/GA/
tags:
  - Optimisation
  - Heuristic
  - Genetic Algorithm
---

### Definition
Genetic algorithms (GA) are a form of evolutionary heuristic optimisation. This means they can be used to optimise any function, including those that are not continuously differentiable, but that they cannot ensure arrival at a global or local minima (or maxima). 

Solutions to the function being optimised are called individuals and a collection of individuals is called a population. GAs work by mimicking nature's survival of the fittest; that is, rewarding the fittest individuals with reproductive rights and killing off individuals that are under-performing, where 'fitness' is determined based on the value of the objective function using the given solution. This causes the population to become fitter with each passing generation. 

A genetic algorithm has the following general structure:

<p align="center">
![]("assets\images\GA_schematic.png")
</p>

### Test function
Here we use the two dimensional Ackley function to demonstrate a simple genetic algorithm. The Ackley function is defined mathematically as:

$$ f(x,y) = -20 \mathrm{e}^{-0.2\sqrt{0.5(x^2+y^2)}} -\mathrm{e}^{0.5(\text{cos}(2 \pi x) + \text{cos}(2 \pi y))} + \mathrm{e} + 20 $$

This is a function that features multiple local optima which tend toward the global optima at [0,0]; designed to test optimisation approaches.

<p align="center">
![]("assets\images\2D_Ack.png")
</p>

###  Demonstrate a single iteration
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







