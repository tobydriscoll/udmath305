# Structure of solutions

````{proof:definition} Second-order ODE
A {term}`second-order ODE` is an equation of the form

$$
x'' = F(t,x,x'),
$$

to be solved for $x(t)$.
````

:::{note}
Technically, this is not the most general form possible, since an equation in the implicit form $F(t,x,x',x'')=0$ might be impossible to manipulate into an explicit expression for $x''$. We won't be considering such equations.
:::

As with first-order problems, we can learn a little from the trivial case $x''=0$. This ODE implies that $x'$ is constant, so $x(t)=c_1 t + c_2$ for arbitrary constants $c_1,c_2$. While a generalization of this observation is far from obvious at this point, it is nonetheless true.

:::{note}
The general solution of second-order ODE has two integration constants.
:::

As a consequence, we note that two initial conditions are now needed to specify the integration constants to get a unique solution.

````{proof:definition} Second-order IVP
A {term}`second-order IVP` (initial-value problem) is

```{math}
x'' = F(t,x,x'), \quad x(a) = x_0,\, x'(a) = v_0.
```
````

## Linear problems

We will focus on linear problems,

```{math}
:label: secondlin-linear
x'' + p(t)x' + q(t) x = f(t).
```

Equation {eq}`secondlin-linear` is in the form of $\opA[x]=f$ for the linear operator

```{math}
\opA[x] = \ddd{x}{t} + p \dd{x}{t} + q x.
```

We now reap more rewards for using the abstract language of operators with first-order problems, because the connections between general solutions and homogeneous solutions is *exactly the same* as before. In particular, we still have a [theorem](theorem-firstlin-general) and an [algorithm](algorithm-firstlin-solve) that provide a blueprint for the solution:

1. Find the general solution $x_h$ of the associated homogeneous problem $\opA[x]=0$.
2. Find any particular solution $x_p$ of the original $\opA[x]=f$.
3. Add them.
4. If given, use initial conditions to solve for the integration constants.


## Reduction of order

There is, however, a major new wrinkle regarding the homogeneous part of the solution. Suppose that $x_1(t)$ is one homogeneous solution, and we set $x_2(t)=v(t)x_1(t)$ for an undetermined $v(t)$. A little elbow grease shows that 

$$
\opA[vx_1] = x_1 v'' + 2 x_1' v' + p x_1 v' + \opA[x_1].
$$

We assumed that $\opA[x_1]=0$. So we will also get $\opA[x_2]=0$ if

$$
x_1 v'' + 2x_1' v' + p x_1 v' = 0.
$$

This might not look important until we make one more definition, $w=v'$, and rearrange:

$$
w' + \left( 2 \frac{x_1'}{x_1} + p\right) w = 0.
$$

That is a linear, first-order equation for $w$! We can solve that for $w$, then find $v$ by integrating $w$, and then we have a new homogeneous solution, $x_2$. This technique is called **reduction of order**, because we pulled a first-order equation out of a second-order one.

::::{admonition} Example
One solution of 

$$
t^2 x'' + 2t x' + 2x = 0
$$

is $x_1(t)=t$. Find another solution.

:::{dropdown} Solution
Rather than going through the entire process again, let's plug into the formulas. We have $p(t)=2/t$ and $q(t)=2/t^2$. The equation for $w$ is

$$
w' + \left( 2 \frac{1}{t} + \frac{2}{t} \right)w = 0.
$$

Hence

$$
w(t) = \exp \left[ \int -\frac{4}{t}\, dt \right] = Ct^{-4}.
$$

Then we get

$$
v(t) = C\int t^{-4}\, dt = k_1 t^{-3} + k_2.
$$

We only need to get some example of $x_2$, so let's go easy on ourselves and choose $v(t)=t^{-3}$. We finally get

$$
x_2(t) = v(t) x_1(t) = t^{-2}.
$$

You can check that this is indeed a solution to the original homogeneous ODE.
:::
::::

The reduction of order technique suggests an important fact. 

:::{proof:theorem}
The general solution of a homogeneous, linear, second-order ODE is of the form

```{math}
:label: secondlin-genhomog
x_h(t) = c_1 x_1(t) + c_2 x_2(t),
```
for arbitrary constants $c_1$ and $c_2$. 
:::

It's too deep for us to go into a true proof of this theorem. You might be tempted to do another reduction of order starting from $x_2$ in order to get a third solution. Nice try, but you don't get any new terms that change {eq}`secondlin-genhomog`.

<div style="max-width:608px"><div style="position:relative;padding-bottom:66.118421052632%"><iframe id="kaltura_player" src="https://cdnapisec.kaltura.com/p/2358381/sp/235838100/embedIframeJs/uiconf_id/43030021/partner_id/2358381?iframeembed=true&playerId=kaltura_player&entry_id=1_kehj3fgn&flashvars[streamerType]=auto&amp;flashvars[localizationCode]=en&amp;flashvars[leadWithHTML5]=true&amp;flashvars[sideBarContainer.plugin]=true&amp;flashvars[sideBarContainer.position]=left&amp;flashvars[sideBarContainer.clickToClose]=true&amp;flashvars[chapters.plugin]=true&amp;flashvars[chapters.layout]=vertical&amp;flashvars[chapters.thumbnailRotator]=false&amp;flashvars[streamSelector.plugin]=true&amp;flashvars[EmbedPlayer.SpinnerTarget]=videoHolder&amp;flashvars[dualScreen.plugin]=true&amp;flashvars[Kaltura.addCrossoriginToIframe]=true&amp;&wid=1_qyirc924" width="608" height="402" allowfullscreen webkitallowfullscreen mozAllowFullScreen allow="autoplay *; fullscreen *; encrypted-media *" sandbox="allow-forms allow-same-origin allow-scripts allow-top-navigation allow-pointer-lock allow-popups allow-modals allow-orientation-lock allow-popups-to-escape-sandbox allow-presentation allow-top-navigation-by-user-activation" frameborder="0" title="Kaltura Player" style="position:absolute;top:0;left:0;width:100%;height:100%"></iframe></div></div>