# Laplace transforms

There is a shorthand method for deriving the solutions of linear, constant-coefficient equations that have forcing functions such as steps, impulses, and elementary functions. Essentially, it is a trick for turning calculus into algebra.

Given (almost) any function $f(t)$, there is a doppelgänger function $F(s)$ defined by an integral.

(definition-steps-laplace)=

````{proof:definition} Laplace transform

The {term}`Laplace transform` of a function $f(t)$ is defined as

```{math}
:label: steps-laplace-def
\lx[f(t)] = F(s) = \int_0^\infty f(t) e^{-st}\, dt.
```
````

For the rest of this part of the text, time starts at $t=0$, and any reference to $f(t)$ for negative $t$ is defined to be zero.

```{attention}
A common convention is that a lowercase function of $t$ transforms to its uppercase namesake as a function of $s$. You should assume this unless told otherwise.
```

::::{admonition} Example
:class: tip

Use the definition of the Laplace transform to find $\lx[t]$. (Assume that $s$ is constrained in any way needed to make the integral converge.)

:::{dropdown} Solution
Using integration by parts,
\begin{align*}
\lx[t] & = \int_0^\infty t e^{-s t}\, dt  \\
& = \left[ -\frac{t e^{-s t}}{s} \right]_{t=0}^\infty + \frac{1}{s} \int_0^\infty e^{-s t}\, dt  \\
& = [0 - 0] + \frac{1}{s} \lx[1] \\
& = \frac{1}{s^2}.
\end{align*}
:::
::::

The following important fact is easily proved using familiar properties of integrals.

````{proof:theorem} Laplace transform linearity

The Laplace transform is a linear operator. That is,
\begin{align*}
\lx[ f(t) + g(t) ] = F(s) + G(s), \\
\lx[ c f(t) ] = c F(s),
\end{align*}

where $c$ is any constant.
````

## Derivatives

