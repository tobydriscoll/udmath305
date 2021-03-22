# Overview

We now introduce a new wrinkle into our ODEs: second derivatives. Together, first- and second-order ODEs comprise the overwhelming majority of differential equations used in mathematical models. To some degree this traces back to Newton's laws of motion; in $F=ma$, acceleration is the second derivative of position. In fact, $F=ma$ is the original justification for the term "forcing function" that we have used for a while, as it plays the role of an actual external force acting on a system.

First-order ODEs are all about growth and decay. Second-order ODEs add oscillation to the party. They also require us to update some of our theoretical understanding of the structure of solutions.

## Glossary

```{glossary}
amplitude–phase form
  Expression of a sum of sin-cos or onjugate complex exponentials as an amplitude times a cosine with phase shift.

angular frequency
  Expression of frequency as radians per second, as opposed to cycles per second; mathematical default sense of frequency.

beating
  Slow modulation of amplitude, characteristic of an oscillator being forced at a frequency near its natural one.

characteristic polynomial
  For a second-order linear ODE with constant coefficients, a quadratic polynomial whose roots indicate two exponential functions that form a basis for solutions.

characteristic values
  For a second-order linear ODE with constant coefficients, the roots of the characteristic polynomial.

constant-coefficient
  Linear ODE in which the multipliers of the dependent variable and its derivatives are constants.

critically damped
  Free oscillator at the level of damping between underdamped and fully exponentially decaying solutions.

damping coefficient
  Nondimensional, nonnegative value indicating the relative amount of damping present in an oscillator. Denoted $Z$.

free oscillator
  Naturally oscillating system not subjected to any external forces.

gain
  Ratio of the amplitudes of a particular solution and the harmonic forcing that produces it.

natural frequency
  Frequency at which an undamped free oscillator oscillates. Denoted $\omega_0$.

overdamped
  Free oscillator with sufficiently large damping that solutions are purely exponentially decaying, i.e., having no oscillations.

polar form
  Expression of a complex number as its magnitude times a value on the unit circle, as expressed by Euler's identity.

pseudoresonance
  Damped oscillator being forced at the frequency that produces maximal gain.

resonance
  Undamped oscillator being forced at its natural frequency, resulting in boundless linear growth in the amplitude of the solution.

second-order IVP
  Second order ODE plus initial conditions on the solution and its first derivative.

second-order ODE
  Ordinary differential equation that includes a second derivative (and no higher) of the unknown, dependent variable.

simple harmonic motion
  Pure sinusoidal motion of an undamped free oscillator.

spring constant
  Ratio of the restoring force of an ideal spring to the amount by which it is stretched from its neutral position.

underdamped oscillator
  Free oscillator with nonzero damping that forces the solution to zero, but not so large that it prevents all oscillation.

```
