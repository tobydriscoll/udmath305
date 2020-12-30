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
# Homogeneous solutions

Step one of our [overall solution strategy](algorithm-firstlin-solve) is to solve the homogeneous problem $\opA[x]=0$, or

$$
\dd{x}{t} = a(t) x.
$$

Let's riff on the exponential solution we found with constant $a$ by guessing that

$$
x(t) = \exp[q(t)],
$$

for a $q(t)$ to be determined. Note that 

$$
x'(t) = q'(t) \exp[q(t)] = q'(t) x.
$$

If this is to be a solution of $x'=ax$, all we need is that $q'(t)=a(t)$. This is solved by simple integration. To summarize:

(formula-firstlin-homogeneous)=

````{proof:formula} Solution of $x'=a(t)x$
\begin{align*}
q(t) &= \int a(t) \, dt, \\
x(t) &= \exp[q(t)].
\end{align*}
````

::::{admonition,dropdown,tip} Example
To solve $x'=\sin(t) x$, we integrate $a(t)=\sin(t)$ to get 

$$
q(t) = -\cos(t)+C.
$$

The general solution is thus $\exp[q(t)]$, or 

```{math}
x_h(t) = e^C \exp[ -\cos(t) ] = c_1 \exp[ -\cos(t) ].
```
::::

```{tip}
As seen in the example, the integration constant pops up additively in $q$ and then multiplicatively in $x$. You can ignore the integration constant until the end and then just tack it on.
```

::::{admonition,dropdown,tip} Example
To solve the homogeneous IVP

$$
x' = \frac{2x}{t}, \qquad x(2) = 12,
$$

we first find the general solution by integration:

$$
x_h(t) = c_1 \exp\left[ \int 2t^{-1}\, dt \right] = c_1 \exp[2\ln(t)] = c_1 t^2.
$$

Then (since there is no forcing function, hence no particular solution to worry about) we apply the initial condition:

$$
12 = x_h(2) = c_1\cdot 2^2.
$$

Hence $x(t) = 3t^2$.
::::

## Initial-value formula

We can take a shortcut in the case of a homogeneous IVP. The trick is to use a definite integral to compute $q$, as in

$$
\tilde{q}(t) = \int_{t_0}^t a(s)\, ds.
$$

The advantage of doing so is that by construction, $\tilde{q}(t_0)=0$. Therefore if we define

$$
x_h(t)= c_1\exp[\tilde{q}(t)],
$$

we find that $x(t_0)=c_1\exp(0)=c_1$.

(formula-firstlin-homogeneous-ivp)=

````{proof:formula} Solution of $x' = a(t)x$, $x(t_0)=x_0$
$$
x(t) = x_0 \exp\left[ \int_{t_0}^t a(s)\, ds \right].
$$
````

::::{admonition,dropdown,tip} Example
We revisit

$$
x' = \frac{2x}{t}, \qquad x(2) = 12
$$

and apply the new formula:

\begin{align*}
x(t) &= 12 \exp\left[ \int_2^t 2s^{-1}\, ds \right] \\ 
&= 12 \exp[ 2\ln(t) - 2\ln(2) ] \\ 
&= \frac{12t^2}{4},
\end{align*}

which the same result as before.
::::

## Integration factor (optional)

There's an alternate way to derive the homogeneous solution above. 