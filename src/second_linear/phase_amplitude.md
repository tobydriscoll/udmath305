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
# Amplitude and phase

The exponential form of the general solution of a homogeneous second-order linear ODE is

```{math}
x(t) = c_1 e^{\lambda t} + c_2 e^{\overline{\lambda} t}, \qquad \lambda = a + i\omega, \, c_2=\overline{c_1}.
```

As before, we will appeal to the fact that $(\alpha+i\beta) + \overline{(\alpha+i\beta)} = 2\alpha$ to write this as

```{math}
:label: secondlin-combine-exp
x(t) = \Re \Bigl[ c_1 e^{(a+i\omega) t} \Bigr], \quad c_1 \in\complex, 
```

where we also absorbed the factor of 2 into $c_1$. In the [preceding section](complex_exp.md) we claimed that there is a complete equivalence between this form and combinations of enveloped cosine and sine,

```{math}
:label: secondlin-combine-sincos
x(t) = e^{at} \bigl[ a_1\cos(\omega t) + a_2\sin(\omega t) \bigr].
```

Equivalence in this context means that for every choice of complex $c_1$, you can find some $a_1$ and $a_2$ so that the expressions are identically equal, and vice versa.

<!-- There is a third equivalent form that might be the most readily interpreted. Let us write the complex value $c_1$ in polar form,

$$
c_1 = R e^{-i\theta}, \qquad R > 0,\, \theta \in [-\pi,pi).
$$

We introduced an extra minus sign here for future convenience, but it's not important. Now {eq}`secondlin-combine-exp` is in the form

$$
x(t) = R e^{-i\theta} e^{\lambda t} + \bigl[ \text{complex conjugate of the same thing} \bigr].
$$

As we saw before, adding $\alpha+i\beta$ to its conjugate gives $2\alpha$, so we may write

$$
x(t) = 2 \Re \Bigl[ R e^{-i\theta} e^{\lambda t} \Bigr].
$$

We manipulate the exponentials to get

$$
x(t) = 2 \Re \Bigl[ R e^{at} e^{i(\omega t -\theta)} \Bigr].
$$

The first two terms inside the brackets are real, and Euler's formula then implies

$$
x(t) = 2 R e^{at} \cos(\omega t -\theta).
$$

This is a cosine with exponentially changing amplitude and an arbitrary phase shift.  -->

There is a third equivalent form that can be useful in many contexts. Consider {eq}`secondlin-combine-sincos` with the new definitions

```{math}
:label: secondlin-combine-polar
a_1 = R \cos(\theta), \quad a_2 = R\sin(\theta) \qquad (R\ge 0),
```

so that

```{math}
x(t) = e^{at} \bigl[ R \cos(\theta) \cos(\omega t) + R\sin(\theta) \sin(\omega t) \bigr].
```

Using a sum-of-angles formula, we get

```{math}
:label: secondlin-combine-ampphase
x(t) = R e^{at} \cos(\omega t - \theta),
```

which we call the {term}`amplitude-phase form` of the solution. We collect all three forms together here.

````{proof:formula} Equivalent forms for 2nd order solutions
\begin{align*}
x(t) &= \Re \Bigl[ c_1 e^{(a+i\omega) t} \Bigr], \quad c_1 \in\complex, \\
x(t) &= e^{at} \bigl[ a_1\cos(\omega t) + a_2\sin(\omega t) \bigr], \quad a_1,a_2 \in \real, \\
x(t) &= R e^{at} \cos(\omega t + \theta), \quad R \ge 0, \: \theta \in (-\pi,\pi].
\end{align*}
````

```{note}
It doesn't matter whether we use $+\theta$ or $-\theta$ as the phase term. Switching just flips the sign of the numerical value of $\theta$.
```

Each form has two real arbitrary constants that can be uniquely determined by initial conditions.

::::{admonition} Example
:class: tip
Find a solution to $x''-2x'+5x=0$, $x(0)=5$, $x'(0)=-5$ in amplitude-phase form.

:::{dropdown} Solution

The characteristic polynomial $s^2-2s+5$ gives the eigenvalues $1\pm 2i$. We can write the solution as $x(t) = R e^{t} \cos(2 t + \theta)$ and apply the initial conditions to get

\begin{align*}
5 &= x(0) = R\cos(\theta), \\
-5 &= x'(0) = R[-2\sin(\theta) + \cos(\theta)].
\end{align*}

We can substitute from the first into the second and get

$$
-5 = -2R\sin(\theta) + 5,
$$

or $R\sin(\theta) =5$. Taking ratios with the first equation gives

$$
\frac{R\sin(\theta)}{R\cos(\theta)}  = \frac{5}{5} \quad \Rightarrow \quad \tan(\theta)=1,
$$

so we get $\theta=\pi/4$. Then $R=5/\cos(\pi/4)=5\sqrt{2}$. The final answer is

$$
x(t) = 5\sqrt{2} e^{t} \cos\left(2 t + \tfrac{\pi}{4}\right).
$$
:::
::::

## Conversion between forms

Each form of the solution has its own advantages. Sometimes, it's useful to be able to convert between them. We already have that {eq}`secondlin-combine-polar` connects {eq}`secondlin-combine-sincos` and {eq}`secondlin-combine-ampphase`, so we just need to connect the third form.

Say we are given {eq}`secondlin-combine-exp` and we use the polar form
$c_1 = \rho e^{i\phi}$. Then by Euler's identity,

<!-- 
```{note}
This equation uses the Greek letters $\rho$ (rho) and $\phi$ (phi).
``` 
-->

$$
\Re \left[ c_1 e^{(a+i\omega) t}  \right] = \rho e^{at} \Re \left[ e^{i\phi} e^{i\omega t}  \right] = \rho e^{at} \cos(\omega t + \phi).
$$

This is the amplitude-phase form, so in fact,

```{math}
:label: secondlin-combine-c1
c_1 = R e^{i\theta}
```

connects {eq}`secondlin-combine-exp` and {eq}`secondlin-combine-ampphase`.

Both {eq}`secondlin-combine-polar` and {eq}`secondlin-combine-c1` amount to the same thing, conversion between rectangular coordinates, like $c_1=\alpha+i\beta$ and $(a_1,a_2)$, and polar coordinates, $(R,\theta)$.

::::{admonition} Example (continued)
:class: tip
In the preceding example we found the solution

$$
x(t) = 5\sqrt{2} e^{t} \cos\left(2 t + \tfrac{\pi}{4}\right).
$$

This has $R=5\sqrt{2}$ and $\theta=\pi/4$, which corresponds to the point $(5,5)$ in rectangular coordinates. Therefore we may also write

$$
x(t) = e^{t} \bigl[ 5 \cos(2 t) + 5 \sin(2t) \bigr],
$$

and

$$
x(t) = \Re \Bigl[ (5+5i)  e^{(1+2i)t}  \Bigr].
$$

::::

::::{admonition} Example
:class: tip
Find the amplitude-phase form of $x(t)=-4\cos(3t) + 2 \sin(3t)$.

:::{dropdown} Solution
The polar form of the point $(-4,2)$ satisfies

$$
R^2 = 16+4=20, \qquad \tan(\theta) = \frac{2}{-4}.
$$

We see that $R=2\sqrt{5}$, and $\theta = \arctan(-1/2)$ should be in the second quadrant. It would have to be found numerically.
:::
::::

It's more common that we want to know the amplitude than the phase. If you do need a numerical value of $\theta$, make sure you use the "four-quadrant arctangent" on a calculator or computer.
