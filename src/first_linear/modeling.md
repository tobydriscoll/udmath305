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

# Modeling

First-order ODEs are often used to model situations of growth and decay. The linear problem $x'=ax+f(t)$ is a prototype for many important problems:

Population
: Number $x(t)$ of organisms has a constant net per-capita birth (or death) rate.

Interest
: Money amount $x(t)$ grows at fixed positive interest rate $a$.

Radioactivity
: Mass $x(t)$ of a radioactive isotope decays ($a < 0$).

Pharmacokinetics
: Amount or concentration $x(t)$ of a drug being metabolized in the body.

Newtonian cooling or heating
: Temerature difference $x(t)$ between object and environment decays to zero ($a<0$).

```{note}
In practice, interest rates may be quoted yearly, or quarterly, or according to any other finite time period. The rate in an ODE model is the *continuously compounded* rate.
```

To belabor the point, positive $a$ represents growth and negative $a$ leads to decay. In some contexts the rate $a$ is constant, but this need not be the case.

The units of $dx/dt$ are those of $x$ divided by those of $t$. Let's write these as $X/T$. Added terms all need to have the same units, so both $f(t)$ and $a(t)x$ have those units as well. Consequently $a$ has units $1/T$, and $1/a$ has units of time.

- When $a < 0$, the time $\tau=-1/a$ is the {term}`relaxation time` or *characteristic time*. If there is no forcing, then $x(\tau)= e^{-1} x(0) \approx 0.37 x(0)$.
- In radioactivity it's common to use $t_h=-\ln(2)/a$, which is the {term}`half-life`. That's because $\exp(at_h)=1/2$, so half of the radioactive isotope is depleted in that much time.
- Similarly, in population or another growth situation with $a > 0$, the time $t_D=\ln(2)/a$ is the {term}`doubling time`. Note that populations and interest don't grow arithmetically over fixed time intervals, like in $1,2,3,4,\ldots$, but geometrically, like $1,2,4,8,\ldots$.

## First-order pharmacokinetics

::::{admonition} Example
:class: tip
According to *R. Newton et al., “Plasma and salivary pharmacokinetics of caffeine in man,” European Journal of Clinical Pharmacology 21 (1981), pp. 45–52*, caffeine in the bloodstream approximately satisfies first-order kinetics, though the half-life varies a great deal from one person to the next.

Suppose $t_h=6$ hours. We can calculate $a=-\ln(2)/t_h\approx -0.116$ per hour, and then the predicted effects of one cup of coffee are $x(t) = e^{-0.116t}x(0)$. You can check that an equivalent, more direct expression is

```{math}
x(t) = 2^{-t/t_h} x(0).
```
::::

Pharmaceutical companies need to track the concentration of certain drugs throughout the body in order to determine dosage, toxicity, etc.  This is usually done via a *compartment model*, in which the body is divided into compartments and a balance law is formulated in each compartment to account for the transport, ingestion, and elimination of the drug.

::::{admonition} Example
:class: tip

Consider a simple pill of antihistamine taken by a person.  The pill goes to the GI tract where it dissolves and the antihistamine diffuses through to the bloodstream, and it is then eliminated by chemical reactions or through the kidneys. Let $x(t)$  and $y(t)$ be the concentrations of the drug in the GI tract and the bloodstream, respectively.  Assume the rate of clearance from each compartment is proportional to the drug concentration in that compartment (i.e., first-order kinetics). Assuming the initial concentrations are $x(0)=\alpha$ and $y(0)=0$, find expressions for $x(t)$ and $y(t)$.

:::{dropdown} Solution
Using the given assumptions and mass balances we obtain the system

\begin{align*}
\frac{dx}{dt} & =-k_1 x, \quad x(0)=\alpha,\\
\frac{dy}{dt} & = k_1 x - k_2y, \quad y(0)=0.
\end{align*}

Although this takes the form of a system of two equations for two dependent variables, we can solve them in series. The first equation makes no reference to $y$, so its solution is $x(t)=\alpha \exp(-k_1 t)$. Thus the second ODE becomes

```{math}
y' + k_2 y = k_1 \alpha e^{-k_1t}.
```

