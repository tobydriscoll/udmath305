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
# Operators

We now begin a close look at the linear case.

(definition-firstlin-linear-ode)=

````{proof:definition} First-order linear ODE
A {term}`first-order linear ODE` is an equation of the form

```{math}
:label: firstlin-linear-repeat
\dd{x}{t} = a(t) x + f(t).
```
We call $a(t)$ the {term}`coefficient function` and $f(t)$ the {term}`forcing function`. 

````

```{attention}
A linear ODE has a linear dependence on the unknown (dependent) variable $x$. It may have arbitrary dependence on the independent variable $t$. Also, the solution $x$ is usually not a linear function of $t$.
```

```{warning}
If presented with a linear ODE in the form $b(t)x' + c(t)x = g(t)$, you should divide through by $b$ and rearrange so that the equation is in standard form {eq}`firstlin-linear-repeat` if you want to apply one of our formulas.
```
There are some strong analogies between {eq}`firstlin-linear-repeat` and the linear algebraic system $\bfA\bfx=\bfb$. Some new notation helps to clarify the similarities.

(definition-firstlin-operator)=

````{proof:definition} Linear operator
A {term}`linear operator` $\opA$ is a rule for transforming functions to other functions, such that

\begin{align*}
\opA[cx(t)] & =c\opA[x(t)], \\
\opA[x(t) + y(t)] &= \opA[x(t)] + \opA[y(t)],
\end{align*}

for all functions $x,y$ and numbers $c$.
````

```{note}
You may recognize the two conditions in this definition as restatements of the [properties of a linear function](definition-linear). 
```

In this context we are interested in the operator

```{math}
:label: firstlin-linop
\opA[x] = x' - a(t)x,
```

whose linearity you can easily check for yourself against the definition. We can now express the ODE {eq}`firstlin-linear-repeat` simply as

$$
\opA[x]=f.
$$

::::{admonition} Example
:class: tip
The equation

$$
t x' = \sin(t) - x
$$

is linear. To write it in operator form, we rearrange to

$$
x' + \frac{1}{t}x = \frac{\sin(t)}{t}.
$$

Thus the linear operator for this ODE is $\opA[x]=x' + \tfrac{1}{t}x$, and the ODE is 

$$
\opA[x] =  \frac{\sin(t)}{t}.
$$
::::


## Homogeneous solutions

As with linear systems, we have a special role for the {term}`homogeneous` linear ODE $\opA[x]=0$, or

$$
\dd{x}{t} = a(t)x,
$$

which is {eq}`firstlin-linear-repeat` with zero forcing.

````{proof:theorem} Superposition
If $x_1(t), x_2(t),\ldots x_k(t)$ are solutions of $\opA[x]=0$, then so is any linear combination $c_1x_1 + \cdots + c_kx_k$ for constants $c_j$. 
````

````{proof:proof}
Because of linearity we can write

```{math}
\opA[c_1x_1 + \cdots + c_kx_k] = c_1\opA[x_1] + \cdots + c_k\opA[x_k].
```

By assumption, each $\opA[x_j]=0$. So the sum on the right is zero as well.
````

## General solutions

For the problem with nonzero forcing, we can follow the same script as for [general solutions of $\bfA\bfx=\bfb$](theorem-linalg-general) to get the following result.

(theorem-firstlin-general)=

````{proof:theorem}
All solutions of $\opA[x]=f$ may be written as

```{math}
x(t) = x_h(t) + x_p(t),
```
where $x_h$ is the general solution of $\opA[x]=0$ and $x_p$ is any particular solution of $\opA[x]=f$. We call this the {term}`general solution` of the linear ODE.
````

We have arrived at a solution strategy for $\opA[x]=f$.

(algorithm-firstlin-solve)=

````{proof:algorithm} Solution of a first-order linear ODE
1. Find the general solution $x_h$ of the associated homogeneous problem $\opA[x]=0$.
2. Find any particular solution $x_p$ of the original $\opA[x]=f$.
3. Add them.
4. If an initial condition is given, solve for the integration constant.
````

We elaborate on steps 1 and 2 in the next several sections.

<div style="max-width:608px"><div style="position:relative;padding-bottom:66.118421052632%"><iframe id="kaltura_player" src="https://cdnapisec.kaltura.com/p/2358381/sp/235838100/embedIframeJs/uiconf_id/43030021/partner_id/2358381?iframeembed=true&playerId=kaltura_player&entry_id=1_u906loy2&flashvars[streamerType]=auto&amp;flashvars[localizationCode]=en&amp;flashvars[leadWithHTML5]=true&amp;flashvars[sideBarContainer.plugin]=true&amp;flashvars[sideBarContainer.position]=left&amp;flashvars[sideBarContainer.clickToClose]=true&amp;flashvars[chapters.plugin]=true&amp;flashvars[chapters.layout]=vertical&amp;flashvars[chapters.thumbnailRotator]=false&amp;flashvars[streamSelector.plugin]=true&amp;flashvars[EmbedPlayer.SpinnerTarget]=videoHolder&amp;flashvars[dualScreen.plugin]=true&amp;flashvars[Kaltura.addCrossoriginToIframe]=true&amp;&wid=1_tqf4kfok" width="608" height="402" allowfullscreen webkitallowfullscreen mozAllowFullScreen allow="autoplay *; fullscreen *; encrypted-media *" sandbox="allow-forms allow-same-origin allow-scripts allow-top-navigation allow-pointer-lock allow-popups allow-modals allow-orientation-lock allow-popups-to-escape-sandbox allow-presentation allow-top-navigation-by-user-activation" frameborder="0" title="Kaltura Player" style="position:absolute;top:0;left:0;width:100%;height:100%"></iframe></div></div>
