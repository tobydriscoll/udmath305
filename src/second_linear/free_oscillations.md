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
# Free oscillations

```{code-cell}
---
tags: [remove-cell]
---
restoredefaultpath
set(0,'defaultlinelinewidth',1)
set(0,'defaultaxesfontsize',10)
```

```{code-cell}
---
tags: [remove-cell]
---
%plot -s 800,400 -r 160 -f png
```

The most common use of second-order equations is the modeling of oscillatory or other periodic behavior. This behavior occurs in myriad contexts. When an oscillating system is not subjected to any external forces, we call it an unforced oscillator or {term}`free oscillator`.

## Mechanical oscillator

An object attached to an ideal spring satisfies the ODE

```{math}
:label: secondlin-massspring-free
mx'' + b x' + kx = 0,
```

where $x(t)$ is the displacement from the natural resting position, $m$ is the mass of the object, $b$ is an attenuation coefficient due to friction or mechanical damping, and $k$ is a property of the spring called the {term}`spring constant`. This constant is the ratio of the restoring force of the spring to the amount by which it is stretched or compressed.

```{attention}
All named parameters such as $m$, $k$, and $b$ are assumed to be nonnegative unless stated otherwise.
```

```{note}
Equation {eq}`secondlin-massspring-free` applies equally well to horizontal and vertical oscillations. Gravity does not appear in the vertical case because it is accounted for by measuring $x$ from the static equilibrium position.
```

If given, initial values for {eq}`secondlin-massspring-free` supply the initial position and initial velocity, which determine the solution uniquely.

A pendulum is a different type of mechanical oscillator. The proper ODE is

```{math}
\theta'' + \gamma \theta + \frac{g}{L}\sin (\theta) = 0,
```

where $\theta(t)$ is the angle made with vertical-down position, $L$ is the arm length, and $g$ is gravitational acceleration. This equation is nonlinear and difficult to analyze without developing new tools. But if the angle remains small, then a reasonable approximation is

```{math}
\theta'' + \gamma \theta + \frac{g}{L}\theta = 0,
```

which is a linear oscillator with constant coefficients.

## Electrical oscillators

An AC circuit typically has elements of resistance, capacitance, and inductance. These analogize perfectly to friction/damping, spring constant, and mass. If these elements are wired in series, the governing ODE is

```{math}
LI'' + RI' + \frac{1}{C}I = 0,
```

where $I(t)$ is the current flowing through the circuit, $L$ is inductance, $R$ is resistance, and $C$ is capacitance.

## Unifying notation

When you have many versions of the same root problem, each using different symbols and units, you have three options.

1. Solve each new problem from scratch.
2. Derive custom formulas for each application.
3. Find a minimal set of parameters and express the problem and solution in terms of them.

Option 1 is highly inefficient. Option 2 would be appropriate for an engineering course. Here, we take option 3 and develop generalized knowledge that can be reinterpreted for each new application.

The ODE of free mass-spring oscillator, when written in our standard form, is
  
```{math}
x'' + \frac{b}{m} x' + \frac{k}{m} x = 0.
```

Right away this suggests that we only need two parameters, not three, to express the full range of behavior. (An added convenience is that both $b/m$ and $\sqrt{k/m}$ have units of inverse time.) Accordingly, we introduce

```{math}
\omega_0 = \sqrt{\frac{k}{m}}, \qquad Z = \frac{b/m}{2\omega_0} = \frac{b}{\sqrt{4km}}.
```

The parameter $\omega_0$ is known as the {term}`natural frequency`, with units of inverse time, and $Z$ is a dimensionless {term}`damping coefficient` describing the relative intensity of the damping.

::::{important}
In math we usually use *frequency* to mean the multiplier of $t$ in a sin or cos function. That is our usage. In some fields this is called {term}`angular frequency` and *frequency* is used to mean the number of cycles per time unit, as in Hz.
::::

Now the ODE of a free oscillator becomes

```{math}
:label: secondlin-unified-free
x'' + 2 Z \omega_0\, x' + \omega_0^2\, x = 0.
```

A similar derivation can be done starting from the pendulum or AC circuit equations.

The characteristic roots of the ODE are  

```{math}
\lambda_{1,2} = -Z \omega_0 \pm \omega_0 \sqrt{Z^2-1}.
```

The discussion now splits into four cases, marked by increasing values of $Z$.

## Undamped oscillator, $Z=0$

