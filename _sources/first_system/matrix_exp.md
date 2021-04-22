# The matrix exponential

As we well know by now, the solution of the scalar linear IVP $x'=ax$, $x(0)=x_0$ is 

$$
x(t) = e^{at} x_0.
$$

Wouldn't it be interesting if in the vector case $\mathbf{x}'=\mathbf{A} \mathbf{x}$, $\bfx(0)=\bfx_0$, we could write

$$
\bfx(t) = e^{\bfA t} \bfx_0 ?
$$

Funny you should ask. 

## Definition

We know the Taylor series 

:::{math}
e^{at} = 1 + at + \frac{1}{2!}(at)^2 + \frac{1}{3!} (at)^3 + \cdots.
:::

This series can be generalized directly to a square matrix $\mathbf{A}$, for which integer powers are possible:

:::{math}
:label: fs-eq-matrixexp
e^{t\mathbf{A}} = \mathbf{I} + t\mathbf{A} + \frac{1}{2!}t^2 \mathbf{A}^2 + \frac{1}{3!} t^3 \mathbf{A}^3 + \cdots.
:::

Let's not worry too much about whether this converges (it does). What are its properties? 

(fs-thm-matrixexp)=
::::{proof:theorem} Matrix exponential
Let $\mathbf{A},\mathbf{B}$ be $n\times n$ matrices. Then 

1. $e^{t\mathbf{A}}=\mathbf{I}$ if $t=0$,
2. $\displaystyle \dd{}{t}e^{t\mathbf{A}} = \mathbf{A} e^{t\mathbf{A}} = e^{t\mathbf{A}}\mathbf{A}$,
3. $[e^{t\mathbf{A}}]^{-1} = e^{-t\mathbf{A}}$,
4. $e^{(s+t)\mathbf{A}} = e^{s\bfA} \cdot e^{t\bfA} = e^{t\bfA} \cdot e^{s\bfA}$
5. If $\mathbf{A}\mathbf{B}=\mathbf{B}\mathbf{A}$, then $e^{t(\mathbf{A}+\mathbf{B})} = e^{t\mathbf{A}}\cdot e^{t\mathbf{B}} = e^{t\mathbf{B}}\cdot e^{t\mathbf{A}}$.
::::

These conclusions follow pretty easily from the series definition {eq}`fs-eq-matrixexp`. They are all essential to what we normally expect from an exponential function, although in the last case we had to restrict the applicability.

From these properties we can make the connection to the IVP.

```{proof:theorem}
If $\bfA$ is a constant square matrix, then

$$
\bfx(t) = e^{t \bfA} \bfx_0
$$

solves the initial-value problem $\mathbf{x}'=\mathbf{A} \mathbf{x}$, with $\bfx(0)=\bfx_0$.
```

```{proof:proof}
With $\bfx$ as defined in the theorem statement, we calculate

$$
\dd{}{t} \bfx(t) = \Bigl( \dd{}{t}e^{t \bfA} \Bigr) \bfx_0 =  \mathbf{A} e^{t\mathbf{A}} \bfx_0 = \bfA \bfx(t),
$$

using property 2 above. Furthermore,

$$
\bfx(0) = e^{0 \bfA} \bfx_0 = \meye \bfx_0 = \bfx_0,
$$

using property 1 above.
```

## Connection to fundamental matrices

We already had a solution procedure for $\mathbf{x}'=\mathbf{A} \mathbf{x}$ with $\bfx(0)=\bfx_0$. We use a fundamental matrix to write the general solution $\bfx = \mathbf{X}(t) \mathbf{c}$, then apply the initial condition to get 

$$
\mathbf{x}_0 = \mathbf{x}(0) = \mathbf{X}(0) \mathbf{c}.
$$

This is a linear system that can be solved for $\mathbf{c}$ using a matrix inverse, leading to

$$
\bfx(t) = \mathbf{X}(t) \mathbf{X}(0)^{-1} \bfx_0.
$$

Since the solution of an IVP is unique (and the matrices here are invertible), we get the following useful result.

::::{proof:formula} Matrix exponential
If $\mathbf{X}(t)$ is any fundamental matrix for $\bfx'=\bfA\bfx$, then 

