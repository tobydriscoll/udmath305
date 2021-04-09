# Solution structure

The rest of this chapter is devoted to linear ODE systems.

(fs-df-linsystem)=
::::{proof:definition} Linear system of ODEs
A {term}`linear ODE system` is an equation of the form

:::{math}
:label: fs-eq-system
\mathbf{x}' = \mathbf{A}(t)\mathbf{x} + \bff(t),
:::

where $\mathbf{x}$ is an $n$-dimensional vector, $\mathbf{A}$ is an $n\times n$ {term}`coefficient matrix`, and $\bff(t)$ is an $n$-dimensional {term}`forcing function`. If the coefficient matrix does not depend on time, the system is said to be {term}`constant-coefficient`. If given, an {term}`initial condition` of the system is a time $t_0$ and vector $\mathbf{x}_0$ such that $\mathbf{x}(t_0)=\mathbf{x}_0$. 
::::

::::{admonition} Example
:class: tip

Here is a basic model for heating in a house. Let $b(t)$ be the temperature of the basement, $m(t)$ be the temperature of the main living area, and $a(t)$ be the temperature of the attic. Suppose the ground is at a constant 10 degrees C. We use a Newtonian model to describe how the temperature of the basement evolves due to interactions with the earth and the main floor:

:::{math}
\frac{db}{dt} = -k_b (b - 10) - k_{mb} (b-m). 
:::

Similarly, the attic interacts with the air, which we will hold at 2 degrees, and the main floor:

:::{math}
\frac{da}{dt} = -k_a (a - 2) - k_{ma} (a-m). 
:::

Finally, suppose the main area interacts mostly with the other levels and experiences input from a heater:

:::{math}
\frac{dm}{dt} = -k_{mb} (m - b) - k_{ma} (m - a) + h(t).
:::

Write the entire system in the form $\mathbf{x}' = \mathbf{A} \mathbf{x} + \bff(t)$. That is, identify what $\mathbf{A}$ and $\bff(t)$ must be based on the above equations. 

:::{dropdown} Solution

We define $x_1=b$, $x_2=m$, and $x_3=a$. Then

$$
\frac{d\bfx}{dt} = \threevec{(-k_b - k_{mb}) x_1  +k_{mb} x_2}{ k_{mb}x_1 -(k_{mb}+k_{ma})x_2 + k_{ma}x_3}{k_{ma}x_2  -(k_{ma}+k_a)x_3} + \threevec{10k_b}{h(t)}{2k_a}.
$$

Observe that on the right side, the terms depending on $\bfx$ have been separated from the others. Hence

$$
\bfx' = \begin{bmatrix} -k_b-k_{mb} & k_{mb} & 0 \\ k_{mb} & -k_{mb}-k_{ma} & k_{ma} \\  0 & k_{ma} & -k_{ma}-k_a \end{bmatrix}  \bfx + \threevec{10k_b}{h(t)}{2k_a}.
$$

We conclude that 

$$
\mathbf{A} = \begin{bmatrix} -k_b-k_{mb} & k_{mb} & 0 \\ k_{mb} & -k_{mb}-k_{ma} & k_{ma} \\  0 & k_{ma} & -k_{ma}-k_a \end{bmatrix}, \quad \bff = \threevec{10k_b}{h(t)}{2k_a}.
$$
:::
::::

It's not a stretch to say that virtually all of the general statements we made about the scalar linear problem $x'=a(t)x+f(t)$ can be remade with boldface/capital letters for the linear system $\mathbf{x}'=\mathbf{A}(t)\mathbf{x}+\bff(t)$. Those statements relied mainly on linearity. Thus,

(theorem-fs-general)=
::::{proof:theorem} General solutions of first-order linear system
Every solution of 

$$
\mathbf{x}'=\mathbf{A}(t)\mathbf{x}+\bff(t)
$$ 

can be written in the form 

$$
\mathbf{x}=\mathbf{x}_h+\mathbf{x}_p,
$$ 

where $\mathbf{x}_h$ is the general solution of $\mathbf{x}'=\mathbf{A}(t)\mathbf{x}$ and $\mathbf{x}_p$ is any solution of $\mathbf{x}'=\mathbf{A}(t)\mathbf{x}+\bff(t)$.
::::	

Once again, then, we look first at the homogeneous system with no forcing term, and then for particular solutions of the original problem.

<div style="max-width:608px"><div style="position:relative;padding-bottom:66.118421052632%"><iframe id="kaltura_player" src="https://cdnapisec.kaltura.com/p/2358381/sp/235838100/embedIframeJs/uiconf_id/43030021/partner_id/2358381?iframeembed=true&playerId=kaltura_player&entry_id=1_eomv4d4r&flashvars[streamerType]=auto&amp;flashvars[localizationCode]=en&amp;flashvars[leadWithHTML5]=true&amp;flashvars[sideBarContainer.plugin]=true&amp;flashvars[sideBarContainer.position]=left&amp;flashvars[sideBarContainer.clickToClose]=true&amp;flashvars[chapters.plugin]=true&amp;flashvars[chapters.layout]=vertical&amp;flashvars[chapters.thumbnailRotator]=false&amp;flashvars[streamSelector.plugin]=true&amp;flashvars[EmbedPlayer.SpinnerTarget]=videoHolder&amp;flashvars[dualScreen.plugin]=true&amp;flashvars[Kaltura.addCrossoriginToIframe]=true&amp;&wid=1_75etck4k" width="608" height="402" allowfullscreen webkitallowfullscreen mozAllowFullScreen allow="autoplay *; fullscreen *; encrypted-media *" sandbox="allow-forms allow-same-origin allow-scripts allow-top-navigation allow-pointer-lock allow-popups allow-modals allow-orientation-lock allow-popups-to-escape-sandbox allow-presentation allow-top-navigation-by-user-activation" frameborder="0" title="Kaltura Player" style="position:absolute;top:0;left:0;width:100%;height:100%"></iframe></div></div>
