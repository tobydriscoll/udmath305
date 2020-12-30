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
# Undetermined coefficients

Variation of parameters is all that we need for linear first-order problems, but as we have seen in some examples, it requires a fair amount of grunt work–in particular, two integrals. There is an easier path in the important special case when

1. The growth/decay rate coefficient $a(t)$ is constant, and
2. The forcing function $f(t)$ is a polynomial, exponential, sin, or cos, or a combination of these.

In this situation, we go through the same work as before to get the homogeneous part $x_h$, but a valid $x_p$ can be found without integration.

The correct form of $x_p$ for various manifestations of $f$ are given in [the table below](table-firstlin-MUC). The capital letters are considered unknown constants that have to be determined by plugging $x_p$ into the ODE. This is what gives the method its name, the {term}`method of undetermined coefficients`.

```{list-table} Particular solutions for the method of undetermined coefficients.
:header-rows: 1
:name: table-firstlin-MUC

* - $\underline{f(t)}$
  - $\underline{x_p(t)}$
* - $b_n t^n + \cdots b_0$
  - $B_n t^n + \cdots + B_0$
* - $e^{rt}(b_n t^n + \cdots b_0)$
  - $e^{rt}(B_n t^n + \cdots B_0)$
* - $\cos(\omega t)$
  - $A \cos(\omega t) + B \sin(\omega t)$
* - $\sin(\omega t)$
  - $A \cos(\omega t) + B \sin(\omega t)$
```

::::{admonition,dropdown,tip} Example
We have seen before that the homogeneous solution of $x'-4x=8t$ is $x_h=c_1 e^{4t}$. The [MUC table](table-firstlin-MUC) suggests that we choose $x_p=B_1t + B_0$. Plugging this into the ODE yields

$$
(B_1) - 4(B_1t + B_0) = 8t.
$$

This must be an identity for all $t$. Equating coefficients of like powers of $t$ on the two sides leads to the system

\begin{align*}
-4B_0 + B_1 &= 0, \\ 
-4B_1 &= 8,
\end{align*}

whose solution is $B_1=-2$, $B_0=-1/2$. Hence the general solution is

$$
x(t) = x_h(t) + x_p(t) = c_1 e^{4t} - 2t -\frac{1}{2}.
$$

This is the third time we have derived this solution.
::::

::::{warning}
As seen in the preceding example, the forcing function $f(t)=8t$ caused us to introduce $x_p(t) = B_1t + B_0$. We cannot assume that the constant term in $x_p$ is absent like it is in $f$, and indeed it is not in the final result.
::::

::::{admonition,dropdown,tip} Example
We solve

$$
x' = x - 6 \sin(t), \qquad x(\pi) = 0.
$$

We quickly see that the general solution of $x'-x=0$ is $x_h(t)=c_1e^t$. For the particular solution, [MUC table](table-firstlin-MUC) suggests

$$
x_p(t) = A \cos(t) + B \sin(t).
$$

Substitution into the ODE leads to

$$
(-A\sin(t) + B\cos(t)) - (A\cos(t) + B\sin(t)) = -6\sin(t).
$$

We could equate the coefficients of cos and sin to get a linear system. Or we can exploit the fact that this identity must be true at $t=0$ and $t=\pi/2$. The latter course gives us

\begin{align*}
B - A &= 0, \\ 
-A - B &= -6.
\end{align*}

This implies $A=B=3$, and therefore

$$
x(t) = c_1 e^t + 3\cos(t) + 3\sin(t).
$$

Finally, the initial condition yields

$$
0 = x(\pi) = c_1 e^\pi - 3 \quad \Rightarrow \quad c_1 = 3 e^{-\pi},
$$

hence

$$
x(t) = 3 e^{t-\pi} + 3\cos(t) + 3\sin(t).
$$
::::

The benefit of the MUC over our previous formulas is avoiding a second integral that often requires integration by parts when $f$ is a polynomial or trig function.

## Additive forcing terms

If the forcing function includes multiple different types of functions added together, then you can find particular solutions for the different terms separately and add them together to get the overall particular solution.

::::{admonition,dropdown,tip} Example
To find a particular solution of  $x'+3x=6t-4e^{-t}$, we can separately find them for the cases $x'+3x=6t$ and $x'+3x=-4e^{-t}$. In the first case we use $x_p(t) = B_1t + B_0$, and it works out that $B_1=2$, $B_0=-2/3$. For the second case we choose $x_p=A e^{-t}$ and plug in:

```{math}
-4e^{-t} = x'+3x = -A e^{-t} + 3A e^{-t},
```

which tells us that $A=-2$. Finally, a particular solution of the original equation is

```{math}
x_p(t) = 2t-\frac{2}{3}-2e^{-t}.
```

::::

## Breakdown

The suggestions in the [MUC table](table-firstlin-MUC) can fail if the forcing function includes the homogeneous solution $e^{at}$.

::::{admonition,dropdown,tip} Example
Consider $x'-ax=e^{at}$. We get $x_h=c_1e^{at}$, and the table suggests

```{math}
x_p = B_0 e^{at}.
```

Hence If we substitute it into the ODE, we get

$$
(aB_0 e^{at}) - a(B_0e^{at}) = e^{at},
$$

or $0=e^{at}$ for all $t$, which is impossible. The failure stems from the fact that $x_p$ is actually a solution of the homogeneous problem.
::::

The example above is a failure of the method, not a statement about the existence of the solution. There are advanced rules for fixing the method of undetermined coefficients in this circumstance, but it's simpler to fall back to variation of parameters than to muck around with them.
