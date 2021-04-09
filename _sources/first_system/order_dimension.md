# Conversion of higher-order ODEs

We begin with a vital observation that applies to all ODEs, not just linear ones: order can be exchanged for dimension.

::::{admonition} Example
:class: tip
The simple harmonic oscillator

$$
x'' + 2 Z \omega_0 x' + \omega_0^2 x = f(t)
$$

can be converted to an equivalent first-order system using the definitions

$$
u_1 = x, \quad u_2 = x'.
$$

We can easily derive an ODE for $\bfu$ without reference to $x$. First, by definition, $u_1'=u_2$. Next, $u_2' = x''$, and we can isolate $x''$ in the original equation to get

$$
u_2' = f - 2 Z \omega_0 x' - \omega_0^2 x = f - 2 Z \omega_0 u_2 - \omega_0^2 u_1.
$$

Hence

:::{math}
\begin{split}
u_1' &= u_2,\\
u_2' &= f - 2 Z \omega_0 u_2 - \omega_0^2 u_1.
\end{split}
:::
::::


::::{admonition} Example
:class: tip

A frictionless pendulum is governed by the nonlinear equation $\theta''+ \frac{g}{L}\sin(\theta)=0$, where $\theta(t)$ is the angle made by the pendulum from the straight-down position. Define 

$$
u_1=\theta, \quad u_2=\theta'.
$$ 

Then $u_1'=u_2$. Since $u_2'=\theta''$, we can use the original ODE to express it in terms of $\theta$ and $\theta'$, and hence in terms of $u_1$ and $u_2$. Altogether the system is, in vector notation, 

:::{math}
\twovec{u_1'}{u_2'} = \twovec{u_2}{- \frac{g}{L}\sin(u_1)}.
:::
::::

## General procedure

The technique illustrated above generalizes to equations of any order, and to systems of equations of any orders. The formal procedure is a bit complicated to describe but fully automatic; there are no decisions to make. 

We will use a template example to keep the notation under control. Suppose you are given a system in three scalar variables:

:::{math}
\begin{split}
x'' &= \alpha(t,x,x',y,z,z',z''),\\
y' &= \beta(t,x,x',y,z,z',z''),\\
z''' &= \gamma(x,x',y,z,z',z'').
\end{split}
:::

In any given example, every function might not actually depend on every possible variable, but that is fine. Note that the functions $\alpha,\beta,\gamma$ can only depend on derivatives of each variable lower than the orders on the left-hand sides. If, say, $\alpha$ depended on $x''$ as well, the system would be implicitly defined, and while this too can be handled, we will not encounter such systems. 

Our definitions for conversion to a first-order system are

:::{math}
\begin{split}
u_1 &= x, \, u_2 = x', \\
u_3 &= y,\\
u_4 &= z, \, u_5 = z', \, u_6 = z''.
\end{split}
:::

The key is to *include a component for each of the lower-order derivatives of each variable*, whether or not those terms appear explicitly in the original problem. Everything else now flows from these definitions:

:::{math}
\begin{split}
u_1' &= x' = u_2,\\
u_2' &= x'' = \alpha(t,u_1,u_2,u_3,u_4,u_5,u_6), \\
u_3' &= y' = \beta(t,u_1,u_2,u_3,u_4,u_5,u_6),\\
u_4' &= z' = u_5,\\
u_5' &= z'' = u_6,\\
u_6' &= z''' = \gamma(t,u_1,u_2,u_3,u_4,u_5,u_6).
\end{split}
:::

The final expression of the new system is $\bfu' = \bff(t,\bfu)$, free of all references to the original variables $x$, $y$, and $z$.

::::{admonition} Example
:class: tip

Two pendulums hanging from a bar and swinging in parallel planes are coupled through torsion on the bar, obeying

