---
jupytext:
  cell_metadata_filter: -all
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: '0.12'
    jupytext_version: 1.5.0
kernelspec:
  display_name: Matlab
  language: matlab
  name: matlab
---

# Identity and inverse

You solve $ax=b$ for nonzero $a$ without thinking about it: $x=b/a$. If we do break it down a little, we can see that when we multiply both sides of $ax=b$ by the number $1/a$, then on the left the terms $1/a$ and $a$ combine to give $1$, and $1x=x$. That is, the key to the solution is the presence of a *multiplicative identity* value $1$, and the existence of the *multiplicative inverse* $1/a$ when $a\neq 0$. These two items are the key to unlocking the vector case $\bfA\bfx=\bfb$, too.

## Matrix identity

Suppose we are given an $m\times n$ matrix $\bfA$. Writing its columns as the vectors $\bfa_1,\ldots,\bfa_n$, we can make the rather obvious observations

\begin{align*}
\bfa_1 &= 1\cdot \bfa_1 + 0 \cdot \bfa_2 + \cdots + 0\cdot \bfa_n,\\
\bfa_2 &= 0\cdot \bfa_1 + 1 \cdot \bfa_2 + \cdots + 0\cdot \bfa_n,\\
&\; \vdots \\
\bfa_n &= 0\cdot \bfa_1 + 0 \cdot \bfa_2 + \cdots + 1\cdot \bfa_n.
\end{align*}

The purpose in using these expressions is to interpret them as linear combinations, and thus as matrix-vector products. Let's define $\bfe_j$ for $j=1,\ldots,n$ as follows.

````{proof:definition} Standard vectors

$$
\text{$i$th component of }\bfe_j = \begin{cases} 1, & i=j, \\ 0, & i\neq j. \end{cases}
$$

````
Now we can write

```{math}
\bfa_j = \bfA \bfe_j, \quad j=1,\ldots,n.
```

Furthermore, the definition of matrix-matrix product as a concatenation of matrix-vector products implies that

\begin{align*}
\bfA &= \begin{bmatrix} \bfa_1 & \bfa_2 & \cdots & \bfa_n \end{bmatrix} \\
	&=  \begin{bmatrix} \bfA\bfe_1 & \bfA\bfe_2 & \cdots & \bfA\bfe_n \end{bmatrix}\\
	&=  \bfA \begin{bmatrix} \bfe_1 & \bfe_2 & \cdots & \bfe_n \end{bmatrix}.
\end{align*}

This motivates another important definition.

````{proof:definition} Identity matrix
The $n\times n$ {term}`identity matrix` is

```{math}
\meye = \begin{bmatrix} \bfe_1 & \bfe_2 & \cdots & \bfe_n \end{bmatrix} = 
	\begin{bmatrix}
	1 & 0 & \cdots & 0 & 0 \\
	0 & 1 & \cdots & 0 & 0 \\
	& & \ddots & & \\
	0 & 0 & \cdots & 1 & 0 \\
	0 & 0 & \cdots & 0 & 1
	\end{bmatrix}.
```
````

Sometimes, when we need to indicate the size of the identity, we use a subscript, as in $\meye_4$ to represent the $4\times 4$ case. Usually, though, it's implied by the context.

::::{note}

MATLAB has the command `eye` to create an identity matrix, and you always must provide the size, as in `eye(4)`.
::::

We'll state the identity's key property now.

````{proof:theorem} Multiplicative identity
If $\bfA$ is $m\times n$, then $\bfA = \meye_m \bfA = \bfA \meye_n$.
````

::::{admonition} Example
:class: tip

Compute

$$
\begin{bmatrix}
7 & -2 & 11 \\ 1131 & \pi & -\sqrt{13}
\end{bmatrix}
\begin{bmatrix}
2 & 0 & 0 \\ 0 & 2 & 0 \\ 0 & 0 & 2
\end{bmatrix}.
$$

:::{dropdown} Solution
You can grind through the definition, of course, but there is a shortcut:

