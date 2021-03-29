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
(section-second-undamped)=
# Pure oscillation

The equation 

$$
x'' +  \omega_0^2 x = 0 
$$

has characteristic roots that are purely imaginary: 

$$
\lambda = \pm i\, \omega_0. 
$$

One option is to express the solution using complex exponentials,

$$
x(t) = c_1 e^{i\omega_0 t} + c_2 e^{-i\omega_0 t},
$$

where $c_1$ is complex, and $c_2=\overline{c_1}$ ensures a real-valued solution. For any complex $z=u+iv$, 

$$
z+\overline{z} = u + iv + u - iv = 2u = 2\Re(z).
$$

Hence we can also write 

:::{math}
:label: second-undamped-complex
x(t) = \Re \left( c_1 e^{i\omega_0 t} \right), \qquad c_1 \in \mathbb{C},
:::

having absorbed a factor of 2 into the arbitrary constant. 

Suppose we define

$$
a_1 = \Re(c_1), \; a_2=-\Im(c_1) \quad \Longleftrightarrow \quad c_1 = a_1 - i a_2.
$$

Then by Euler's identity,

$$
c_1 e^{i\omega_0 t} = (a_1 - i a_2)[ \cos(\omega_0 t) + i \sin(\omega_0 t) ] = a_1 \cos(\omega_0 t) + a_2 \sin(\omega_0 t) + i\,[\cdots],
$$

and the stuff in the final brackets disappears upon taking the real part. So equivalently to {eq}`second-undamped-complex`, we can write

:::{math} 
:label: second-undamped-sincos
x(t) = a_1\cos(\omega_0 t) + a_2 \sin(\omega_0 t), \qquad a_1,a_2 \in \mathbb{R}.
:::

There is an important *third* equivalent form.

## Amplitude–phase form

Returning to {eq}`second-undamped-complex`, let us write $c_1$ in polar form:

$$
c_1 = R e^{i\theta} \quad \Longleftrightarrow \quad  R = |c_1|, \: e^{i \theta} = \frac{c_1}{|c_1|}.
$$

Then

\begin{align*}
x(t) & = \Re \left( c_1 e^{i\omega_0 t} \right)\\
& = \Re \left( R e^{i\theta} e^{i\omega_0 t} \right) \\
& = R\, \Re \left( e^{i(\omega_0 t+\theta)} \right) \\
& = R \cos(\omega_0 t+\theta),
\end{align*}

where the last line follows from Euler's identity. This is the {term}`amplitude–phase form`,

:::{math}
:label: second-undamped-ampphase
x(t) = R \cos(\omega_0 t+\theta), \qquad R,\theta \in \mathbb{R}.
:::

A useful aspect of this form is that the solution oscillates between $\pm R$, which is the **amplitude** of the oscillation. 

Equations {eq}`second-undamped-complex`, {eq}`second-undamped-sincos`, and {eq}`second-undamped-ampphase` are all equivalent expressions of the general solution. We can convert between them using the identities

$$
a_1 - i a_2 = c_1 = R e^{i\theta},
$$

which amounts to simple polar/Cartesian conversions.

::::{admonition} Example
:class: tip
Find the solution in amplitude-phase form of $2x''+32x=0$ with $x(0)=1$, $x'(0)=-8$.

:::{dropdown} Solution

First divide through by 2 to get the standard form, $x''+16x=0$. Then we have $\omega_0=\sqrt{16}=4$, so

$$
x(t) = a_1 \cos(4 t) + a_2 \sin(4 t).
$$

We then derive $1=x(0)=a_1$ and $-8=x'(0)=4a_2$, so

$$
x(t) = \cos(4 t) -2 \sin(4 t).
$$

Converting $(1,-2)$ to polar form gives $R=\sqrt{5}$ and $\tan \theta = -2/1$. In order to find $\theta$ numerically, you need to use a [four-quadrant arctangent](https://www.mathworks.com/help/matlab/ref/atan2.html#buct8h0-4). In MATLAB it would be `atan2(-2,1)`. 
:::
::::

::::{admonition} Example
:class: tip
Find the amplitude of the solution to $x''+9x=0$, $x(0)=-4$, $x'(0)=6$.

:::{dropdown} Solution

The characteristic polynomial $\lambda^2+9$ gives the roots $\pm 3i$. We can write the solution as $x(t) = R \cos(3 t + \theta)$ and apply the initial conditions to get

\begin{align*}
-4 &= x(0) = R \cos(\theta), \\
6 &= x'(0) = -3R \sin(\theta).
\end{align*}

We are asked only for the amplitude, so there is no need to solve for $\theta$. It's clear that

$$
[R \cos(\theta)]^2 + [R \sin(\theta)]^2 = (-4)^2 + (-2)^2 = 20,
$$

which gives $R=\sqrt{20}=2\sqrt{5}$. 
:::
::::

<div style="max-width:608px"><div style="position:relative;padding-bottom:66.118421052632%"><iframe id="kaltura_player" src="https://cdnapisec.kaltura.com/p/2358381/sp/235838100/embedIframeJs/uiconf_id/43030021/partner_id/2358381?iframeembed=true&playerId=kaltura_player&entry_id=1_g8zlkm7c&flashvars[streamerType]=auto&amp;flashvars[localizationCode]=en&amp;flashvars[leadWithHTML5]=true&amp;flashvars[sideBarContainer.plugin]=true&amp;flashvars[sideBarContainer.position]=left&amp;flashvars[sideBarContainer.clickToClose]=true&amp;flashvars[chapters.plugin]=true&amp;flashvars[chapters.layout]=vertical&amp;flashvars[chapters.thumbnailRotator]=false&amp;flashvars[streamSelector.plugin]=true&amp;flashvars[EmbedPlayer.SpinnerTarget]=videoHolder&amp;flashvars[dualScreen.plugin]=true&amp;flashvars[Kaltura.addCrossoriginToIframe]=true&amp;&wid=1_g4i554sk" width="608" height="402" allowfullscreen webkitallowfullscreen mozAllowFullScreen allow="autoplay *; fullscreen *; encrypted-media *" sandbox="allow-forms allow-same-origin allow-scripts allow-top-navigation allow-pointer-lock allow-popups allow-modals allow-orientation-lock allow-popups-to-escape-sandbox allow-presentation allow-top-navigation-by-user-activation" frameborder="0" title="Kaltura Player" style="position:absolute;top:0;left:0;width:100%;height:100%"></iframe></div></div>
