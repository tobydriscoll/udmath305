# Solutions by transform

Faced with an initial-value problem, we can take the Laplace transform of the ODE and solve for $X(s)$, the transform of the solution. This part is fairly routine. Most of the effort comes in finding the inverse transform $x(t)$ corresponding to $X(s)$, for which there is no easy formula.

[The table below](table-steps-LT) summarizes the transforms we have learned so far. (We will add to it in the next chapter.) When faced with finding an inverse transform, the game is to manipulate the expression algebraically until it can be matched with one or more lines in the right column.

```{list-table} Laplace transforms (basic)
:header-rows: 1
:name: table-steps-LT

* - Function
  - Transform
* - $x(t)$
  - $X(s)$
* - $x'(t)$
  - $sX(s)-x(0)$
* - 1
  - $\dfrac{1}{s}$
* - $e^{at}$
  - $\dfrac{1}{s-a}$
* - $H(t-T)$
  - $\dfrac{e^{-sT}}{s}$
* - $H(t-T)f(t-T)$
  - $e^{-sT}F(s)$ (shift theorem)
* - $\delta(t-T)$
  - $e^{-sT}$
```

One major tool at our disposal is the *partial fraction decomposition* you probably learned for integrating rational functions.

::::{admonition} Example
:class: tip

Solve $x'-ax=e^{c t}$, where $a\neq c$ are constants.

:::{dropdown} Solution
Transforming both sides, we get

```{math}
[sX(s)-x(0)] - aX(s) =\frac{1}{s-c},
```

and thus

```{math}
X(s) = \frac{x_0}{s-a} + \frac{1}{(s-c)(s-a)}.
```

We can immediately recognize the first term as the transform of $e^{at}x_0$. To invert the transform of the second term, we need to express it using partial fractions. There is a general procedure for this, but it's worth knowing a simple mnemonic for this particular form:

```{math}
\frac{1}{(s-c)(s-a)} = \frac{1}{(a-c)(s-a)} + \frac{1}{(s-c)(c-a)}.
```

Thus the inverse transform of this fraction is a sum of two exponentials,

```{math}
x_p(t) = \frac{1}{c-a}\left( e^{ct}-e^{at} \right).
```

This is a particular solution that has $x_p(0)=0$. The general solution is $e^{at}x_0 + x_p(t)$.
:::
::::

We saw before that both steps and impulses in the forcing term lead to step functions in the solution. The next example shows how that fact fits with the [shift theorem](theorem-steps=shift).

::::{admonition} Example
:class: tip
Solve $x'=ax + \delta(t-T)$, with $x(0)=0$.

:::{dropdown} Solution
Transform the ODE to get

```{math}
[sX(s)-x(0)] - aX(s) = e^{-sT},
```

thus

```{math}
X(s) = \frac{e^{-sT}}{s-a}.
```

In a [previous example](example-steps-shift) we showed that the inverse transform of this is 

```{math}
x(t) = H(t-T)e^{a(t-T)}.
```
:::
::::

## Transfer function

Perhaps it's clear by now that

$$
x'-ax=f(t)
$$

always leads to

$$
X(s) = \frac{1}{s-a}\cdot F(s)
$$

as a particular solution. The term $1/(s-a)$ has a special name.

````{proof:definition} Transfer function, 1st order
For the first-order operator $\opA[x]=x'-ax$ with constant $a$, the function $1/(s-a)$ is called the {term}`transfer function` of the operator. The value $s=a$ is called a {term}`pole` of the transfer function.
````

The transfer function is a multiplier that "transfers" $F(s)$, the transform of the forcing function, to $X(s)$, the transform of a particular solution. The pole of the transfer function corresponds to an exponential solution in the original $t$ value.

The impulse response is the case when $f(t)=\delta(t)$, so that $F(s)=1$. This implies the following.

````{proof:theorem}
The transfer function of a linear operator is the Laplace transform of the impulse response of the operator.
````

<div style="max-width:608px"><div style="position:relative;padding-bottom:66.118421052632%"><iframe id="kaltura_player" src="https://cdnapisec.kaltura.com/p/2358381/sp/235838100/embedIframeJs/uiconf_id/43030021/partner_id/2358381?iframeembed=true&playerId=kaltura_player&entry_id=1_3jer9ite&flashvars[streamerType]=auto&amp;flashvars[localizationCode]=en&amp;flashvars[leadWithHTML5]=true&amp;flashvars[sideBarContainer.plugin]=true&amp;flashvars[sideBarContainer.position]=left&amp;flashvars[sideBarContainer.clickToClose]=true&amp;flashvars[chapters.plugin]=true&amp;flashvars[chapters.layout]=vertical&amp;flashvars[chapters.thumbnailRotator]=false&amp;flashvars[streamSelector.plugin]=true&amp;flashvars[EmbedPlayer.SpinnerTarget]=videoHolder&amp;flashvars[dualScreen.plugin]=true&amp;flashvars[Kaltura.addCrossoriginToIframe]=true&amp;&wid=1_p1aqkab1" width="608" height="402" allowfullscreen webkitallowfullscreen mozAllowFullScreen allow="autoplay *; fullscreen *; encrypted-media *" sandbox="allow-forms allow-same-origin allow-scripts allow-top-navigation allow-pointer-lock allow-popups allow-modals allow-orientation-lock allow-popups-to-escape-sandbox allow-presentation allow-top-navigation-by-user-activation" frameborder="0" title="Kaltura Player" style="position:absolute;top:0;left:0;width:100%;height:100%"></iframe></div></div>