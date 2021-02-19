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
# Variation of parameters

The [preceding section](homogeneous) explained how to find the general solution $x_h(t)$ of a homoegenous linear system $\bfA\bfx=\bfzero$. The next step of our [overall solution strategy](algorithm-firstlin-solve) is to find any particular solution of $\opA[x]=f$ for a given $f(t)$.

The form of the homogeneous solution is

$$
x_h(t) = c_1 g(t),
$$

where $c_1$ is an arbitrary constant and $g(t)$ is computed as the exponentiation of an integral. Let's see what happens if we replace the constant by an unknown function of $t$, $x_p(t)=k(t)g(t)$:

\begin{align*}
\opA[x_p] &= x_p' - a(t) x_p \\ 
& = (k'g+kg') - a k g \\ 
& = k'g + k(g'-ag) \\ 
&= k'g + k\cdot\opA[g].
\end{align*}

However, $g$ is itself a homogeneous solution, so all that remains is $k'g$. We therefore make $x_p$ a particular solution if we set $f=k'g$. This lets us solve for the unknown $k(t)$ by taking $k'(t)=f(t)/g(t)$ and integrating. The result is known as the {term}`variation of parameters` formula (or VoP formula for short). We collect all the equations here, including the homogeneous and general solutions.

(formula-firstlin-varpar)=

````{proof:formula} Variation of parameters
To find a particular solution $x_p$ of $\opA[x]=f$, compute
\begin{align*}
g(t) &= \exp\left[ \int a(t)\, dt\right], \\ 
k(t) &= \int \frac{f(t)}{g(t)}\, dt, \\
x_p(t) &= k(t)g(t), \\
x(t) &= c_1g(t) + x_p(t).
\end{align*}
````

:::{note}
The integration constants you would normally get from the indefinite integrals in the [VoP formula](formula-firstlin-homogeneous) can be ignored (i.e., set to zero), as they make no meaningful difference in the final result. They are "absorbed" into $c_1$.
:::

(example-firstlin-nonhomog)=

::::{admonition} Example
:class: tip
Solve $3x'=12x+24t$. 
:::{dropdown} Solution
Rewriting the ODE as $x'-4x=8t$, we identify $a(t)=4$ and $f(t)=8t$. Then

```{math}
g(t) = \exp\left[ \int 4\,dt \right] = e^{4t},
```

and

```{math}
k(t) = \int \frac{8t}{e^{4t}}\, dt = -\frac{1}{2} (4t+1)e^{-4t},
```

where you need integration by parts (or a computer) to perform the integral. Hence

```{math}
x_p(t) = \left[ \frac{1}{2} (4t+1)e^{-4t} \right] e^{4t} = -\frac{1}{2} (4t+1),
```

and the general solution is

```{math}
x(t) = x_h(t) + x_p(t) = c_1 e^{4t} - \frac{1}{2} (4t+1).
```

:::
::::

::::{admonition} Example
:class: tip
Find a particular solution of $x'=2t x + 6t$. 

:::{dropdown} Solution
We start with

```{math}
g(t) = \exp\left[ \int 2t\, dt \right] = e^{t^2}.
```

Then we can compute

```{math}
k(t) = \int \frac{6t}{e^{t^2}}\, dt  = -3 e^{-t^2}.
```

Finally,

```{math}
x_p(t) = k(t) g(t) = -3,
```

and the general solution is $x(t)=c_1 e^{t^2}-3$.

:::
::::


::::{admonition} Example
:class: tip
Solve the IVP

$$
(2+t) x'= x - 1, \quad x(0) = -5.
$$
:::{dropdown} Solution
First we put the ODE into our standard form,

```{math}
x' - \frac{1}{2+t} x = -\frac{1}{2+t}.
```

Then

```{math}
g(t) = \exp\left[ \int \frac{1}{2+t}\, dt \right] = \exp[ \ln(2+t) ] = 2+t.
```

Next,

```{math}
k(t) = \int \frac{-1}{2+t} (2+t)^{-1} \, dt = (2+t)^{-1},
```

so that the general solution is

```{math}
x(t) = c_1 (2+t) + (2+t)^{-1} (2+t) = c_1(2+t)+1.
```

Finally, we apply the initial condition to solve for $c_1$:

$$
-5 = x(0) = 2c_1+1 \quad \implies \quad c_1=-3.
$$

Hence $x(t) = 1-3(2+t) = -5-3t.$
:::
::::

```{attention}
It takes a pretty special relationship between $a(t)$ and $f(t)$ to make the integrals in the VoP formula reasonable to do by hand. Consequently, if you are asked in an exercise to produce a solution and make a mistake, you will likely wind up with an integral that is virually impossible to evaluate.
```

<div style="max-width:608px"><div style="position:relative;padding-bottom:66.118421052632%"><iframe id="kaltura_player" src="https://cdnapisec.kaltura.com/p/2358381/sp/235838100/embedIframeJs/uiconf_id/43030021/partner_id/2358381?iframeembed=true&playerId=kaltura_player&entry_id=1_nrwftuvy&flashvars[streamerType]=auto&amp;flashvars[localizationCode]=en&amp;flashvars[leadWithHTML5]=true&amp;flashvars[sideBarContainer.plugin]=true&amp;flashvars[sideBarContainer.position]=left&amp;flashvars[sideBarContainer.clickToClose]=true&amp;flashvars[chapters.plugin]=true&amp;flashvars[chapters.layout]=vertical&amp;flashvars[chapters.thumbnailRotator]=false&amp;flashvars[streamSelector.plugin]=true&amp;flashvars[EmbedPlayer.SpinnerTarget]=videoHolder&amp;flashvars[dualScreen.plugin]=true&amp;flashvars[Kaltura.addCrossoriginToIframe]=true&amp;&wid=1_of55vvzh" width="608" height="402" allowfullscreen webkitallowfullscreen mozAllowFullScreen allow="autoplay *; fullscreen *; encrypted-media *" sandbox="allow-forms allow-same-origin allow-scripts allow-top-navigation allow-pointer-lock allow-popups allow-modals allow-orientation-lock allow-popups-to-escape-sandbox allow-presentation allow-top-navigation-by-user-activation" frameborder="0" title="Kaltura Player" style="position:absolute;top:0;left:0;width:100%;height:100%"></iframe></div></div>