$$
e^{t\bfA} = \mathbf{X}(t) \mathbf{X}(0)^{-1}.
$$
::::

This formula is one way to avoid the rather daunting prospect of having to sum an infinite series of matrices.

::::{admonition} Example
:class: tip
Given 

:::{math}
\mathbf{A} = \twomat{1}{1}{4}{1}
:::

and the eigenpairs $\lambda_1=3$, $\mathbf{v}_1 = \twovec{1}{2}$ and $\lambda_2=-1$, $\mathbf{v}_2=\twovec{1}{-2}$, find $e^{t\mathbf{A}}$.

:::{dropdown} Solution
We start with the fundamental matrix

$$
\mathbf{X}(t) = \begin{bmatrix} e^{3t} \mathbf{v}_1 & e^{-t} \mathbf{v}_2 \end{bmatrix}
= \twomat{e^{3t}}{e^{-t}}{2e^{3t}}{-2e^{-t}}.
$$

Now we find

$$
\mathbf{X}(0)^{-1} = \twomat{1}{1}{2}{-2}^{-1} = \frac{1}{-4} \twomat{-2}{-1}{-2}{1}.
$$

Thus

$$
e^{t\mathbf{A}} = \frac{1}{4} \twomat{e^{3t}}{e^{-t}}{2e^{3t}}{-2e^{-t}} 
\twomat{2}{1}{2}{-1} = \frac{1}{4} \twomat{2e^{3t}+2e^{-t}}{e^{3t}-e^{-t}}{4e^{3t}-4e^{-t}}{2e^{3t}+2e^{-t}} .
$$
:::

::::

::::{admonition} Example
:class: tip
Given that 

:::{math}
\mathbf{A} = \twomat{1}{-1}{5}{-3}
:::

has the eigenpairs 

:::{math}
\lambda = -1\pm i, \; \mathbf{v} = \twovec{1}{2\mp i},
:::

find $e^{t\bfA}$ and the solution of the IVP $\bfx'=\mathbf{A}\bfx$, $\bfx(0)=\twovec{2}{1}$.

:::{dropdown} Solution
For $\lambda=-1+ i$, an eigenvector is

$$
\twovec{1}{2} + i\,\twovec{0}{-1}.
$$

Therefore we can construct a fundamental matrix from the columns

$$
\bfx_1(t) = e^{-t} \left(\cos(t) \twovec{1}{2} - \sin(t) \twovec{0}{-1}\right), \qquad \bfx_2(t) = e^{-t} \left(\cos(t) \twovec{0}{-1} + \sin(t) \twovec{1}{2}\right).
$$

Hence

$$
\mathbf{X}(0)^{-1} = \twomat{1}{0}{2}{-1}^{\,-1} = -1 \twomat{-1}{0}{-2}{1} = \twomat{1}{0}{2}{-1}.
$$

We can now compute

\begin{align*}
e^{t\bfA} &= e^{-t}\twomat{\cos(t)}{\sin(t)}{2\cos(t)+\sin(t)}{2\sin(t)-\cos(t)} \twomat{1}{0}{2}{-1}\\[0.5ex]
& = e^{-t}\twomat{\cos(t)+2\sin(t)}{-\sin(t)}{5\sin(t)}{\cos(t)-2\sin(t)}.
\end{align*}

Finally, then,

$$
\bfx(t) = e^{t\bfA} \bfx(0) = e^{-t}\twomat{\cos(t)+2\sin(t)}{-\sin(t)}{5\sin(t)}{\cos(t)-2\sin(t)} \twovec{2}{1} = e^{-t} \twovec{2\cos(t)+2\sin(t)}{\cos(t)+8\sin(t)}. 
$$

<!-- Begin with 

$$
\mathbf{X}(t) = e^{-t} \twomat{e^{it}}{e^{-it}}{(2-i)e^{it}}{(2+i)e^{-it}},
$$

from which

$$
\mathbf{X}(0)^{-1} =\twomat{1}{1}{2-i}{2+i}^{-1} = \frac{1}{2+i-2+i}\, \twomat{2+i}{-1}{-2+i}{1} = \frac{i}{2}\, \twomat{-2-i}{1}{2-i}{-1}.
$$