\begin{align*}
\theta_1''+ b\theta_1' + \frac{g}{L}\sin(\theta_1) + \kappa(\theta_1-\theta_2) & = 0 \\
\theta_2''+ b\theta_2' + \frac{g}{L}\sin(\theta_2) + \kappa(\theta_2-\theta_1) & = 0 \\
\end{align*}

Express this as a first-order system.

:::{dropdown} Solution

We define 

$$
u_1 = \theta_1, \quad u_2 = \theta_1', \quad u_3 = \theta_2, \quad u_4 = \theta_2'.
$$

Two differential equations, $u_1'=u_2$ and $u_3'=u_4$, follow immediately from these definitions. The remaining two come from substituting into the original ODEs: 

\begin{align*}
	u_2' = \theta_1'' & = - b u_2 - \frac{g}{L}\sin(u_1) - \kappa(u_1-u_3)\\
	u_4' = \theta_2'' & = - b u_4 - \frac{g}{L}\sin(u_3) - \kappa(u_3-u_1)\\
\end{align*}

The result is a four-dimensional, first-order system $\mathbf{u}'=\mathbf{f}(t,\mathbf{u})$.
:::
::::

If initial conditions are supplied for the original problem, they can be translated as well. In the above template, the initial values would need to be given for $x,x',y,z,z',z''$, which are just the components of the new dependent variable $\bfu$.

:::{attention}
While every high-order problem can be converted to a first-order system, the converse is not true. That is, there are first-order systems that are not equivalent to any higher-order problem. They inhabit a strictly larger universe.
:::

## Linear problems

When the original high-order ODE or system is linear, then its first-order equivalent is linear as well. We saw that in the first example of this section, where

$$
x'' + 2 Z \omega_0 x' + \omega_0^2 x = f(t)
$$

can be converted to 

:::{math}
:label: harmonic-system
\begin{split}
u_1' &= u_2,\\
u_2' &= f - 2 Z \omega_0 u_2 - \omega_0^2 u_1.
\end{split}
:::

As a linear problem, we can express it using a matrix-vector multiplication:

$$
\bfu' = \twomat{0}{1}{-\omega_0^2}{-2Z\omega_0} \bfu + \twovec{0}{f},
$$

which is of the form $\bfu'=\bfA(t)\bfu + \bff(t)$. The $2\times 2$ matrix $\bfA$ here is called the {term}`coefficient matrix` of the first-order system. 

<div style="max-width:608px"><div style="position:relative;padding-bottom:66.118421052632%"><iframe id="kaltura_player" src="https://cdnapisec.kaltura.com/p/2358381/sp/235838100/embedIframeJs/uiconf_id/43030021/partner_id/2358381?iframeembed=true&playerId=kaltura_player&entry_id=1_5xft6bmd&flashvars[streamerType]=auto&amp;flashvars[localizationCode]=en&amp;flashvars[leadWithHTML5]=true&amp;flashvars[sideBarContainer.plugin]=true&amp;flashvars[sideBarContainer.position]=left&amp;flashvars[sideBarContainer.clickToClose]=true&amp;flashvars[chapters.plugin]=true&amp;flashvars[chapters.layout]=vertical&amp;flashvars[chapters.thumbnailRotator]=false&amp;flashvars[streamSelector.plugin]=true&amp;flashvars[EmbedPlayer.SpinnerTarget]=videoHolder&amp;flashvars[dualScreen.plugin]=true&amp;flashvars[Kaltura.addCrossoriginToIframe]=true&amp;&wid=1_tdiripx6" width="608" height="402" allowfullscreen webkitallowfullscreen mozAllowFullScreen allow="autoplay *; fullscreen *; encrypted-media *" sandbox="allow-forms allow-same-origin allow-scripts allow-top-navigation allow-pointer-lock allow-popups allow-modals allow-orientation-lock allow-popups-to-escape-sandbox allow-presentation allow-top-navigation-by-user-activation" frameborder="0" title="Kaltura Player" style="position:absolute;top:0;left:0;width:100%;height:100%"></iframe></div></div>