The homogeneous solution is $y_h(t)=c_1e^{-k_2 t}$, and we will use the method of undetermined coefficients here. The particular solution should take the form

$$
y_p(t)=B e^{-k_1 t}
$$

This gets plugged into the ODE to obtain

```{math}
(-k_1B e^{-k_1t}) + k_2 (B e^{-k_1 t}) = k_1 \alpha e^{-k_1t},
```

which implies $B=k_1 \alpha/(k_2-k_1)$, provided the rate constants are different. (If not, we would switch to VoP.) Thus

```{math}
y(t) = c_1e^{-k_2 t} + \frac{k_1 \alpha}{k_2-k_1} e^{-k_1 t}. 
```

We find the unknown $c_1$ through the condition

```{math}
0 = y(0) = c_1 + \frac{k_1 \alpha}{k_2-k_1},
```

and finally

```{math}
y(t) = \frac{k_1 \alpha}{k_2-k_1} \left( e^{-k_1 t} - e^{-k_2 t} \right).
```
:::
::::

## Tank reactors

A {term}`continuously stirred tank reactor` (CSTR) appears often in chemical engineering. One ideally assumes that the contents of the tank are mixed perfectly and instantaneously at all times. Then one writes an ODE that expresses mass balance.

```{note}
In CSTR problems the dependent variable can be either mass or concentration. Either is fine, so long as you are consistent. It's much better to understand how to apply the principle of mass conservation than to memorize formulas that might not work for how every problem is presented.
```

::::{admonition} Example
:class: tip
A 200 L tank contains 10 kg of dye. Pure water is added at a rate of 4 L per minute, while the mixture is drained at the same rate. How much dye is in the tank after 10 minutes?

:::{dropdown} Solution
Let $x(t)$ be the mass of dye in the tank. The trick is to realize how rapidly it is being removed, and that depends on the time-varying concentration, $x(t)/200$. Specifically,

```{math}
\dd{x}{t} = - \frac{4 \text{ L}}{\text{minute}} \cdot \frac{x\, \text{ kg}}{200\, \text{ L}} = -0.02 x \text{ kg/min}.
```

So $x(t)=e^{-0.02 t}x(0)$ and $x(10)=10 e^{-0.2}$ kg.
:::
::::

::::{admonition} Example
:class: tip
A 300 gal capacity tank initially holds 100 gal of a brine solution at 1 lb/gal.  A stream of brine at 2 lb/gal is poured into the tank at 3 gal/min, and an exit stream of the well-mixed solution leaves the tank at 2 gal/min.  Find the amount of salt in the tank at the time it is about to overflow.

:::{dropdown} Solution
To write a rate equation for the amount $x(t)$ of salt in the tank at time $t$, we use the principle of conservation of mass. We assume no reaction takes place in the tank, so that up to the moment of overflow we have

```{math}
\text{rate of change of } x = \text{(rate of salt in)} - \text{(rate of salt out)}.
```

Let $V(t)=$ the volume of the mixture at time $t$. Then

\begin{align*}
\text{rate of salt in} & = 2 \text{ lb/gal }\times 3 \text{ gal/min }= 6 \text{ lb/min}\\
\text{rate of salt out} & = \frac{x}{V} \text{ lb/gal }\times 2 \text{ gal/min }= \frac{2}{V}\,x \text{ lb/min.}
\end{align*}

Hence

```{math}
\frac{dx}{dt} = 6 -  \frac{2}{V}\,x.
```

But the volume of the mixture changes as well (rate of change = rate in - rate out):

```{math}
\frac{dV}{dt}= 3 - 2 = 1 \text{ gal/min } \; \Rightarrow\; V(t) = (t+100) \text{ gal, } 
```

where we have used the initial volume (100 gal) for the constant of integration.  Note that the time for overflow is when $V=300$ gal, i.e. 200 min.

The initial amount of salt in the tank is 100 lb.  Using the volume expression, we obtain an IVP for $x(t)$, namely

\begin{align*}
\frac{dx}{dt} & = 6 -  \frac{2}{t+100} x,\quad 0\lt t \le 200,\\
x(0) & = 100.
\end{align*}

