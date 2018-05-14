---
layout: note
title: "Review"
chapter: "Review"
---
* TOC
{:toc}

We've spent a lot of time looking at trees in agonizing detail, so let's pull back and look at the forest for a moment.

## Classifications

We started with a gimmicky classification scheme:

* **F**irst order?
* **L**inear?
* **A**utonomous?
* **S**calar?
* **H**omogeneous?
* **I**VP?

Here are some key facts for various groupings of these traits.

* **FLS** Always solvable by an integrating factor.
* **LSI** Unique solution for continuous coefficients. 
* **LASH** Solvable by characteristic equation.
* **LS (constant coeffs)** Solve H case first, then add undetermined coefficients.
* **LS (constant coeffs)** Solvable by Laplace transforms, including steps and impulses.
* **fa** Can be transformed to FA in higher dimensions.
* **FLsH** Solve by eigenvalues and (maybe generalized) eigenvectors.
* **FLsHI** Solved by the matrix exponential.
* **FLsh** Solvable (in principle) by variation of parameters. 
* **FS** May be solvable by separation. 
* **Fl** Equilibria and their stability matter. 

As you can see, understanding what type of ODE you have is vital to choosing the right approach to it. Some problems do allow more than one approach, but often one is best. 

Linearity has dominated the discussion for two reasons: we can dissect (many) linear problems completely, and they influence every system through linearization.

## Polynomial roots

Again and again we have found polynomial roots to be the key to unlocking solutions of linear, constant-coefficient equations, in the guises of characteristic polynomials/Laplace transform poles/eigenvalues. Broadly speaking, there are always three outcomes:

* **Distinct real roots** produce combinations of the associated exponential functions.
* **Repeated real roots** introduce the secular term $te^{rt}$.
* **Complex conjugate roots** bring the associated complex exponentials, or an exponential of the real part with sin and cos of the imaginary part.

## Oscillators

Of particular importance are equations in the form $ay'' +by'+cy=g(t)$. Mathematically they fit into the frameworks we used for linear equations and are no particular challenge. However, oscillators are so important in numerous diverse areas of application that a lot of terminology sprang up to describe all the possible phenomena in detail:

* Forced/free equations, and forced/free responses.
* Undamped/underdamped/critically damped/overdamped oscillations.
* Natural frequency.
* Amplitude/phase representations.
* Transient and steady solutions.
* Frequency response, gain, and resonance.
* Transfer function and impulse response.

For mechanical mass-spring systems, we used the alternative notations $my'' + $\gamma y' + k y$, or equivalently $y'' + 2cy' + \omega_0^2 y$. 


## Models

A model is a mathematical statement that follows directly from first principles and/or precisely formulated assumptions. Typically the model dictates an ODE which is then solved or analyzed for insights about the modeled system. The solutions or simulations are precise conclusions about the mathematical model, but not necessarily about the underlying modeled system. As the statistician George Box famously put it, ["All models are wrong but some are useful."](https://en.wikipedia.org/wiki/All_models_are_wrong)


We have spent time on a few different models:

* Mixture (stirred tank) problems.
* Cooling/heating of objects.
* Populations.
* Mechanical oscillators.
* Interacting species. 





