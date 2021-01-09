---
jupytext:
  cell_metadata_filter: -all
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: '0.12'
    jupytext_version: 1.5.1
kernelspec:
  display_name: Matlab
  language: matlab
  name: matlab
---
# Forced oscillations

Our standard form for oscillators is

```{math}
:label: secondlin-unified-forced
x'' + 2 Z \omega_0\, x' + \omega_0^2\, x = f(t),
```

where again $\omega_0$ is the natural frequency, $Z$ is the nonnegative damping coefficient, and $f$ is a forcing function.

The most important type of forcing in applications is harmonic, as exemplified by $f(t) = \cos(\omega t)$. Let's start by using a trick of linearity. Define $g(t)=\sin(\omega t)$, and suppose that $w$ solves the ODE with forcing $f(t)+i g(t)$:

$$
\opA[w] = f + i g.
$$

We should expect $w$ to be complex-valued. If we break it into real and imaginary parts, so that $w(t)=x(t)+i y(t)$, then linearity tell us that 

$$
f+i g = \opA[x+i y] = \opA[x] + i \opA[y].
$$

The only way to make these identically true is if $\opA[x]=f$ and $\opA[y]=g$. In summary, we can "complexify" the original forcing $f$ to be $e^{i\omega t}$, solve the ODE, and then take the real part of that solution at the end.

One justification for doing this is that exponential forcing is the easiest kind to solve for. Using undetermined coefficients, we let $x_p(t)=Ae^{i\omega t}$ and insert it into the ODE with complexified forcing to get

$$
A e^{i\omega t} \bigl[ (i\omega)^2 + 2Z\omega_0(i\omega) + \omega_0^2 \bigr] = e^{i\omega t},
$$

so that

```{math}
:label: secondlin-coeff-complex
A = \frac{1}{\omega_0^2-\omega^2 + 2iZ\omega_0\,\omega}
= \frac{\omega_0^2-\omega^2 - 2iZ\omega_0\,\omega}{(\omega_0^2-\omega^2 )^2 + 4Z^2 \omega_0^2\,\omega^2 }.
```

In the last step above we multiplied numerator and denominator by the conjugate of the denominator. 

## Undamped

Things are beginning to get algebraically intense. We can ease off a bit by considering the undamped case, $Z=0$. Then the particular solution for $f(t)=e^{i\omega t}$ is

$$
\frac{1}{\omega_0^2-\omega^2} e^{i\omega t}.
$$

The real part of this gives an $x_p$ for $f(t)=\cos(\omega t)$, and the imaginary part gives $x_p$ for $f(t)=\sin(\omega t)$. We'll record just the cosine case for reference.

(formula-secondlin-nonresonant)=

````{part:formula} Undamped oscillator with $f(t)=\cos(\omega t)$
$$
x_p(t) = \frac{1}{\omega_0^2-\omega^2} \cos(\omega t), \qquad \omega \neq \omega_0.
$$
````

(More on the exceptional case $\omega=\omega_0$ in a moment.) The amplitude of $x_p$ grows without bound as $\omega\to \omega_0$.

The general solution is a combination of $x_h$, which oscillates at the natural frequency $\omega_0$, and $x_p$, which oscillates at the driving frequency $\omega$.

### Resonance

The [formula above](formula-secondlin-nonresonant) cannot account for the case $\omega=\omega_0$. This situation is known as {term}`resonance`. It's an idealization of pushing someone on a swing at *just* the right moment in each cycle.

Here the MUC as we know it breaks down and needs to be generalized, or we can use a limiting argument as suggested in {ref}`undertermined_coeffs`. Either way we end up with

(formula-secondlin-resonant)=

````{part:formula} Undamped oscillator with $f(t)=\cos(\omega_0 t)$
$$
x_p(t) = \frac{t}{2} \sin(\omega_0 t).
$$
````

We see that the amplitude of oscillations grows linearly forever. This physically unrealistic situation is ruled out when we put some damping back into the system.

### Near-resonance

The connection between nonresonant and resonant solutions is not as abrupt as it may seem. Suppose $\omega < \omega_0$ and the constants and initial conditions are chosen so that the nonresonant solution is

$$
x(t) = \cos(\omega_0 t) + \frac{1}{\omega_0^2-\omega^2} \cos(\omega t).
$$

Let's express the frequencies in terms of their average value $\overline{\omega}$:

$$
\omega = \overline{\omega} - \epsilon, \qquad \omega_0 = \overline{\omega} + \epsilon.
$$

Some trig identity manipulation leads to

$$
x(t) = 2 \cos(\epsilon t) \cos(\overline{\omega} t).
$$

This can be interpreted as oscillation at the average frequency inside an envelope that oscillates at frequency $\epsilon$, half the difference between $\omega_0$ and $\omega$. 
