# Statistical Rethinking #3: Geocentric Models

Hosted by Richard McElreath

## Goals

1. Language for representing models
1. Calculate posterior distributions with multiple unknowns
1. Constructing, understandinng linear models

## Planets

Planets, or "wanderers," appear to reverse course in their orbits when you
track their positions. Why is this?

### Geocentric Model

> Prediction without causation.

Earth is the center of the universe. The planets are on epicycles, or "orbits
on orbits." Ptolemy and others were able to make correct observations using
this model.

Fails to predict other observations about the universe.

### Heliocentric Model

Earth's orbit is within Mars's. The perception of Mars on the galactic backdrop
_appears_ to reverse course.

## Comets

Giuseppe Piazzi was able to track a comet. Got sick and lost track. The hunt
was on to find it again. It was actually Ceres, a dwarf planet between Mars and
Jupiter, not on the same elliptical plane.

Carl Friedrich Gauss found it again! Used a normal error model, least-squares
estimation, and Bayesian arguments. The Gaussian distribution.

## Linear Regression

Mechanistically silent, or in other words can be applied to anything, so make
sure you are relating the model to real-world mechanisms. Useful when carefully
handled.

Special Cases

- ANOVA
- ANCOVA
- t-test

### Why Normal?

![Gaussian Distribution](../data/03_gauss.png){ width=33% }

1. Generative: Summed fluctuations tend towards Gaussian distributions.
1. Inferential: Mean and variance are best used with Gaussian (maxent).

> A distribution is considered to be least informative or maximally unbiased
> when it has the maximum entropy among all the distributions that satisfy a
> given set of constraints. In other words, it assigns equal probability to all
> events that are consistent with the constraints, and doesn't assign any
> probability to events that are not consistent with the constraints.