The ODE in standard form is

```{math}
x' + \frac{2}{t+100}x = 6,
```

which can be solved by variation of parameters:

\begin{align*}
g(t) & =\exp\left(\int -\frac{2}{t+100}\,dt\right)=(t+100)^{-2}, \\
k(t) & = \int  6(t+100)^2\, dt = 2(t+100)^3,  \\
x(t) & = c_1(t+100)^{-2} + 2(t+100)^{3-2}.
\end{align*}

Using the initial condition, we obtain $c_1=-100^3$. The time of overflow is $t=200$ min, so finally we get

```{math}
x(200)=2(200+100)-\frac{100^3}{(200+100)^2}=\frac{5300}{9}\approx 589 \text{ lb.}
```
:::
::::

::::{admonition} Example
:class: tip

A well-circulated lake contains 1000 kL of water that is initially at a concentration of 2 kg/kL of a pollutant.  Water from the effluent of a factory enters the lake at the rate of 5 kL/h with a concentration of 7 kg/kL of the pollutant.  Polluted water flows out of the lake through an outlet at the rate of 2 kL/h.  Determine the amount of pollutant in the lake as a function of time. (Ignore the fact that the lake may eventually overflow, as we are interested in a relatively short time.)

:::{dropdown} Solution
It's clear that given the net fluid inflow rate of 3 kL/h, the lake volume is given by $V(t)=1000 + 3t$ kL at time $t$ hours. Let $x(t)$ be the mass of pollutant in the lake at $t$ hours in kg/kL. Mass conservation implies

```{math}
\frac{dx}{dt} \text{ kg/h} = (5)(7) \text{ kg/h} - 2 \frac{x}{V} \text{ kg/h},
```

or

```{math}
x' + \frac{2x}{3t+1000}  = 35.
```

This equation readily solved through variation of parameters:

\begin{align*}
g(t) & =\exp\left(\int -\frac{2}{3t+1000}\,dt\right)=(3t+1000)^{-2/3}, \\
k(t) & = \int  35(3t+1000)^{2/3} \, dt = 7(3t+1000)^{5/3},  \\
x(t) & = c_1(3t+1000)^{-2/3} + 7(3t+1000).
\end{align*}

The initial condition is that $x(0)/V(0)=2$, so

```{math}
2 = \frac{c_1\cdot(1000)^{-2/3} + 7000}{1000},
```

which implies $c_1=-5(1000)^{5/3}=-5\times 10^5$. Thus

```{math}
x(t)=7(3t+1000) - \frac{5\times 10^5}{(3t+1000)^{2/3}} \; \text{kg/kL.}
```
:::
::::

## Cooling and heating

There are formulas to plug and play for this type of problem, but these are not hard to solve directly if you understand how to interpret them.

Suppose an object is put into an environment that is held at constant tempertature $E$. Let $T(t)$ be the temperature of the object. The Newton Cooling Law (which applies equally to heating) states that the difference between $T$ and $E$ decreases at a constant decay rate. Mathematically, if we define $x(t) = T(t) - E$, then

$$
\dd{x}{t} = -k x, \qquad (k>0).
$$

The usual assumption is that $k$ is constant, so the general solution is $x(t)=c_1 e^{-kt}$. Remember that this is the temperature *difference*, so to get the object's temperature, you need to use $T(t) = E + x(t)$.

Numerically you need to know three things to completely know the solution: the initial temperature, the decay rate $k$, and the environmental temperature $E$. If a word problem gives you any three pieces of relevant information, you need to convert them into these three values.

::::{admonition} Example
:class: tip
A mug of coffee at 90 C is put in a room kept at 20 C. After 10 minutes the coffee has cooled by $7$ C. When will the coffee reach 60 C?

:::{dropdown} Solution
In terms of the notation above, we have $E=20$, $T(0)=90$, and $T(10)=90-7=83$. The cooling rate is not yet known. So we have $x(t)=T(t)-20$ and the IVP

```{math}
x' = -kx,\quad x(0)=90-20.
```

