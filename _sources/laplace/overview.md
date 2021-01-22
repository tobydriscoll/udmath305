# Overview

Earlier we [introduced](../steps/laplace.md) the Laplace transform, which converts a function of time $t\ge 0$ to a function of an abstract $s$. It turns differentiation into algebra and systematizes dealing with step functions and impulses.

Besides its use for hand-calculation of solutions of linear IVPs, the Laplace transform allows some interesting insight into the structure of those solutions. Transfer functions and convolutions are outgrowths of the transform that can be used as shorthand to express the properties of a linear ODE.

## Glossary

```{glossary}
impulse response
  Solution of a linear ODE with zero initial data, in the limit of an infinitestimally narrow spike forcing.

pole
  Complex value that is a zero in the denominator of a Laplace transform.

transfer function
  Multiplier of the transform of a forcing function that produces the transform of a particular solution.
```