The case $x'' + \omega_0^2x = 0$ was discussed in {numref}`section-second-undamped`. It results in pure oscillation at frequency $\omega_0$. This is known as {term}`simple harmonic motion`.

::::{admonition} Example
:class: tip
When a 2 kg mass is hung on a spring, the spring stretches by 0.25 m. What is the natural frequency of the mass-spring system? Suppose the mass is pulled down 0.2 m past equilibrium and then thrown upward at 1 m/s. What is the amplitude of the motion?

:::{dropdown} Solution
Hooke's Law for a spring states that $F=k x$, so we find the spring constant from $k=F/x=2g/0.25=8g$, where $g=9.8$ m per second squared. The ODE for free motion of the system is thus $2 x'' + 8g x = 0$, or

$$
x'' + 4g x   = 0.
$$

From this we identify the natural frequency

```{math}
\omega_0 = \sqrt{4g} = 2\sqrt{g} \approx 6.26 \text{s}^{-1}. 
```

We can apply the initial conditions directly to the amplitude-phase form:

\begin{align*}
-0.2 & = x(0) = R\cos(\theta) \\
1 & = x'(0) = -\omega_0 R\sin(\theta).
\end{align*}

Therefore,

```{math}
R^2 = [R\cos(\theta)]^2 + [R\sin(\theta)]^2 =  0.04 + \omega_0^{-2},
```

which works out to $R \approx 0.256 \text{m}$.
:::
::::

## Underdamped oscillator, $0<Z<1$

For $0< Z < 1$ the roots of {eq}`secondlin-unified-free` are complex, with negative real part:

```{math}
\lambda_{1,2} = -Z \omega_0 \pm i \omega_0 \sqrt{1-Z^2}.
```

Define the damped frequency $\omega_d=\omega_0 \sqrt{1-Z^2}$. The amplitude–phase form easily generalizes to

```{math}
x_h(t) = R\, e^{-Z\omega_0 t} \cos( \omega_d t + \theta),
```

where $R$ and $\theta$ are determined by the initial conditions. This solution is pseudoperiodic, combining oscillation at frequency $\omega_d < \omega_0$ inside an exponential decay envelope. We call this an {term}`underdamped oscillator`.

## Critically damped oscillator, $Z=1$
		
At $Z=1$ the complex roots coalesce into a double real root,

```{math}
\lambda_1 = \lambda_2 = -\omega_0,
```

with general homogeneous solution

```{math}
x_h(t) = e^{-\omega_0 t} (c_1 + c_2 t).
```

There is no longer any oscillation present, and we have a {term}`critically damped` system. The linear growth of $c_2 t$ doesn't make much of a difference against the exponential decay, and $x_h\to0$ as $t\to\infty$.

## Overdamped, $Z>1$

For $Z>1$ the roots are

```{math}
\lambda_{1,2} = -Z \omega_0 \pm \omega_0 \sqrt{Z^2-1},
```

which are negative and real. This gives an exponentially decaying homogeneous solution. In this case we have an {term}`overdamped` oscillator.

```{list-table} Damping coefficient and characteristic values
:header-rows: 1
:name: table-secondlin-oscillators

* - Damping coefficient 
  - Root property
  - Description
* - $Z=0$
  - imaginary
  - undamped
* - $0 < Z < 1$
  - complex
  - underdamped
* - $Z=1$
  - real, negative, repeated
  - critically damped
* - $Z > 1$
  - real, negative, distinct 
  - overdamped
```

::::{admonition} Example
:class: tip

A 5 kg mass is hung on a spring with constant $11$ N per m and connected to a dashpot that provides 8 N-sec per meter of resistance. Is this system underdamped, overdamped, or critically damped?

:::{dropdown} Solution
The ODE for the mass-spring system is

\begin{align*}
    5 x'' + 8x' + 11 x  & = 0 ,\\
    x'' + 1.6 x' + 2.2 x  & = 0, 
\end{align*}

from which we identify the natural frequency

```{math}
  \omega_0 = \sqrt{2.2} \approx 1.483 \text{s}^{-1}.
```

The damping coefficient is therefore

```{math}
  Z = \frac{1.6}{2\omega_0} \approx 0.539.
```

Since this value is less than one, the system is underdamped.
:::
::::

::::{admonition} Example (continued)
:class: tip

Suppose the system from the previous example is initially at equilibrium when the mass is suddenly pushed downward at 0.5 m/sec. Find the motion of the mass.

