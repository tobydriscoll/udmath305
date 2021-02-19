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
x(t) = \exp\bigl[q(t)\bigr],
$$

for some $q(t)$ yet to be determined. Note that 

$$
x'(t) = q'(t) e^{\,q(t)} = q'(t) x.
$$

If this is to be a solution of $x'=ax$, all we need is that $q'(t)=a(t)$. This is solved by simple integration. To summarize:

(formula-firstlin-homogeneous)=

````{proof:formula} Solution of $x'=a(t)x$
$$
\begin{align*}
q(t) &= \int a(t) \, dt, \\
x(t) &= \exp\bigl[q(t)\bigr].
\end{align*}
$$
````

::::{admonition} Example
:class: tip
Solve $x'=\sin(t) x$. 

:::{dropdown} Solution
We integrate $a(t)=\sin(t)$ to get 

$$
q(t) = -\cos(t)+C.
$$

The general solution is thus $e^{\,q(t)}$, or 

```{math}
x_h(t) = e^C \exp[ -\cos(t) ] = c_1 \exp[ -\cos(t) ].
```
:::

::::

```{note}
As seen in the preceding example, the integration constant pops up additively in $q$ and then multiplicatively in $x$. You can ignore the integration constant until the end and then just tack it on; remember that by linearity, any constant multiple of a homogeneous solution is also a solution.
```

::::{admonition} Example
:class: tip
Solve the homogeneous IVP

$$
t x' = 2x, \quad x(2) = 12.
$$

:::{dropdown} Solution
First we rewrite the ODE as 

$$
x' = \frac{2x}{t},
$$

from which we see that $a(t)=2/t$. We first find the general solution by integration:

$$
x_h(t) = c_1 \exp\left[ \int 2t^{-1}\, dt \right] = c_1 \exp\bigl[2\ln(t)\bigr] = c_1 t^2.
$$

This is the general solution. To eliminate the integration constant, we apply the initial condition:

$$
12 = x_h(2) = c_1\cdot 2^2.
$$

Hence $x(t) = 3t^2$.
:::
::::

## Initial-value formula

We can take a shortcut in the case of a homogeneous IVP that avoids introducing an integration constant and then eliminating it. The trick is to use a definite integral to compute $q$, as in

$$
\tilde{q}(t) = \int_{t_0}^t a(s)\, ds.
$$

The advantage of doing so is that by its construction, $\tilde{q}(t_0)=0$. Therefore if we define

$$
x_h(t)= c_1\exp\bigl[\tilde{q}(t)\bigr],
$$

we find that $x(t_0)=c_1\exp(0)=c_1$.

(formula-firstlin-homogeneous-ivp)=

````{proof:formula} Solution of $x' = a(t)x,$ $x(t_0)=x_0$
$$
x(t) = x_0 \exp\left[ \int_{t_0}^t a(s)\, ds \right].
$$
````

::::{admonition} Example (continued)
:class: tip
We revisit the preceding example of

$$
x' = \frac{2x}{t}, \quad x(2) = 12,
$$

and apply the new formula to solve it:

\begin{align*}
x(t) &= 12 \exp\left[ \int_2^t 2s^{-1}\, ds \right] \\ 
&= 12 \exp\bigl[ 2\ln(t) - 2\ln(2) \bigr] \\ 
&= \frac{12t^2}{4}.
\end{align*}

This is the same result as before.
::::

<div style="max-width:608px"><div style="position:relative;padding-bottom:66.118421052632%"><iframe id="kaltura_player" src="https://cdnapisec.kaltura.com/p/2358381/sp/235838100/embedIframeJs/uiconf_id/43030021/partner_id/2358381?iframeembed=true&playerId=kaltura_player&entry_id=1_vx4rbh9b&flashvars[streamerType]=auto&amp;flashvars[localizationCode]=en&amp;flashvars[leadWithHTML5]=true&amp;flashvars[sideBarContainer.plugin]=true&amp;flashvars[sideBarContainer.position]=left&amp;flashvars[sideBarContainer.clickToClose]=true&amp;flashvars[chapters.plugin]=true&amp;flashvars[chapters.layout]=vertical&amp;flashvars[chapters.thumbnailRotator]=false&amp;flashvars[streamSelector.plugin]=true&amp;flashvars[EmbedPlayer.SpinnerTarget]=videoHolder&amp;flashvars[dualScreen.plugin]=true&amp;flashvars[Kaltura.addCrossoriginToIframe]=true&amp;&wid=1_yghngxn3" width="608" height="402" allowfullscreen webkitallowfullscreen mozAllowFullScreen allow="autoplay *; fullscreen *; encrypted-media *" sandbox="allow-forms allow-same-origin allow-scripts allow-top-navigation allow-pointer-lock allow-popups allow-modals allow-orientation-lock allow-popups-to-escape-sandbox allow-presentation allow-top-navigation-by-user-activation" frameborder="0" title="Kaltura Player" style="position:absolute;top:0;left:0;width:100%;height:100%"></iframe></div></div>
