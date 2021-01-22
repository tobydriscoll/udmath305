# Overview

In engineering applications one often wants to simulate abrupt changes, such as turning on a light switch or kicking a can. At some level things actually behave continuously. But when they happen over a short time scale, it may be mathematically cleaner to treat the change as discontinuous without having a significant effect on the solution. (Compare this to how complicated Riemann sums are compared to integration by antiderivatives.)

We will encounter two types of abrupt changes: steps, which represent permanent changes in circumstances, and impulses, which represent momentary changes that have lasting effects.

## Glossary

```{glossary}
delta function
  Alternate name for an impulse.

Heaviside function
  Alternate name for the Heaviside function.

impulse
  Idealized window function of infinitesimal duration and infinite amplitude.

impulse response
  Solution of a linear IVP with forcing applied over an infinitesimally short window.

Laplace transform
  Integral transformation of a function of time to another function of an abstract variable $s$.

pole
  Zero in the denominator of a rational function, corresponding to an exponential solution when appearing in a transform.

superposition
  Addition of partial solutions to a linear problem to get the complete solution.

transfer function
  Multiplier of the transform of a forcing function that produces the transform of a particular solution.

unit step function
  Function that is zero up to a specified time, then one thereafter.

window function
  Function that is one over a specific time interval and zero otherwise; expressible as the difference of two unit step functions.
```