This has solution $x(t)=70e^{-kt}$. Now we use the given value of $x(10)=83-20$ to deduce

$$
63 = 70 e^{-10k} \quad \Rightarrow \quad k = \frac{1}{10} \ln\left( \frac{70}{63} \right).
$$

(There's no need to calculate a numerical value for $k$, though if you do, keep at least 4 significant digits for safety. It's a positive value because we put a negative sign into the ODE.)

The problem asks us to find the value of the time $s$ such that $T(s)=60$, which implies $x(s)=40$. Thus

$$
40 = x(s) = 70 \exp(-sk),
$$

which leads to

$$
sk = \ln \left( \frac{70}{40} \right).
$$

Finally,

$$
s = 10 \frac{\ln(7/4)}{\ln(10/9)} \approx 53.1 \text{ min}.
$$
:::
::::

Sometimes you don't need to find the rate constant explicitly because you can manipulate expressions to substitute for it.

::::{admonition} Example
:class: tip
Suppose Fred and Wilma each pour out a mug of coffee that is at 85 degrees C. Assume that the cooling rate in a mug is proportional to the cross-section of the mug's top.Wilma's mug has a diameter that is $\sqrt{2}$ times as large as Fred's. Both mugs are left sitting out for 30 minutes in a room that is at 25${}^\circ$ C, at which point Fred's coffee is at 60 degrees. What is the temperature of Wilma's coffee at the same moment?

:::{dropdown} Solution
Suppose Fred's mug has cooling rate $k$. Since area is proportional to diameter squared, Wilma's mug has a cooling rate $2k$. Define $F(t)$ and $W(t)$ to be the temperatures of the two coffees, and let $x(t)=F(t)-25$, $y(t)=W(t)-25$. We know that $F(0) = W(0) = 85$, or

$$
x(0) = y(0) = 60.
$$

Now $x'=-kx$, so $x(t)=60e^{-kt}$. We could use $F(30)=60$ to find $k$ and proceed from there, but there is a clever shortcut.

Note that $y'=-2ky$, so $y(t)=60e^{-2kt}$. Hence

$$
y(t) = 60 \bigl( e^{-kt} \bigr)^2 = 60 \bigl( x(t)/60 \bigr)^2 = \frac{x(t)^2}{60}.
$$

Since we know that $x(30)=60-25$, we conclude that $y(30)=35^2/60 \approx 20.4$ C, so $W(30) = 25 + y(30) \approx 45.4$ degrees.
:::
::::

<div style="max-width:608px"><div style="position:relative;padding-bottom:66.118421052632%"><iframe id="kaltura_player" src="https://cdnapisec.kaltura.com/p/2358381/sp/235838100/embedIframeJs/uiconf_id/43030021/partner_id/2358381?iframeembed=true&playerId=kaltura_player&entry_id=1_ighs0a5i&flashvars[streamerType]=auto&amp;flashvars[localizationCode]=en&amp;flashvars[leadWithHTML5]=true&amp;flashvars[sideBarContainer.plugin]=true&amp;flashvars[sideBarContainer.position]=left&amp;flashvars[sideBarContainer.clickToClose]=true&amp;flashvars[chapters.plugin]=true&amp;flashvars[chapters.layout]=vertical&amp;flashvars[chapters.thumbnailRotator]=false&amp;flashvars[streamSelector.plugin]=true&amp;flashvars[EmbedPlayer.SpinnerTarget]=videoHolder&amp;flashvars[dualScreen.plugin]=true&amp;flashvars[Kaltura.addCrossoriginToIframe]=true&amp;&wid=1_vvkhtlv5" width="608" height="402" allowfullscreen webkitallowfullscreen mozAllowFullScreen allow="autoplay *; fullscreen *; encrypted-media *" sandbox="allow-forms allow-same-origin allow-scripts allow-top-navigation allow-pointer-lock allow-popups allow-modals allow-orientation-lock allow-popups-to-escape-sandbox allow-presentation allow-top-navigation-by-user-activation" frameborder="0" title="Kaltura Player" style="position:absolute;top:0;left:0;width:100%;height:100%"></iframe></div></div>