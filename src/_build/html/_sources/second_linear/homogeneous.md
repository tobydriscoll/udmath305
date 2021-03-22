# Homogeneous solutions

The linear second-order problem $\opA[x]=f$ has a nice structure, but only a few such problems are straightforward to solve. We will now, and for the rest of the chapter, limit ourselves to the {term}`constant-coefficient` problem

```{math}
:label: secondlin-linear-cc
x'' + bx' + k x = f(t),
```

in which $b$ and $k$ are constant, and $f(t)$ is a forcing function.

:::{note}
In {eq}`secondlin-linear-cc` the coefficient $b$ has units $1/T$, the coefficient $k$ has units $1/T^2$, and $f(t)$ has units $X/T^2$, where $X$ and $T$ are the units of $x$ and $t$, respectively.
:::

We start with solutions of the homogeneous equation

$$
x'' + b x' +  k x = 0.
$$

We will use $x_h$ to name the general solution, as a reminder that the ODE is homogeneous.

All the solutions to first-order linear ODEs were exponential functions. The same is true for second-order linear problems, though with a significant caveat.

## Characteristic polynomial

The king of ODE solution methods is to guess the answer and then show that it works. In that tradition, we try

$$
x_h(t) = e^{\lambda t}
$$

for a to-be-determined value of $\lambda$. We substitute it into the ODE and get

\begin{align*}
0 &= \lambda^2 e^{\lambda t} + b \bigl(\lambda e^{\lambda t}\bigr) + k \bigl(e^{\lambda t}\bigr)\\ 
&= e^{\lambda t} \bigl(\lambda^2 + b \lambda + k \bigr).
\end{align*}

We therefore know that $x_h$ is a homogeneous solution provided that $\lambda^2 + b \lambda + k =0$.

````{proof:definition} Characteristic polynomial of a linear ODE
The {term}`characteristic polynomial` of the linear operator $\opA[x]=x''+bx'+kx$ is

$$
p(s) = s^2 + b s + k.
$$

Its roots are called the {term}`characteristic values` of $\opA$. For brevity, we will often refer to these as simply the **roots** of $\opA$, although this usage is not standard.
````

:::{note}
We earlier used the term *characteristic polynomial* with matrices. The connection goes way beyond the name, as we will see in the future.
::: 


(theorem-secondlin-homogeneous-distinct)=

````{proof:theorem} Homogeneous solution, distinct roots
Let $\lambda_1,\lambda_2$ be the characteristic values of $\opA$, where $\opA[x]=x''+bx'+kx.$ If  $\lambda_1\neq \lambda_2$, then the general solution of $\opA[x]= 0$ is

```{math}
:label: secondlin-homogeneous-distinct
x_h(t) = c_1 e^{\lambda_1 t} + c_2 e^{\lambda_2 t}.
```
````

By analogy with linear algebra, we may say that $e^{\lambda_1 t}$ and $e^{\lambda_2 t}$ form a basis for the homogeneous solution, as all such solutions are a linear combination of them and neither can be omitted.

We have to handle the case $\lambda_1=\lambda_2$ separately. (You might recall that a double eigenvalue was a hassle for matrices as well.) Without fuss, we jump to the result, which is easy to derive via reduction of order.

(theorem-secondlin-homogeneous-repeated)=

````{proof:theorem} Homogeneous solution, repeated root
Let $\lambda$ be a double root of $\opA$, where $\opA[x]=x''+bx'+kx.$ The general solution of $\opA[x]= 0$ is

```{math}
:label: secondlin-homogeneous-repeated
x_h(t) = e^{\lambda t} \bigl( c_1 t + c_2 \bigr).
```
````

::::{admonition} Example
:class: tip
We could think of the trivial problem $x''=0$ as being linear with $b=k=0$. The characteristic polynomial is $s^2$, which makes zero a double root. So the general solution is

$$
x_h(t) = e^{0t} (c_1 t + c_2) = c_1 t + c_2,
$$

which is obvious in retrospect.
::::

::::{admonition} Example
:class: tip
Find the general solution of $x''-x'-2x=0$.

:::{dropdown} Solution
The characteristic polynomial is $s^2-s-2$, which has roots $\lambda_1=-1$, $\lambda_2=2$. This gives the general solution $x_h(t)=c_1 e^{-t} + c_2 e^{2t}$.
:::
::::

::::{admonition} Example
:class: tip
Solve the IVP $x'' - 5 x = 0$, $x(0)=6$, $x'(0)=0$.

:::{dropdown} Solution
The roots of $s^2-5$ are $\lambda_1=\sqrt{5}$, $\lambda_2=-\sqrt{5}$. The general solution is

$$
x(t) = c_1 e^{\sqrt{5}\, t} + c_2 e^{-\sqrt{5}\, t}.
$$

The initial conditions lead to

\begin{align*}
6 &= x(0) = c_1 e^0 + c_2 e^0 = c_1 + c_2, \\ 
0 &= x'(0) = \sqrt{5} c_1 e^0 - \sqrt{5} c_2 e^0 = \sqrt{5}(c_1-c_2).
\end{align*}

It's easy to conclude from here that $c_1=c_2=3$. In general we might have to solve a $2\times 2$ linear algebraic system for the constants.
:::
::::

## Complex characteristic values

All seems well, until you remember that the roots of a real quadratic polynomial may come as a complex conjugate pair. What then are we to make of {eq}`secondlin-homogeneous-distinct` or {eq}`secondlin-homogeneous-repeated`? That's what makes second-order problems really different from first-order ones, and we tackle it next.

<div style="max-width:608px"><div style="position:relative;padding-bottom:66.118421052632%"><iframe id="kaltura_player" src="https://cdnapisec.kaltura.com/p/2358381/sp/235838100/embedIframeJs/uiconf_id/43030021/partner_id/2358381?iframeembed=true&playerId=kaltura_player&entry_id=1_bfvpfc0l&flashvars[streamerType]=auto&amp;flashvars[localizationCode]=en&amp;flashvars[leadWithHTML5]=true&amp;flashvars[sideBarContainer.plugin]=true&amp;flashvars[sideBarContainer.position]=left&amp;flashvars[sideBarContainer.clickToClose]=true&amp;flashvars[chapters.plugin]=true&amp;flashvars[chapters.layout]=vertical&amp;flashvars[chapters.thumbnailRotator]=false&amp;flashvars[streamSelector.plugin]=true&amp;flashvars[EmbedPlayer.SpinnerTarget]=videoHolder&amp;flashvars[dualScreen.plugin]=true&amp;flashvars[Kaltura.addCrossoriginToIframe]=true&amp;&wid=1_k2ba9qa3" width="608" height="402" allowfullscreen webkitallowfullscreen mozAllowFullScreen allow="autoplay *; fullscreen *; encrypted-media *" sandbox="allow-forms allow-same-origin allow-scripts allow-top-navigation allow-pointer-lock allow-popups allow-modals allow-orientation-lock allow-popups-to-escape-sandbox allow-presentation allow-top-navigation-by-user-activation" frameborder="0" title="Kaltura Player" style="position:absolute;top:0;left:0;width:100%;height:100%"></iframe></div></div>