Then 

\begin{align*}
e^{t \mathbf{A}} & = \frac{i}{2} e^{-t} \,\twomat{e^{it}}{e^{-it}}{(2-i)e^{it}}{(2+i)e^{-it}}\, \twomat{-2-i}{1}{2-i}{-1} \\[1mm]
& = \frac{i}{2}e^{-t}\,  \twomat{-(2+i)e^{it}+(2-i) e^{-it}}{e^{it}-e^{-it}}{-(2-i)(2+i)e^{it}+(2+i)(2-i) e^{-it}}{(2-i)e^{it}-(2+i) e^{-it}}.
\end{align*}

Fear not! Each element of the matrix has the same form,

$$
z - \overline{z} = 2i \operatorname{Im}(z).
$$

We can factor out the $2i$, combining it with the $i/2$ in front, and then just compute an imaginary part for each element. For instance,

$$
-(2+i)e^{it} = (-2-i)[ \cos(t)+i\sin(t) ] = [ \text{real stuff} ] + i[ -\cos(t) -2\sin(t) ].
$$

Following this template, we get

$$
e^{t \mathbf{A}} = -e^{-t} \twomat{-\cos(t)-2\sin(t)}{\sin(t)}{-5\sin(t)}{-\cos(t)+2\sin(t)}.
$$

Finally, the IVP solution is

$$
\begin{split}
\bfx(t) = e^{t \mathbf{A}} \bfx_0 &= -e^{-t} \twomat{-\cos(t)-2\sin(t)}{\sin(t)}{-5\sin(t)}{-\cos(t)+2\sin(t)} \twovec{2}{1} \\[2mm]
&= e^{-t} \, \twovec{2\cos(t)+3\sin(t)}{\cos(t) + 8\sin(t)}.
\end{split}
$$

Whee! -->
:::
::::

## Defective matrix case

There is one situation in $\bfx'=\bfA \bfx$ for which we have not yet produced a fundamental matrix in the constant-coefficient case: when $\bfA$ is defective. It's complicated to spell out what happens in full generality, but it's easily managed for the $2\times 2$ case.

{numref}`Theorem {number}<thm-la-2x2defective>` states that for a $2\times 2$ matrix with a repeated eigenvalue, the matrix is either a multiple of the identity, or defective. In the latter case, something useful happens, which we state without proof.

:::{proof:theorem}
If $\mathbf{A}$ is a defective $2\times 2$ matrix with double eigenvalue $\lambda$, then $(\mathbf{A}-\lambda \mathbf{I})^2= \boldsymbol{0}$.
:::

Note that by part 5 of the matrix exponential properties theorem above,

$$
e^{t\mathbf{A}} = e^{t\lambda\mathbf{I}} \,  e^{t(\mathbf{A}-\lambda \mathbf{I})}.
$$

For the first right-side term we get

$$
e^{t\lambda\mathbf{I}} = \mathbf{I} + t\lambda \mathbf{I} + \frac{1}{2!}(t\lambda)^2 \mathbf{I}^2 + \cdots = \bigl(1 + t\lambda + \frac{1}{2!}(t\lambda)^2 + \cdots\bigr)\, \mathbf{I} = 
e^{t\lambda} \mathbf{I},
$$

and for the second term we get a power series that truncates after two terms:

$$
e^{t(\mathbf{A}-\lambda \mathbf{I})} = \mathbf{I} + t(\mathbf{A}-\lambda \mathbf{I}) + \frac{1}{2!}t^2 (\mathbf{A}-\lambda \mathbf{I})^2 + \cdots.
$$

Thus we arrive at the following.

::::{proof:formula} Matrix exponential for $2\times 2$ defective

:::{math}
:label: ls-2x2exp-defective
e^{t\mathbf{A}} = \bigl( e^{t\lambda} \meye \bigr) \,  \bigl( \mathbf{I} + t(\mathbf{A}-\lambda \mathbf{I}) \bigr)  =  e^{t\lambda} \bigl( \mathbf{I} + t(\mathbf{A}-\lambda \mathbf{I}) \bigr).
:::

::::

