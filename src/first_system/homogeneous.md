# Homogeneous solutions

Given 
:::{math}
\mathbf{x}' = \mathbf{A}(t)\mathbf{x}, 
:::

where $\mathbf{x}\in\mathbb{R}^{n}$ and $\mathbf{A}\in\mathbb{R}^{n\times n}$, we can easily show in the usual way that any linear combination of solutions is also a solution. Thus our major task is to find a basis for the homogeneous solutions. 

:::{attention}
You need to read and write carefully when in vector-land. In particular, note that $\mathbf{x}_1$ refers to the first vector of a collection, while $x_1$ means the first component of a vector $\mathbf{x}$.
:::

## Fundamental matrix

Suppose $\mathbf{x}_1,\ldots,\mathbf{x}_m$ are homogeneous solutions of the ODE, and we use a linear combination of them to satisfy an initial condition $\mathbf{x}(t_0)=\mathbf{x}_0$: 

:::{math}
	c_1 \mathbf{x}_1 + \cdots + c_m \mathbf{x}_m = \mathbf{x}_0.
:::

Using the equivalence of linear combination with matrix-vector multiplication, we define the $n\times m$ matrix

:::{math}
:label: fund-matrix
\bfX(t) = \bigl[ \mathbf{x}_1(t) \; \mathbf{x}_2(t) \; \cdots \; \mathbf{x}_m(t)  \bigr],
:::

so that 

:::{math}
\bfX(t_0) \begin{bmatrix} c_1 \\ c_2 \\ \vdots \\ c_m \end{bmatrix} = \mathbf{x}_0.
:::

This is a linear algebraic system for the coefficients $c_i$. We can expect a unique solution if and only if $m=n$ and $\bfX(t_0)$ is invertible.  

(definition-fs-fundamental)=
::::{proof:definition} Fundamental matrix

The $n\times n$ matrix $\bfX(t)$ is a {term}`fundamental matrix` of the homogeneous system $\mathbf{x}' = \mathbf{A}(t)\mathbf{x}$ if its columns satisfy

$$
\mathbf{x}_j'=\mathbf{A}\mathbf{x}_j, \quad j=1,\ldots,n,
$$ 

and $\bfX(t)$ is invertible at all times in an open interval $I$ where $\bfA$ is continuous.
::::

:::{note}
A fundamental matrix of a particular system is not unique.
:::

Because matrix-matrix multiplication can be interpreted columnwise, a statement equivalent to "$\mathbf{x}_j'=\mathbf{A}\mathbf{x}_j$ for all $j$" is that $\bfX'=\bfA\bfX$. 

The fundamental matrix gives all we need for the general homogeneous solution.

::::{proof:theorem}
If $\bfX$ is a fundamental matrix for $\bfx'=\bfA(t)\bfx$, then the general solution of this system is 

$$
\bfx_h = \mathbf{x}(t)=\mathbf{X}(t)\mathbf{c},
$$ 

for an arbitrary constant vector $\mathbf{c}$. 
::::

## Wronskian

Since invertibility is important to the general solution, we should not be surprised to see a determinant popping up. 

(ls-df-wronskian)=
::::{proof:definition} Wronskian

The {term}`Wronskian` of a collection of homogeneous solutions $\mathbf{x}_1,\ldots,\mathbf{x}_n$ is 

:::{math}
W(t) = \det\Bigl( \bigl[ \mathbf{x}_1(t) \: \cdots \: \mathbf{x}_n(t)  \bigr] \Bigr).
:::
::::

Thus, a solution set with a nonzero Wronskian can be used as the columns of a fundamental matrix. 

::::{admonition} Example
:class: tip
Suppose 

$$
\mathbf{x}_1(t)=e^{\lambda_1 t}\mathbf{v}_1, \quad \mathbf{x}_2(t)=e^{\lambda_2 t}\mathbf{v}_2,
$$

where $\mathbf{v}_1$ and $\mathbf{v}_2$ are columns of an invertible $2\times 2$ constant matrix. Show that the Wronskian of these solutions is nonzero at all times.

:::{dropdown} Solution

Say $\mathbf{v}_1=[a,\,c]$ and $\mathbf{v}_2=[b,\,d]$. Then 

\begin{align*}
W(t) & = \det\Bigl( \bigl[ \mathbf{x}_1(t) \: \mathbf{x}_2(t)  \bigr] \Bigr)\\
& = \twodet{a e^{\lambda_1 t}}{be^{\lambda_2 t}}{c e^{\lambda_1 t}}{d e^{\lambda_2 t}}\\
& = e^{t(\lambda_1+\lambda_2)} (ad-bc) =  e^{t(\lambda_1+\lambda_2)} \det\Bigl(\bigl[\mathbf{v}_1\: \mathbf{v}_2\bigr]\Bigr) \\
\end{align*}

The exponential function is never zero, and the problem statement guarantees that the last determinant is nonzero. Hence $W$ is nonzero as well. 
:::
::::

There is a remarkable result known as *Abel's formula* that simplifies the issue of a nonzero Wronskian. We state a limited form of it here.

(theorem-fs-abel)=
::::{proof:theorem} Abel
Suppose that $\mathbf{A}(t)$ is continuous on an open interval $I$, and let $\mathbf{x}_1,\ldots,\mathbf{x}_n$ be solutions of $\mathbf{x}'=\mathbf{A}\mathbf{x}$ whose Wronskian is $W(t)$. Then if $W$ is nonzero at any time in $I$, it is nonzero at all times in $I$. 
::::

Hence it suffices to check the Wronskian at any one time, since the conclusion about whether it is zero will then apply to all times.

<div style="max-width:608px"><div style="position:relative;padding-bottom:66.118421052632%"><iframe id="kaltura_player" src="https://cdnapisec.kaltura.com/p/2358381/sp/235838100/embedIframeJs/uiconf_id/43030021/partner_id/2358381?iframeembed=true&playerId=kaltura_player&entry_id=1_1ow6y9hq&flashvars[streamerType]=auto&amp;flashvars[localizationCode]=en&amp;flashvars[leadWithHTML5]=true&amp;flashvars[sideBarContainer.plugin]=true&amp;flashvars[sideBarContainer.position]=left&amp;flashvars[sideBarContainer.clickToClose]=true&amp;flashvars[chapters.plugin]=true&amp;flashvars[chapters.layout]=vertical&amp;flashvars[chapters.thumbnailRotator]=false&amp;flashvars[streamSelector.plugin]=true&amp;flashvars[EmbedPlayer.SpinnerTarget]=videoHolder&amp;flashvars[dualScreen.plugin]=true&amp;flashvars[Kaltura.addCrossoriginToIframe]=true&amp;&wid=1_ssl0zboz" width="608" height="402" allowfullscreen webkitallowfullscreen mozAllowFullScreen allow="autoplay *; fullscreen *; encrypted-media *" sandbox="allow-forms allow-same-origin allow-scripts allow-top-navigation allow-pointer-lock allow-popups allow-modals allow-orientation-lock allow-popups-to-escape-sandbox allow-presentation allow-top-navigation-by-user-activation" frameborder="0" title="Kaltura Player" style="position:absolute;top:0;left:0;width:100%;height:100%"></iframe></div></div>