:::{dropdown} Solution
We derived the governing ODE $x'' + 1.6 x' + 2.2 x = 0$. The roots are the roots of $\lambda^2 + 1.6\lambda + 2.2$, which are found numerically to be

```{math}
  \lambda \approx -0.8000 \pm 1.2490i.
```

(The imaginary part is smaller than the natural frequency found in the last example, as it must be.) Choosing the sin-cos form of the general solution, we have

$$
x_h(t) = a_1 e^{-0.8 t} \cos(1.249 t) + a_2 e^{-0.8 t} \sin(1.249 t).
$$

We apply the initial conditions $x(0)=0$, $x'(0)=-0.5$ to find

\begin{align*}
0 & = x_h(0) = a_1, \\ 
-0.5 & = x_h'(0) = a_1( -0.8 ) + a_2 (1.249 ),
\end{align*}

thus $a_2 = -0.4003$. The motion is therefore given by $x(t)=-0.4003\, e^{-0.8 t} \sin(1.249 t)$.
:::
::::

Here is a short video showing how solutions of 

$$
x'' + bx' + c x = 0
$$

vary with the parameters $b$ and $c$, or equivalently, $\omega_0$ and $Z$. (I use the term "eigenvalues" to mean characteristic values of the ODE.) 

<div>
<iframe id="kaltura_player" src="https://cdnapisec.kaltura.com/p/2358381/sp/235838100/embedIframeJs/uiconf_id/43030021/partner_id/2358381?iframeembed=true&playerId=kaltura_player&entry_id=1_qa9wnwpt&flashvars[streamerType]=auto&amp;flashvars[localizationCode]=en&amp;flashvars[leadWithHTML5]=true&amp;flashvars[sideBarContainer.plugin]=true&amp;flashvars[sideBarContainer.position]=left&amp;flashvars[sideBarContainer.clickToClose]=true&amp;flashvars[chapters.plugin]=true&amp;flashvars[chapters.layout]=vertical&amp;flashvars[chapters.thumbnailRotator]=false&amp;flashvars[streamSelector.plugin]=true&amp;flashvars[EmbedPlayer.SpinnerTarget]=videoHolder&amp;flashvars[dualScreen.plugin]=true&amp;flashvars[Kaltura.addCrossoriginToIframe]=true&amp;&wid=1_eyxlu0a8" width="400" height="285" allowfullscreen webkitallowfullscreen mozAllowFullScreen allow="autoplay *; fullscreen *; encrypted-media *" sandbox="allow-forms allow-same-origin allow-scripts allow-top-navigation allow-pointer-lock allow-popups allow-modals allow-orientation-lock allow-popups-to-escape-sandbox allow-presentation allow-top-navigation-by-user-activation" frameborder="0" title="Kaltura Player"></iframe>
</div>


<div style="max-width:608px"><div style="position:relative;padding-bottom:66.118421052632%"><iframe id="kaltura_player" src="https://cdnapisec.kaltura.com/p/2358381/sp/235838100/embedIframeJs/uiconf_id/43030021/partner_id/2358381?iframeembed=true&playerId=kaltura_player&entry_id=1_uyzwsf3w&flashvars[streamerType]=auto&amp;flashvars[localizationCode]=en&amp;flashvars[leadWithHTML5]=true&amp;flashvars[sideBarContainer.plugin]=true&amp;flashvars[sideBarContainer.position]=left&amp;flashvars[sideBarContainer.clickToClose]=true&amp;flashvars[chapters.plugin]=true&amp;flashvars[chapters.layout]=vertical&amp;flashvars[chapters.thumbnailRotator]=false&amp;flashvars[streamSelector.plugin]=true&amp;flashvars[EmbedPlayer.SpinnerTarget]=videoHolder&amp;flashvars[dualScreen.plugin]=true&amp;flashvars[Kaltura.addCrossoriginToIframe]=true&amp;&wid=1_84f1fsp1" width="608" height="402" allowfullscreen webkitallowfullscreen mozAllowFullScreen allow="autoplay *; fullscreen *; encrypted-media *" sandbox="allow-forms allow-same-origin allow-scripts allow-top-navigation allow-pointer-lock allow-popups allow-modals allow-orientation-lock allow-popups-to-escape-sandbox allow-presentation allow-top-navigation-by-user-activation" frameborder="0" title="Kaltura Player" style="position:absolute;top:0;left:0;width:100%;height:100%"></iframe></div></div>