::::{admonition} Example
:class: tip
Find $e^{t\mathbf{A}}$ if $\bfA=\twomat{4}{1}{0}{4}$.

:::{dropdown} Solution
You can check that $\lambda=4$ is the only eigenvalue, with algebraic multiplicity equal to 2. By inspection, then, it is defective. Hence

$$
e^{t\mathbf{A}} =  e^{4t} \bigl() \mathbf{I} + t\, \twomat{0}{1}{0}{0} \bigr)
= e^{4t} \twomat{1}{t}{0}{1}.
$$
:::
::::

::::{admonition} Example
:class: tip
A critically damped free oscillator with natural frequency $\omega_0$ is equivalent to a system with the matrix

$$
\bfA = \twomat{0}{1}{-\omega_0^2}{-2\omega_0}.
$$

The characteristic polynomial is $\lambda^2 + 2\omega_0\lambda + \omega_0^2$, which has the double root $\lambda=-\omega_0$. Clearly this matrix is not a multiple of $\meye$, so it is defective. We compute

$$
\bfA - \lambda\meye = \twomat{\omega_0}{1}{-\omega_0^2}{-\omega_0}.
$$

This gives the exponential

$$
e^{t\mathbf{A}} = e^{-t\omega_0} \twomat{1+t\omega_0}{t}{-t\omega_0^2}{1-t\omega_0},
$$

which is a fundamental matrix. The oscillator position is the first component of the general solution,

$$
e^{-t\omega_0}[ c_1 (1+t\omega_0) + c_2 t],
$$

which is equivalent to the general solution we saw before for this problem, $e^{-t\omega_0}(c_1+c_2t)$.
::::

## Propagators

Obviously the formulas lead to some intense algebra for particular examples, even in the $2\times 2$ case. A computer can handle it, but the elementwise expressions get tediously long in all but special cases. 

The theoretical implications are more significant. The interpretation of $e^{t\bfA}$ in the ODE context is that it transforms a vector initial condition to the solution vector at a time $t$. This is a linear operator; the solutions of linear equations behave linearly.

Property 3 above implies that to invert that transformation, you can use $e^{-t\bfA}$, which is the same as running the ODE in "negative time." More formally, it's a statement about *time reversibility*. 

Property 4 above implies that the evolution at time $t+s$ is equivalent to evolving by time $t$, then by time $s$ (or vice versa). This is a statement about *time invariance*. A linear equation with a non-constant coefficient matrix also has a propagator matrix, but it's not a matrix exponential, and the time invariance is broken.

<div style="max-width:608px"><div style="position:relative;padding-bottom:66.118421052632%"><iframe id="kaltura_player" src="https://cdnapisec.kaltura.com/p/2358381/sp/235838100/embedIframeJs/uiconf_id/43030021/partner_id/2358381?iframeembed=true&playerId=kaltura_player&entry_id=1_iqs5c09n&flashvars[streamerType]=auto&amp;flashvars[localizationCode]=en&amp;flashvars[leadWithHTML5]=true&amp;flashvars[sideBarContainer.plugin]=true&amp;flashvars[sideBarContainer.position]=left&amp;flashvars[sideBarContainer.clickToClose]=true&amp;flashvars[chapters.plugin]=true&amp;flashvars[chapters.layout]=vertical&amp;flashvars[chapters.thumbnailRotator]=false&amp;flashvars[streamSelector.plugin]=true&amp;flashvars[EmbedPlayer.SpinnerTarget]=videoHolder&amp;flashvars[dualScreen.plugin]=true&amp;flashvars[Kaltura.addCrossoriginToIframe]=true&amp;&wid=1_3i9rs19c" width="608" height="402" allowfullscreen webkitallowfullscreen mozAllowFullScreen allow="autoplay *; fullscreen *; encrypted-media *" sandbox="allow-forms allow-same-origin allow-scripts allow-top-navigation allow-pointer-lock allow-popups allow-modals allow-orientation-lock allow-popups-to-escape-sandbox allow-presentation allow-top-navigation-by-user-activation" frameborder="0" title="Kaltura Player" style="position:absolute;top:0;left:0;width:100%;height:100%"></iframe></div></div>
