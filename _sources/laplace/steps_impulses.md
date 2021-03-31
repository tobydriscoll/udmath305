# Steps and impulses (2nd order)

The key transforms that apply when the forcing contains steps or impulses are

\begin{align*}
H(t-T) & \Longleftrightarrow \dfrac{e^{-sT}}{s}, \\
H(t-T)f(t-T) & \Longleftrightarrow e^{-sT}F(s), \\
\delta(t-T) & \Longleftrightarrow e^{-sT}.
\end{align*}

:::{note}
Steps and impulses in forcing both produce steps in the solution.
:::

## Impulse forcing

For illustration, let's start with an impulse on an undamped oscillator.

::::{admonition} Example
:class: tip
Solve

$$
x''+x = \delta(t-T), \quad x(0)=x'(0)=0,
$$

for fixed $T\ge 0$. 

:::{dropdown} Solution
Taking the transform of everything and solving for $X$ gives

$$
X(s) = \frac{e^{-sT}}{s^2+1} = e^{-sT} Y(s),
$$

where $Y(s)=1/(s^2+1)$. We chose to write $X$ this way so that we can apply the shift theorem,

$$
\lx\bigl[H(t-T)y(t-T)\bigr] = e^{-sT}Y(s).
$$

In this case we have that $y(t)=\sin(t)$, hence

$$
\lx\bigl[H(t-T)\sin(t-T)\bigr] = e^{-sT}Y(s) = X(s).
$$

That is, the solution is $x(t)=H(t-T)\sin(t-T)$. Writing it piecewise,

$$
x(t) = \begin{cases} 0, & 0\le t < T, \\ \sin(t-T), & t \ge T. \end{cases}
$$
:::
::::

Since the system in the previous example starts at rest, it remains at rest until the impulse at time $T$. Note that $x$ remains continuous at $t=T$, but $x'$ does not. In fact, $x'(T^+)=\cos(0)=1$. This modifies in a basic way the impulse response [we observed](section-steps-jump) for first-order problems.

```{proof:rule}
In a second-order linear ODE, the effect of a unit impulse is the same as an instantaneous increase by 1 in the derivative of the solution.
```

::::{admonition} Example
:class: tip
Find the solution of $x''+2x'+10x=6\delta(t-5)$, $x(0)=x'(0)=0$.

:::{dropdown} Solution
Solving for the transform leads to

```{math}
X_p(s) = \frac{6e^{-5s}}{s^2+2s+10}.
```

The shift theorem applied to $e^{-5s}Y(s)$ requires us to define

$$
Y(s) = \frac{6}{s^2+2s+10},
$$

and then find $y(t)$. This $Y$ is already in PFD form. One way to invert it is to complete the square in the denominator:

$$
Y(s) = \frac{6}{(s+1)^2+9}.
$$

We now want to apply the transform pair

$$
e^{at} f(t) \Longleftrightarrow F(s-a),
$$

where $a=-1$, because then $Y(s)=F(s+1)$ if

$$
F(s) = \frac{6}{s^2+9}.
$$

Finally we can begin to unravel the tapestry. We see that $f(t)=2\sin(3t)$. Our definitions and transform rules imply that $y(t)=e^{-t}f(t)$ and $x_p(t)=H(t-5)y(t-5)$. Hence

$$
x_p(t) = 2 H(t-5)e^{-(t-5)} \sin[3(t-5)].
$$
:::
::::

## Step forcing

As a warm-up, let's consider

$$
x''+x = H(t-T), \quad x(0)=x'(0)=0.
$$

Solving for the transform of the solution gives

$$
X(s) = \frac{e^{-sT}}{s(s^2+1)}.
$$

This is in the form $e^{-sT}Y(s)$, where $Y(s)=1/[s(s^2+1)]$. An appropriate real PFD is

$$
Y(s) = \frac{1}{s(s^2+1)} = \frac{A}{s} + \frac{Bs+C}{s^2+1},
$$

leading to the identity

$$
1 = A(s^2+1) + (Bs+C)s = (A+B)s^2 + Cs + A.
$$

