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
# Variation of parameters

The [preceding section](homogeneous) explained how to find the general solution $x_h(t)$ of a homoegenous linear system $\bfA\bfx=\bfzero$. The next step of our [overall solution strategy](algorithm-firstlin-solve) is to find any particular solution of $\opA[x]=f$ for a given $f(t)$.

The form of the homogeneous solution is

$$
x_h(t) = c_1 g(t),
$$

where $c_1$ is an arbitrary constant and $g(t)$ is computed as the exponentiation of an integral. Let's see what happens if we replace the constant by an unknown function of $t$, $x_p(t)=k(t)g(t)$:

\begin{align*}
\opA[x_p] &= x_p' - a(t) x_p \\ 
& = (k'g+kg') - a k g \\ 
& = k'g + k(g'-ag) \\ 
&= k'g + k\cdot\opA[g].
\end{align*}

However, $g$ is itself a homogeneous solution, so all that remains is $k'g$. We therefore make $x_p$ a particular solution if we set $f=k'g$. This lets us solve for the unknown $k(t)$ by taking $k'(t)=f(t)/g(t)$ and integrating. The result is known as the {term}`variation of parameters` formula (or VoP formula for short). We collect all the equations here, including the homogeneous and general solutions.

(formula-firstlin-varpar)=

````{proof:formula} Variation of parameters
To find a particular solution $x_p$ of $\opA[x]=f$, compute
\begin{align*}
g(t) &= \exp\left[ \int a(t)\, dt\right], \\ 
k(t) &= \int \frac{f(t)}{g(t)}\, dt, \\
x_p(t) &= k(t)g(t), \\
x(t) &= c_1g(t) + x_p(t).
\end{align*}
````

:::{note}
The integration constants in the [VoP formula](formula-firstlin-homogeneous) can be ignored (i.e., set to zero), as they make no meaningful difference in the final result.
:::

(example-firstlin-nonhomog)=

::::{admonition,dropdown,tip} Example
Consider $3x'=12x+24t$. Rewriting it as $x'-4x=8t$, we identify $a(t)=4$ and $f(t)=8t$. Then

```{math}
g(t) = \exp\left[ \int 4\,dt \right] = e^{4t},
```

and

```{math}
k(t) = \int \frac{8t}{e^{4t}}\, dt = -\frac{1}{2} (4t+1)e^{-4t},
```

where you need integration by parts (or a computer) to perform the integral. Hence

```{math}
x_p(t) = \left[ \frac{1}{2} (4t+1)e^{-4t} \right] e^{4t} = -\frac{1}{2} (4t+1),
```

and the general solution is

```{math}
x(t) = x_h(t) + x_p(t) = c_1 e^{4t} - \frac{1}{2} (4t+1).
```
::::

::::{admonition,dropdown,tip} Example
To find a particular solution of $x'=2tx + 6t$, we start with

```{math}
g(t) = \exp\left[ \int 2t\, dt \right] = e^{t^2}.
```

Then we can compute

```{math}
k(t) = \int \frac{6t}{e^{t^2}}\, dt  = -3 e^{-t^2}.
```

Finally,

```{math}
x_p(t) = k(t) g(t) = -3,
```

and the general solution is $x(t)=c_1 e^{t^2}-3$.

(It should be clear that we needed a very special $f$ to make the second integral feasible. If not, try reworking it for $f(t)=6$ and you will quickly find yourself stuck, at least using only familiar functions.)
::::

::::{admonition,dropdown,tip} Example
We solve

$$
(2+t) x'= x - 1, \qquad x(0) = -5.
$$

First we put the ODE into our standard form,

```{math}
x' - \frac{1}{2+t} x = -\frac{1}{2+t}.
```

Then

```{math}
g(t) = \exp\left[ \int \frac{1}{2+t}\, dt \right] = \exp[ \ln(2+t) ] = 2+t.
```

Next,

```{math}
k(t) = \int \frac{-1}{2+t} (2+t)^{-1} \, dt = (2+t)^{-1},
```

so that the general solution is

```{math}
x(t) = c_1 (2+t) + (2+t)^{-1} (2+t) = c_1(2+t)+1.
```

Finally, we apply the initial condition to solve for $c_1$:

$$
-5 = x(0) = 2c_1+1 \quad \Rightarrow c_1=-3.
$$

Hence $x(t) = 1-3(2+t) = -5-3t.
::::

<!-- ## Initial-value problem

When $x(t_0)=x_0$ is given, the process of solving for $c_1$ in the general solution can be avoided. As with deriving [the formula for the homogeneous IVP](formula-firstlin-homogeneous), we use a definite inte
 -->
