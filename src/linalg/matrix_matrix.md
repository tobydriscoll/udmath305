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

# Matrix multiplication

We can think of vectors as a special kind of matrix, and accordingly we can generalize matrix-vector products to matrix-matrix products. There are many equivalent ways to define these products. Here is the one we start with.

````{proof:definition} Matrix times matrix
If $\bfA$ is $m\times n$ and $\bfB$ is $n\times p$, then the product $\bfA\bfB$ is defined as

```{math}
:label: matrix-mult
\bfA\mathbf{B} =
\bfA \begin{bmatrix}
\mathbf{b}_1 & \mathbf{b}_2 & \cdots & \mathbf{b}_p
\end{bmatrix}
= \begin{bmatrix}
\bfA\mathbf{b}_1 & \bfA\mathbf{b}_2 & \cdots & \bfA\mathbf{b}_p.
\end{bmatrix}
```
````

In words, a matrix-matrix product is the horizontal concatenation of matrix-vector products involving the columns of the right-hand matrix.

```{warning}
In order to define $\bfA\bfB$, we require that the number of columns in $\bfA$ is the same as the number of rows in $\bfB$. That is, the *inner dimensions* must agree. The result has size determined by the *outer dimensions* of the original matrices.
```

When we compute a matrix product by hand, we usually don't write out the above. Instead we use a more compact definition for the individual entries of $\mathbf{C} = \bfA\bfB$,

```{math}
:label: matrix-mult-element
C_{ij} = \sum_{k=1}^n a_{ik}b_{kj}, \qquad i=1,\ldots,m, \quad j=1,\ldots,p.
```

The sum to get a single $C_{ij}$ is what we called a "zip", or essentially a dot product, of row $i$ from $\bfA$ with column $j$ from $\bfB$.

::::{admonition} Example
:class: tip

Find $\mathbf{A}\mathbf{B}$ if

```{math}
\bfA = \begin{bmatrix}
1 & -1 \\ 0 & 2 \\ -3 & 1
\end{bmatrix}, \qquad
\mathbf{B} = \begin{bmatrix}
2 & -1 & 0 & 4 \\ 1 & 1 & 3 & 2
\end{bmatrix}.
```

:::{dropdown} Solution

Using {eq}`matrix-mult-element`,

\begin{align*}
\bfA\mathbf{B} &= \begin{bmatrix}
(1)(2) + (-1)(1) & (1)(-1) + (-1)(1) & (1)(0) + (-1)(3) & (1)(4) + (-1)(2) \\
(0)(2) + (2)(1) & (0)(-1) + (2)(1) & (0)(0) + (2)(3) & (0)(4) + (2)(2) \\
(-3)(2) + (1)(1) & (-3)(-1) + (1)(1) & (-3)(0) + (1)(3) & (-3)(4) + (1)(2)
\end{bmatrix} \\
& = \begin{bmatrix}
1 & -2 & -3 & 2 \\ 2 & 2 & 6 & 4 \\ -5 & 4 & 3 & -10
\end{bmatrix}
\end{align*}.

Observe that

```{math}
\bfA \begin{bmatrix} 2 \\ 1 \end{bmatrix} = 2 \begin{bmatrix} 1 \\ 0 \\ -3
\end{bmatrix} + 1 \begin{bmatrix} -1 \\ 2 \\ 1 \end{bmatrix}
= \begin{bmatrix} 1 \\ 2 \\ -5 \end{bmatrix},
```

and so on.
:::
::::

MATLAB interprets the `*` operator to mean multiplication in the sense of matrices.

```{code-cell}
A = [ 1 -1; 0 2; -3 1 ]
B = [ 2 -1 0 4; 1 1 3 2 ]

A*B

A(3,:)*B(:,1)
```

When the sizes are not compatible, an error is thrown.

```{code-cell}
---
tags: [raises-exception]
---
A = [ 1 -1; 0 2 ]        % 2x2
B = [ 2 -1; 1 1; 4 0 ]   % 3x2

A*B
```

## Properties

First, the bad news. We sort of knew this was coming, from matrix-vector multiplication.

```{warning}
Matrix multiplication is not commutative. If $\bfA\bfB$ is defined, then $\bfB\bfA$ may not be, and even if it is, it may not equal $\bfA\bfB$. Put another way, you cannot simply change the order of the terms in a matrix product without some explicit justification.
```

Fortunately, other familiar and handy properties of multiplication do come along for the ride:

1. $(\bfA\bfB)\mathbf{C}=\bfA(\bfB \mathbf{C})\qquad$  (association)
2. $\bfA(\bfB+\mathbf{C}) = \bfA\bfB + \bfA\mathbf{C}\qquad$  (right distribution)
3. $(\bfA+\bfB)\mathbf{C} = \bfA\mathbf{C} + \bfB\mathbf{C}\qquad$   (left distribution)

These properties are easy to demonstrate (but not prove!) in MATLAB. 

```{code-cell}
A = [ 1 -1; 0 2; -3 1 ]
B = [ 2 -1 0 4; 1 1 3 2 ]
C = [ 1 -1 2; 2 2 0; 5 -2 -3; 4 -1 -1 ]
```

```{code-cell}
(A*B)*C - A*(B*C)    % always zero in exact artithmetic
```

```{code-cell}
% some random choices
A = round(10*rand(4,4))
B = round(10*rand(4,4))
C = round(10*rand(4,4))

ident1 = ( A*(B+C) ) - ( A*B + A*C )    % should be zero

ident2 = ( (A+B)*C ) - ( A*C + B*C )    % should be zero
```

<div style="max-width:608px"><div style="position:relative;padding-bottom:66.118421052632%"><iframe id="kaltura_player" src="https://cdnapisec.kaltura.com/p/2358381/sp/235838100/embedIframeJs/uiconf_id/43030021/partner_id/2358381?iframeembed=true&playerId=kaltura_player&entry_id=1_m3bbvv5z&flashvars[streamerType]=auto&amp;flashvars[localizationCode]=en&amp;flashvars[leadWithHTML5]=true&amp;flashvars[sideBarContainer.plugin]=true&amp;flashvars[sideBarContainer.position]=left&amp;flashvars[sideBarContainer.clickToClose]=true&amp;flashvars[chapters.plugin]=true&amp;flashvars[chapters.layout]=vertical&amp;flashvars[chapters.thumbnailRotator]=false&amp;flashvars[streamSelector.plugin]=true&amp;flashvars[EmbedPlayer.SpinnerTarget]=videoHolder&amp;flashvars[dualScreen.plugin]=true&amp;flashvars[Kaltura.addCrossoriginToIframe]=true&amp;&wid=1_7y6eseqf" width="608" height="402" allowfullscreen webkitallowfullscreen mozAllowFullScreen allow="autoplay *; fullscreen *; encrypted-media *" sandbox="allow-forms allow-same-origin allow-scripts allow-top-navigation allow-pointer-lock allow-popups allow-modals allow-orientation-lock allow-popups-to-escape-sandbox allow-presentation allow-top-navigation-by-user-activation" frameborder="0" title="Kaltura Player" style="position:absolute;top:0;left:0;width:100%;height:100%"></iframe></div></div>