$$
\begin{bmatrix}
7 & -2 & 11 \\ 1131 & \pi & -\sqrt{13}
\end{bmatrix}
\begin{bmatrix}
2 & 0 & 0 \\ 0 & 2 & 0 \\ 0 & 0 & 2
\end{bmatrix}=
\begin{bmatrix}
7 & -2 & 11 \\ 1131 & \pi & -\sqrt{13}
\end{bmatrix}
\left( 2
\begin{bmatrix}
1 & 0 & 0 \\ 0 & 1 & 0 \\ 0 & 0 & 1
\end{bmatrix} \right) =
2 \begin{bmatrix}
7 & -2 & 11 \\ 1131 & \pi & -\sqrt{13}
\end{bmatrix}
\meye = 
\begin{bmatrix}
14 & -4 & 22 \\ 2262 & 2\pi & -2\sqrt{13}
\end{bmatrix}.
$$

:::
::::

## Inverse

We are now going to introduce a major simplification by narrowing to the case we are most interested in.

```{important}
From now on, all matrices are assumed to be {term}`square`, meaning they have the same number of rows as columns.
```

Here is what we seek from a multiplicative inverse.

````{proof:definition} Inverse
Suppose $\bfA$ is $n\times n$. An $n\times n$ matrix $\mathbf{Z}$ such that $\mathbf{Z}\bfA = \meye$ and $\bfA\mathbf{Z}=\meye$ is called the {term}`inverse` of $\bfA$, written $\mathbf{Z} = \bfA^{-1}$.
````

There are some facts about inverses that we will take for granted without justification.

````{proof:property}
1. If an inverse matrix exists for $\bfA$, it is unique.
2. If either $\mathbf{Z}\bfA = \meye$ or $\bfA\mathbf{Z}=\meye$ is true, then both are true and $\mathbf{Z}=\bfA^{-1}$.
````

::::{admonition} Example
:class: tip
The matrix $\mathbf{R}(\theta) = \begin{bmatrix}
\cos(\theta) & -\sin(\theta) \\ \sin(\theta) & \cos(\theta) 
\end{bmatrix}$
performs rotation in the plane around the origin by angle $\theta$. Show that $\mathbf{R}(-\theta)$ is the inverse of $\mathbf{R}(\theta)$.

:::{dropdown} Solution
All we need to do is to check that the product (in either order) is the identity matrix:

\begin{align*}
\mathbf{R}(-\theta)\mathbf{R}(\theta) &= \begin{bmatrix}
\cos(-\theta) & -\sin(-\theta) \\ \sin(-\theta) & \cos(-\theta) 
\end{bmatrix} \begin{bmatrix}
\cos(\theta) & -\sin(\theta) \\ \sin(\theta) & \cos(\theta) 
\end{bmatrix} \\ 
&= \begin{bmatrix}
\cos(\theta) & \sin(\theta) \\ -\sin(\theta) & \cos(\theta) 
\end{bmatrix} \begin{bmatrix}
\cos(\theta) & -\sin(\theta) \\ \sin(\theta) & \cos(\theta) 
\end{bmatrix} \\ 
 &= \begin{bmatrix}
\cos^2(\theta)+\sin^2(\theta) & -\cos(\theta)\sin(\theta) + \sin(\theta)\cos(\theta) \\
  -\sin(\theta)\cos(\theta) + \cos(\theta)\sin(\theta)  & \sin^2(\theta) + \cos^2(\theta) 
\end{bmatrix} = \meye.
\end{align*} 
:::
::::

Having laid all the groundwork, a general statement about solving linear systems is now possible.

````{proof:theorem}
If $\bfA$ is $n\times n$ and has an inverse, then the linear system $\bfA\bfx=\bfb$ has the unique solution $\bfx=\bfA^{-1}\bfb$.
````

````{proof:proof}
Let $\bfx$ be any vector that solves $\bfb=\bfA\bfx$. Multiply both sides on the left by $\bfA^{-1}$. Then

```{math}
\bfA^{-1} \bfb =  \bfA^{-1}(\bfA\bfx)= (\bfA^{-1}\bfA) \bfx= \meye \bfx = \bfx.
```

