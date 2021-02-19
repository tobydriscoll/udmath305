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

# Quick tour

For this part of the course we will be concerned with a {term}`first-order ODE` (ordinary differential equation) given in the form

```{math}
:label: firstlin-ode
\dd{x}{t} = f(t,x),
```

```{index} dependent variable
```

```{index} independent variable
```

in which the goal is to find the unknown function $x(t)$. We call $x$ the {term}`dependent variable` and $t$ the {term}`independent variable`. We use these particular variables for theoretical discussion, but in practice the variables could be named anything. The term *first-order* indicates that only the first derivative appears and not $x''$, $x'''$, etc.

A {term}`solution` to the ODE is a function $x(t)$ that makes {eq}`firstlin-ode` a true equation when inserted. Finding solutions usually takes some effort (and for most realistic problems it cannot be done at all). However, if someone proposes a solution to you, it's easy to check whether that is the case: substitute it into the ODE and manipulate it until you can ascertain whether the equation holds.

(archetype-constant-change)=

## Constant change

You won't find an ODE easier than

```{math}
\dd{x}{t} = a, 
```

where $a$ is a constant. What kind of function has a constant derivative? A linear function. The solution is $x(t) = at + C$, where $C$ is an arbitrary constant.

In words, the ODE says the solution has a constant rate of change, and therefore the solution must have a constant slope.

This problem is a special case of

$$
\dd{x}{t} = f(t).
$$

Unlike in the general ODE {eq}`firstlin-ode`, the function $f$ here does not depend on the unknown solution. The solution is an indefinite integral, $x(t) = \int f(t) \, dt$. As in the example, this integration produces an arbitrary constant. As simple as this problem is, it reveals an important fact.

```{note}
Solutions of ODEs are not necessarily unique.
```

Let's move one rung up the ladder of complexity.

## Constant growth

Suppose $x(t)$ represents a quantity of something that reproduces itself at a constant rate. In addition to biological agents such as bacteria and infected individuals, this could be upvoted memes on a social network. Mathematically we have a fixed growth rate per capita, i.e.,

$$
\frac{1}{x} \dd{x}{t} = a
$$

for a positive constant $a$. This gives the ODE

```{math}
\dd{x}{t} = ax \qquad (a > 0). 
```

It's trivial to check that

$$
x(t) = C e^{at}
$$

is a solution for any constant $C$. This reveals unbounded exponential growth in the solution as $t\to\infty$.

Again in this case we got an integration constant, although this time it appears multiplicatively rather than additively. That is, the {term}`general solution` of the ODE is an entire family of functions describing many particular solutions.

```{tip}
A named quantity such as $a$ that is neither the independent nor the dependent variable is often called a {term}`parameter`. A parameter is assumed to be constant unless it is written, e.g., as $a(t)$ to show the dependence on $t$. A convention is to make parameters be positive where reasonable, a negative value would include an explicit sign such as in $-a$.
```

## Constant decay

Now consider

```{math}
\dd{x}{t} = -ax  \qquad (a > 0). 
```

This is constant per capita decay, which is true of radioactive isotopes and organism populations dying faster than they can breed. The general solution is 

$$
x(t) = C e^{-at},
$$

which is exponential decay to zero as $t\to\infty$.

In this and the preceding archetype, the function $f$ in {eq}`firstlin-ode` depends only on the solution $x$ and not explicitly on the independent variable $t$. Such an ODE is called {term}`autonomous` or time-invariant.

Our next case study is not an autonomous equation.

## Variable growth/decay

Compare

```{math}
\dd{x}{t} = 2tx
```

to the case of constant growth, $x'=ax$. We could say that $2t$ plays the role of the growth rate $a$ here, i.e., this is a situation of accelerating growth. The general solution is

$$
x(t) = C e^{t^2},
$$

which indeed grows superexponentially as $t\to\infty$. More general variable growth looks like $x'=a(t)x$. If $a$ changes sign, the character of the equation flips between momentary growth and decay.

All of the examples so far have had an ODE in the form

```{math}
:label: firstlin-linear
\dd{x}{t} = a(t) x + b(t),
```

in which the dependent variable appears just as itself to the first power (if at all). This is called a *linear* first-order ODE.

Our final archetype breaks this mold.

## Nonlinear growth

Comparing

$$
\dd{x}{t} = x^2
$$

to constant growth $x'=ax$, it is irresistable to interpret this equation as a growth process whose rate at any instant is the momentary value of the solution. This suggests a kind of runaway feedback process.

The general solution is

$$
x(t) = \frac{1}{C-t},
$$

as you should verify through substitution:

$$
\dd{x}{t} = -(C-t)^{-2}\cdot \dd{}{t}(C-t) = (C-t)^{-2} = x^2.
$$

Note that for $C>0$, $x\to \infty$ as $t\to C^{-}$. This is a finite-time blowup, which we did not observe in any of the linear growth processes.

```{note}
You might rightly wonder about the validity of a mathematical model that leads to an infinite result in finite time. But this particular ODE describes, for instance, the evolution of the slope of the line of sight to an airplane flying straight over you. When the airplane is directly overhead, the slope is infinite. So while the model becomes mathematically invalid at that moment, it does describe a concrete physical situation.
```

That concludes the movie trailer for first-order equations. We'll have our hands full understanding how to solve linear problems, so we will not return to nonlinear problems for a while.

<div style="max-width:608px"><div style="position:relative;padding-bottom:66.118421052632%"><iframe id="kaltura_player" src="https://cdnapisec.kaltura.com/p/2358381/sp/235838100/embedIframeJs/uiconf_id/43030021/partner_id/2358381?iframeembed=true&playerId=kaltura_player&entry_id=1_lqfvrc0t&flashvars[streamerType]=auto&amp;flashvars[localizationCode]=en&amp;flashvars[leadWithHTML5]=true&amp;flashvars[sideBarContainer.plugin]=true&amp;flashvars[sideBarContainer.position]=left&amp;flashvars[sideBarContainer.clickToClose]=true&amp;flashvars[chapters.plugin]=true&amp;flashvars[chapters.layout]=vertical&amp;flashvars[chapters.thumbnailRotator]=false&amp;flashvars[streamSelector.plugin]=true&amp;flashvars[EmbedPlayer.SpinnerTarget]=videoHolder&amp;flashvars[dualScreen.plugin]=true&amp;flashvars[Kaltura.addCrossoriginToIframe]=true&amp;&wid=1_2yhmjcr4" width="608" height="402" allowfullscreen webkitallowfullscreen mozAllowFullScreen allow="autoplay *; fullscreen *; encrypted-media *" sandbox="allow-forms allow-same-origin allow-scripts allow-top-navigation allow-pointer-lock allow-popups allow-modals allow-orientation-lock allow-popups-to-escape-sandbox allow-presentation allow-top-navigation-by-user-activation" frameborder="0" title="Kaltura Player" style="position:absolute;top:0;left:0;width:100%;height:100%"></iframe></div></div>