From here it's clear that $A=1$, $B=-1$, $C=0$. Hence $y(t)=1-\cos(t)$. Finally,

$$
x(t) = H(t-T)y(t-T) = H(t-T)[1 - \cos(t-T)] =
\begin{cases} 0, & 0 \le t < T, \\ 1-\cos(t-T), & t\ge T. \end{cases}
$$

It only takes a moment to see that both $x$ and $x'$ are continuous at $t=T$, which is the general situation with step forcing.

::::{admonition} Example
:class: tip
Find a particular solution of $x''-x=f(t)$, where $f(t) = \begin{cases} 0, & 0 \le t < 3, \\ t, & t\ge 3. \end{cases}$

:::{dropdown} Solution

The forcing function is $f(t)=tH(t-3)$. This is not yet quite in a form we know how to transform. What we need is

$$
f(t) = H(t-3)g(t-3),
$$

in order to get

$$
F(s) = e^{-3s}G(s).
$$

This requires the definition $g(t-3)=t$, which means that $g(t)=t+3$. Hence

$$
F(s) = e^{-3s} \left[ \frac{1}{s^2} + \frac{3}{s}\right].
$$

Now we can solve for $X_p$ to get

$$
X_p(s) = e^{-3s} \left[ \frac{3s+1}{s^2(s^2-1)} = e^{-3s} Y(s) \right],
$$

where

$$
Y(s) = \frac{As+B}{s^2} + \frac{C}{s-1} + \frac{D}{s+1}.
$$

From here,

$$
3s+1 = (As+B)(s^2-1) + Cs^2(s+1) + Ds^2(s-1).
$$

At $s=0$ we get $1=-B$. From $s=1$ and $s=-1$ we get $2C=4$ and $-2D=-2$. The coefficient of $s^3$ on the right side is $A+C+D$, which must be zero, so $A=-3$. Thus

$$
Y(s) = \frac{-3}{s} + \frac{-1}{s^2} + \frac{2}{s-1} + \frac{1}{s+1},
$$

and $y(t)=-3-t+2e^t + e^{-t}$. Finally, $x_p(t) = H(t-3)y(t-3)$.
:::
::::

The Laplace transform systematizes the algebra needed to solve the kinds of linear ODEs we have encountered, but that does not mean that the algebra is simple. It's an ideal setup for computer solutions. Most of the time, though, the method of undetermined coefficients is easier for hand computation.

<div style="max-width:608px"><div style="position:relative;padding-bottom:66.118421052632%"><iframe id="kaltura_player" src="https://cdnapisec.kaltura.com/p/2358381/sp/235838100/embedIframeJs/uiconf_id/43030021/partner_id/2358381?iframeembed=true&playerId=kaltura_player&entry_id=1_4z085wez&flashvars[streamerType]=auto&amp;flashvars[localizationCode]=en&amp;flashvars[leadWithHTML5]=true&amp;flashvars[sideBarContainer.plugin]=true&amp;flashvars[sideBarContainer.position]=left&amp;flashvars[sideBarContainer.clickToClose]=true&amp;flashvars[chapters.plugin]=true&amp;flashvars[chapters.layout]=vertical&amp;flashvars[chapters.thumbnailRotator]=false&amp;flashvars[streamSelector.plugin]=true&amp;flashvars[EmbedPlayer.SpinnerTarget]=videoHolder&amp;flashvars[dualScreen.plugin]=true&amp;flashvars[Kaltura.addCrossoriginToIframe]=true&amp;&wid=1_zisckjbm" width="608" height="402" allowfullscreen webkitallowfullscreen mozAllowFullScreen allow="autoplay *; fullscreen *; encrypted-media *" sandbox="allow-forms allow-same-origin allow-scripts allow-top-navigation allow-pointer-lock allow-popups allow-modals allow-orientation-lock allow-popups-to-escape-sandbox allow-presentation allow-top-navigation-by-user-activation" frameborder="0" title="Kaltura Player" style="position:absolute;top:0;left:0;width:100%;height:100%"></iframe></div></div>