Since the inverse is unique, $\bfx$ is unique as well.
````



## Singular matrices

The solution formula $\bfx=\bfA^{-1}\bfb$ is important but incomplete. One unresolved issue is how to compute the inverse of a given matrix. In the $2\times 2$ case it's so easy that it's worth committing to memory.

(formula-linalg-inverse2by2)=

````{proof:formula} Inverse of $2\times 2$

```{math}
:label: linalg-inverse2by2
\begin{bmatrix} a & b \\ c & d \end{bmatrix}^{-1} = \frac{1}{ad-bc}\: \begin{bmatrix} d & -b \\ -c & a \end{bmatrix}.
```

This formula breaks down if $ad=bc$, in which case the matrix is singular. 
````

Beyond $2\times 2$ we won't worry about computing inverses; row elimination is a better computational method for solving linear systems. More fundamentally, though, we have not even established which matrices might be expected to have an inverse in the first place.

A matrix of all zeros can't have an inverse, because $\bfzero\bfA$ is zero for all matrices $\bfA$. That conclusion extends what we know about a scalar $a$. Unlike the scalar case, though, there are other matrices that have no inverse.

::::{admonition} Example
:class: tip

Show that

$$
\bfA = \twomat{0}{0}{0}{1}
$$

has no inverse.

:::{dropdown} Solution

Suppose that $\mathbf{Z}$ is the inverse of $\bfA$, Then it would have to follow that

```{math}
\mathbf{Z} \twomat{0}{0}{0}{1} = \meye = \twomat{1}{0}{0}{1}.
```

Matching the first columns of both sides then implies

```{math}
\mathbf{Z} \twovec{0}{0} = \twovec{1}{0},
```

which is impossible. We conclude that $\mathbf{Z}$ cannot exist.
:::
::::

````{proof:definition} Singular matrix
A square matrix that does not have an inverse is called {term}`singular`. A matrix that does have an inverse is called {term}`invertible`, or nonsingular.
````

```{note}
The statement "$\bfA$ is singular" for the linear system $\bfA\bfx = \bfb$ is the multidimensional equivalent of "$a$ is zero" in the scalar problem $ax=b$. For a singular matrix, a unique solution is impossible–the system has either no solution or infinitely many of them.
```

The next two questions for us are: How do we know when a given matrix is singular? And what happens in a linear system with a singular matrix?

<div style="max-width:608px"><div style="position:relative;padding-bottom:66.118421052632%"><iframe id="kaltura_player" src="https://cdnapisec.kaltura.com/p/2358381/sp/235838100/embedIframeJs/uiconf_id/43030021/partner_id/2358381?iframeembed=true&playerId=kaltura_player&entry_id=1_xd4k24fk&flashvars[streamerType]=auto&amp;flashvars[localizationCode]=en&amp;flashvars[leadWithHTML5]=true&amp;flashvars[sideBarContainer.plugin]=true&amp;flashvars[sideBarContainer.position]=left&amp;flashvars[sideBarContainer.clickToClose]=true&amp;flashvars[chapters.plugin]=true&amp;flashvars[chapters.layout]=vertical&amp;flashvars[chapters.thumbnailRotator]=false&amp;flashvars[streamSelector.plugin]=true&amp;flashvars[EmbedPlayer.SpinnerTarget]=videoHolder&amp;flashvars[dualScreen.plugin]=true&amp;flashvars[Kaltura.addCrossoriginToIframe]=true&amp;&wid=1_8jg5db68" width="608" height="402" allowfullscreen webkitallowfullscreen mozAllowFullScreen allow="autoplay *; fullscreen *; encrypted-media *" sandbox="allow-forms allow-same-origin allow-scripts allow-top-navigation allow-pointer-lock allow-popups allow-modals allow-orientation-lock allow-popups-to-escape-sandbox allow-presentation allow-top-navigation-by-user-activation" frameborder="0" title="Kaltura Player" style="position:absolute;top:0;left:0;width:100%;height:100%"></iframe></div></div>
