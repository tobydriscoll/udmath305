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

# Detecting singularity

There are many ways to characterize singular matrices, some of which are computationally attractive. We focus on just two of them.

## RREF

Here is a simple criterion based on something we already know how to do.

````{proof:theorem}
A square matrix is invertible if and only if its RREF is an identity matrix.
````

```{note}
In this section we are referring to the RREF of just the coefficient matrix, not the augmented matrix.
```

In lieu of a formal proof, let's consider how limited the options are for the RREF of a square matrix. There are just as many rows as there are columns. So if each row is to have a leading one, then they must march along the diagonal of the matrix, i.e., the leading one of row $i$ is in column $i$. But those are the only nonzeros in their columns, so they are the only nonzeros in the entire matrix. Voila, an identity matrix!

The [contrapositive](https://en.wikipedia.org/wiki/Contraposition) observation is that if $\bfA$ is singular, then it must have one or more rows, and therefore one or more columns, without a leading one. That is,

````{proof:theorem}
A square matrix is singular if and only if its RREF has at least one row of zeros.
````

::::{admonition} Example
:class: tip
Determine whether 

```{math}
\bfA = \begin{bmatrix} 1 & 2 & 3 \\ 4 & 5 & 6 \\ 7 & 8 & 9 \end{bmatrix}
```

is singular. 
:::{dropdown} Solution
Its RREF is

```{math}
\begin{bmatrix} 1 & 0 & -1 \\ 0 & 1 & 2 \\ 0 & 0 & 0 \end{bmatrix}.
```

Hence this matrix is singular.
:::
::::

## Determinant

You probably saw some $2\times 2$ and $3\times 3$ determinants in vector calculus. The $2\times 2$ case is easy to describe:

```{math}
\det\left( \twomat{a}{b}{c}{d} \right) = \twodet{a}{b}{c}{d} = ad-bc.
```

This definition can be extended to create a real-valued function for square matrices of any size. The formalities can be complicated, but we are going to use a practical approach.

(definition-linalg-determinant)=

````{proof:definition} Determinant
If $\bfA$ is $n\times n$, then its {term}`determinant` is

```{math}
\det(\bfA) = \sum (-1)^{i+j} a_{ij} \det\bigl( \mathbf{M}_{ij} \bigr),
```

where the sum is taken over any row or column of $\bfA$ and $\mathbf{M}_{ij}$ is the matrix that results from deleting row $i$ and column $j$ from $\bfA$.
````

The definition, which is called {term}`cofactor expansion`, is recursive: the $n\times n$ case is defined in terms of the $(n-1)\times (n-1)$ case, and so on all the way back down to $2\times 2$. Since expanding along any row or column gives the same result, it can be advantageous to choose one with lots of zeros to cut down on the total computation.

::::{admonition} Example
:class: tip
Compute the determinant of 

$$
\begin{bmatrix} 
2 & 0 & -1 \\ -2 & 3 & -1 \\ 2 & 0 & 1
\end{bmatrix}.
$$

:::{dropdown} Solution
Using cofactor expansion along the first row,

\begin{align*}
\begin{vmatrix} 2 & 0 & -1 \\ -2 & 3 & -1 \\ 2 & 0 & 1 \end{vmatrix} & =  (2) \twodet{3}{-1}{0}{1} - (0) \twodet{-2}{-1}{2}{1} + (-1)\twodet{-2}{3}{2}{0}    \\
& = 2(3-0) + (-1)(0-6) = 12. \\
\end{align*}

In this case it might have been a tad easier to exploit the zeros by expanding along the second column instead:

\begin{align*}
\begin{vmatrix} 2 & 0 & -1 \\ -2 & 3 & -1 \\ 2 & 0 &  1 \end{vmatrix} & =  -(0) \begin{vmatrix} \cdots \end{vmatrix} + (3) \twodet{2}{-1}{2}{1} - (0)\begin{vmatrix} \cdots \end{vmatrix}    \\
& = 3(2+2) = 12. \\
\end{align*}
:::
::::

There are a few facts about determinants that are good to know.

````{proof:property}
Let $\bfA$ and $\bfB$ be $n\times n$, and let $c$ be a scalar. Then

1. $\det(c\bfA) = c^n \det(\bfA)$,
2. $\det(\bfA\bfB) = \det(\bfA)\det(\bfB)$,
3. $\det(\bfA)=0$ if and only if $\bfA$ is singular, and
4. If $\bfA$ is nonsingular, $\det(\bfA^{-1})=\bigl[\det(\bfA)\bigr]^{-1}$.
````

It's the third property above that we will be using. The determinant is often the easiest way to check for singularity of a small matrix by hand.

### Cramer's Rule

Even though a 2x2 inverse is easy, it's still not the most convenient way to solve a linear system $\bfA\bfx=\bfb$ by hand. There is an even faster equivalent shortcut known as {term}`Cramer's Rule`:

\begin{align*}
x_1 & = \frac{ \twodet{b_1}{A_{12}}{b_2}{A_{22}} }{ \det(\bfA) }\\[1ex]
x_2 & = \frac{ \twodet{A_{11}}{b_1}{A_{21}}{b_2} }{ \det(\bfA) }.
\end{align*}

Obviously this does not work if $\det(\bfA)=0$, i.e., when the matrix is singular. Instead you have to fall back on our other methods.

::::{admonition} Example
:class: tip
Solve

\begin{align*}
-x + 3y & = 1 \\
3x + y & = 7
\end{align*}

by Cramer's Rule.

:::{dropdown} Solution
Plug and play (or is it plug and pray?):

\begin{align*}
x & = \frac{ \twodet{1}{3}{7}{1} }{ \det(\bfA) }=  \frac{ \twodet{1}{3}{7}{1} }{ \twodet{-1}{3}{3}{1} } = \frac{-20}{-10} = 2, \\
y & = \frac{ \twodet{-1}{1}{3}{7} }{ \det(\bfA) } = \frac{ \twodet{-1}{1}{3}{7} }{ \twodet{-1}{3}{3}{1} } = \frac{-10}{-10} = 1.\\
\end{align*}.
:::
::::

<div style="max-width:608px"><div style="position:relative;padding-bottom:66.118421052632%"><iframe id="kaltura_player" src="https://cdnapisec.kaltura.com/p/2358381/sp/235838100/embedIframeJs/uiconf_id/43030021/partner_id/2358381?iframeembed=true&playerId=kaltura_player&entry_id=1_l0roygqd&flashvars[streamerType]=auto&amp;flashvars[localizationCode]=en&amp;flashvars[leadWithHTML5]=true&amp;flashvars[sideBarContainer.plugin]=true&amp;flashvars[sideBarContainer.position]=left&amp;flashvars[sideBarContainer.clickToClose]=true&amp;flashvars[chapters.plugin]=true&amp;flashvars[chapters.layout]=vertical&amp;flashvars[chapters.thumbnailRotator]=false&amp;flashvars[streamSelector.plugin]=true&amp;flashvars[EmbedPlayer.SpinnerTarget]=videoHolder&amp;flashvars[dualScreen.plugin]=true&amp;flashvars[Kaltura.addCrossoriginToIframe]=true&amp;&wid=1_z0c1oobu" width="608" height="402" allowfullscreen webkitallowfullscreen mozAllowFullScreen allow="autoplay *; fullscreen *; encrypted-media *" sandbox="allow-forms allow-same-origin allow-scripts allow-top-navigation allow-pointer-lock allow-popups allow-modals allow-orientation-lock allow-popups-to-escape-sandbox allow-presentation allow-top-navigation-by-user-activation" frameborder="0" title="Kaltura Player" style="position:absolute;top:0;left:0;width:100%;height:100%"></iframe></div></div>