Applying integration by parts to the definition of $\lx[x'(t)]$ reveals the main reason Laplace transforms are useful in ODEs:

\begin{align*}
\lx[x'(t)] & = \int_0^\infty x'(t) e^{-st}\, dt \\
& = \left[ x(t)e^{-st}\right]_0^\infty - \int_0^\infty (-s) x(t) e^{-st}\, dt \\
& = -x(0) + s X(s).
\end{align*}

(formula-steps-laplace-diff)=

````{proof:formula} Transform of a derivative
$$
\lx[x'(t)] = s X(s) - x(0)
$$
````

::::{admonition} Example
:class: tip
Find the Laplace transform of the second derivative of a function: $\lx[x''(t)]$.

:::{dropdown} Solution
It's possible to do this by applying the integral definition of the Laplace transform. However, it's a lot easier to do by twice applying the known transform formula of the first derivative. Suppose we let $u(t)=x'(t)$. Then

```{math}
  \lx[x''(t)] = \lx[u'(t)] = sU(s) - u(0).
```

Also

```{math}
  U(s) = \lx[u(t)] = \lx[x'(t)] = sX(s) - x(0). 
```

Thus,

```{math}
\lx[x''(t)] = s[sX(s)-x(0)] - u(0) = s^2X(s) - s x(0) - x'(0). 
```
:::
::::

Here is the plan of attack. Given an ODE $x'-ax=f(t)$, we transform everything in sight to get

```{math}
sX(s)-x(0) - a X(s) =  F(s).
```

Now solve for the transform of the solution:

```{math}
X(s) = \frac{ F(s) + x(0)}{s-a}.
```

The last step is to compute the inverse transform, that is, find $x(t)$ given a known $X(s)$. This is a lot less straightforward than computing the forward transform, unfortunately. But we can make it manageable in much the same way you learned indefinite integration, by learning some canonical cases and then matching patterns.

## Basic transforms

### Exponential

We can find the transform of an exponential function from the transform definition. For any real number $c$,

```{math}
\lx[e^{c t}] = \int_0^\infty e^{(c-s)t}\, dt = \left[ -\frac{1}{s-c} e^{(c-s)t} \right]_0^\infty = \frac{1}{s-c}.
```

(To make this valid requires that $c< s$, but we are going to ignore all such technicalities.)

````{proof:formula} Transform of an exponential

```{math}
:label: fl-eq-ltexp
\lx[e^{c t}] = \frac{1}{s-c}.
```

An important special case is $c=0$,

```{math}
\lx[1]=\frac{1}{s}.
```
````

::::{admonition} Example
:class: tip
Find the Laplace transform of the function $\sinh(t)$.

:::{dropdown} Solution
This is easy if we use the linearity of $\lx$ on the identity

```{math}
\sinh(t)=\frac{1}{2}(e^t-e^{-t}).
```

We calculate

\begin{align*}
\lx\left[ \tfrac{1}{2}\bigl( e^t - e^{-t} \bigr) \right]  & = \frac{1}{2} \left( \lx[e^t] - \lx[e^{-t}] \right) \\
  & = \frac{1}{2} \left( \frac{1}{s-1} - \frac{1}{s+1} \right) \\
  & = \frac{1}{s^2-1}.
\end{align*}
:::
::::
### Step

Finding the transform of a step is also pretty easy:

\begin{align*}
\lx[H(t-T)] & = \int_T^\infty e^{-st}\, dt \\
& = -\frac{1}{s} \Bigl[ e^{-st} \Bigr]_T^\infty = \frac{e^{-sT}}{s} 
\end{align*}.

````{proof:formula} Transform of a step

```{math}
:label: steps-lt-step
\lx[H(t-T)] = \frac{e^{-sT}}{s}.
```
````

A generalization of the same calculation results in a very important rule.

(theorem-steps-shift)=

````{proof:theorem} Shift theorem
```{math}
:label: steps-lt-shift
\lx[H(t-T)f(t-T)] = e^{-sT} \lx[f(t)].
```
````

(example-steps-shift)=

::::{admonition} Example
:class: tip
Find the inverse transform of

$$
X(s) = \frac{e^{-sT}}{s-a}.
$$

:::{dropdown} Solution
Notice that $X(s) = e^{-sT} Y(s)$, where $Y(s)=1/(s-a)$. We see that $y(t)=e^{at}$. By the shift theorem,

```{math}
x(t) = H(t-T)y(t-T) = H(t-T)e^{a(t-T)}.
```
:::
::::

### Impulse

To get the transform of an impulse, we can play the same game as before. The transform of our narrow window $\delta_\epsilon$  is

```{math}
\lx[ \delta_\epsilon(t-T)] = \frac{1}{\epsilon} \left( \lx[H(t-T)] - \lx[H(t-T-\epsilon) \right) = \frac{1 - e^{\epsilon s}}{\epsilon s}e^{-sT}.
```

Taking the limit as $\epsilon\to 0$ gives the following.

````{proof:formula} Transform of an impulse
```{math}
:label: steps-lt-impulse
\lx[\delta(t-T)] = e^{-sT}.
```

An important special case is $T=0$:
```{math}
\lx[\delta(t)] = 1.
```
````

<div style="max-width:608px"><div style="position:relative;padding-bottom:66.118421052632%"><iframe id="kaltura_player" src="https://cdnapisec.kaltura.com/p/2358381/sp/235838100/embedIframeJs/uiconf_id/43030021/partner_id/2358381?iframeembed=true&playerId=kaltura_player&entry_id=1_covjpa71&flashvars[streamerType]=auto&amp;flashvars[localizationCode]=en&amp;flashvars[leadWithHTML5]=true&amp;flashvars[sideBarContainer.plugin]=true&amp;flashvars[sideBarContainer.position]=left&amp;flashvars[sideBarContainer.clickToClose]=true&amp;flashvars[chapters.plugin]=true&amp;flashvars[chapters.layout]=vertical&amp;flashvars[chapters.thumbnailRotator]=false&amp;flashvars[streamSelector.plugin]=true&amp;flashvars[EmbedPlayer.SpinnerTarget]=videoHolder&amp;flashvars[dualScreen.plugin]=true&amp;flashvars[Kaltura.addCrossoriginToIframe]=true&amp;&wid=1_tg93ddqr" width="608" height="402" allowfullscreen webkitallowfullscreen mozAllowFullScreen allow="autoplay *; fullscreen *; encrypted-media *" sandbox="allow-forms allow-same-origin allow-scripts allow-top-navigation allow-pointer-lock allow-popups allow-modals allow-orientation-lock allow-popups-to-escape-sandbox allow-presentation allow-top-navigation-by-user-activation" frameborder="0" title="Kaltura Player" style="position:absolute;top:0;left:0;width:100%;height:100%"></iframe></div></div>
