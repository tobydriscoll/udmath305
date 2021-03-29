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

We now tackle the ODE

```{math}
:label: secondlin-forced-ode
x'' + bx' + cx = f(t),
```

where $f(t)$ is a nonzero forcing function. The first step is to find the general homogeneous solution $x_h(t)$. To finish the problem we must find a particular solution $x_p(t)$ in the forced case. The method of undetermined coefficients is the simplest strategy, when it is applicable: forcing in the form of a polynomial, exponential, or sin/cos.

The procedure is the same as for first-order problems. Using [our earlier table](`table-firstlin-MUC`), we make an educated guess at $x_p$ with some unknown coefficients that are determined through substitution into {eq}`secondlin-forced-ode`.

::::{admonition} Example
:class: tip
Find a particular solution of $x'' +4x'+4x=8t^2$. 

:::{dropdown} Solution

The correct form of $x_p$ is a quadratic polynomial, i.e.,

```{math}
x_p(t) = A + Bt + Ct^2.
```

Plugging that into the ODE yields

\begin{align*}
2C + 4(B+2Ct) + 4(A+Bt+Ct^2) & = 8t^2,\\
4C t^2 + (8C+4B) + (2C+4B+4A) & = 8t^2.
\end{align*}

This has to be an identity for all $t$. Matching like powers, we get a $3\times 3$ linear system for the coefficients. Fortunately, it can be solved easily if we go in order: first we read off $C=2$, then $B=-2C=-4$, and finally $A=-B-C/2=3$. This provides us with

$$
x_p(t) =2t^2+4t+3.
$$
:::
::::

<!--example>
Let's try for $y'' -2y'-3y=10te^{4t}$. For much the same reasons as in the last case, we try 
```{math}y_p = (A + Bt)e^{4t}```. There's nothing to do now except grind out some derivatives. 
\begin{align*}
8(2A+B+2Bt)e^{4t} - 2(4A+B+4Bt)e^{4t} -3 (A + Bt)e^{4t} & =10t e^{4t}\\
	8(2A+B) - 2(4A+B) -3A + t(16B-8B-3B) =  10t\\
\end{align*}. From this, by matching powers, we deduce $B=2$ and then $5A+12=0$. So $y_p = [2t - (12/5)]e^{4t}$.

</example-->

::::{admonition} Example
:class: tip
Find a particular solution of $x'' - 2x'-3x=10e^{4t}$. 

:::{dropdown} Solution
The proper choice is

```{math}
x_p(t) = Ae^{4t}.
```

Everything else is algebra.

\begin{align*}
16A e^{4t} - 2 (4A e^{4t}) - 3 (Ae^{4t}) & =10 e^{4t},\\
16A -8A -3A &=  10.
\end{align*}.

From this it's clear that $A=2$.
:::
::::

::::{admonition} Example
:class: tip
Find the general solution of $x''+x'=\sin(2t)$.

:::{dropdown} Solution
The homogeneous problem $x''+x'=0$ has roots $0$ and $-1$, hence

$$
x_h(t) = c_1 + c_2 e^{-t}.
$$

For the particular solution we must choose

```{math}
x_p(t) = A\cos(2t) + B\sin(2t).
```

Inserting this into the original ODE leads to

```{math}
[-4A\cos(2t) - 4B\sin(2t)] + [-2A\sin(2t) + 2B\cos(2t)] = \sin(2t).
```

This is identically true for all time if and only if we match the coefficients of like trig functions:

```{math}
-4A + 2B = 0, \qquad -4B-2A = 1.
```

The solution of these equations is $A=-1/10$, $B=-1/5$. Thus

$$
x(t) = c_1 + c_2 e^{-t} - \frac{1}{10}\cos(2t) - \frac{1}{5}\sin(2t).
$$
:::
::::

The examples above are the fundamental ones. There are rules for more intricate combinations of the same functions, but we won't go into them here.

We have to repeat the warning from the first time we saw this method: we have only used a subset of the complete rules, and thus occasionally it fails.

(secondlin-example-noMUC)=
::::{admonition} Example
:class: tip

The equation $x''+x=\cos(\omega t)$ suggests the particular solution $x_p(t)=A\cos(\omega t)+B\sin(\omega t)$. Upon substitution,

$$
[-\omega^2 A\cos(\omega t) - \omega^2 B\sin(\omega t) ] + [ A\cos(\omega t) + B\sin(\omega t)] =\cos(\omega t),
$$

which leads to the conclusion that $B=0$ and, if $\omega^2 \neq 1$, $A=1/(1-\omega^2)$. However, if $\omega = 1$, the substitution would leave us with $0=\cos(t)$, which is impossible to satisfy for all $t$.
::::

The failure of [the example above](secondlin-example-noMUC) at $\omega = 1$ was due to the fact that the $x_p$ we picked is actually a homogeneous solution. There are additional rules to cover this case, but we will resort to alternatives instead.

::::{admonition} Example (continued)
:class: tip
Here is one interesting workaround. Since the method works for all $\omega\neq 1$, we try taking a limiting value as $\omega\to 1$.

That won't work for the $x_p$ above, but we can subtract a homogeneous solution and still have a particular solution:

```{math}
\frac{ \cos(\omega t) - \cos(t) } {1-\omega^2}.
```

Then L'Hôpital applies in the limit to give us

```{math}
:label: secondlin-secular
x_p(t) = \frac{ -t \sin(\omega t) }{ -2 \omega } = \frac{1}{2}t\sin(t). 
```

This is easy to verify as a particular solution for $\omega=1$:

\begin{align*}
x_p & = \frac{1}{2}t\sin(t), \\
x_p' & = \frac{1}{2}[\sin(t)+t\cos(t)], \\
x_p'' & = \frac{1}{2}[\cos(t) + \cos(t) - t\sin(t)],
\end{align*}

so that $x_p''+x_p=\cos(t)$ as required.
::::

<div style="max-width:608px"><div style="position:relative;padding-bottom:66.118421052632%"><iframe id="kaltura_player" src="https://cdnapisec.kaltura.com/p/2358381/sp/235838100/embedIframeJs/uiconf_id/43030021/partner_id/2358381?iframeembed=true&playerId=kaltura_player&entry_id=1_cdce1r32&flashvars[streamerType]=auto&amp;flashvars[localizationCode]=en&amp;flashvars[leadWithHTML5]=true&amp;flashvars[sideBarContainer.plugin]=true&amp;flashvars[sideBarContainer.position]=left&amp;flashvars[sideBarContainer.clickToClose]=true&amp;flashvars[chapters.plugin]=true&amp;flashvars[chapters.layout]=vertical&amp;flashvars[chapters.thumbnailRotator]=false&amp;flashvars[streamSelector.plugin]=true&amp;flashvars[EmbedPlayer.SpinnerTarget]=videoHolder&amp;flashvars[dualScreen.plugin]=true&amp;flashvars[Kaltura.addCrossoriginToIframe]=true&amp;&wid=1_zj7687v8" width="608" height="402" allowfullscreen webkitallowfullscreen mozAllowFullScreen allow="autoplay *; fullscreen *; encrypted-media *" sandbox="allow-forms allow-same-origin allow-scripts allow-top-navigation allow-pointer-lock allow-popups allow-modals allow-orientation-lock allow-popups-to-escape-sandbox allow-presentation allow-top-navigation-by-user-activation" frameborder="0" title="Kaltura Player" style="position:absolute;top:0;left:0;width:100%;height:100%"></iframe></div></div>