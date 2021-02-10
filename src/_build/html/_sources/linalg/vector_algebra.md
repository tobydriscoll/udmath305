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

# Vector algebra

Vectors support two basic operations. The first is addition. Two vectors of the same size can be added together elementwise. (The same is true for subtraction.) If the vectors have different sizes, the operation is not defined.

::::{admonition} Example
:class: tip
If $\bfx=[1;\: 2;\: 3]$ and $\bfy=[-2;\: 2;\: 0]$, then 
```{math}
\bfx + \bfy = \begin{bmatrix} -1\\4\\3 \end{bmatrix}.
```
::::

Things get a little more interesting with multiplication. We begin with {term}`scalar multiplication`, which is between a number and a vector. Each element is multiplied by the number. In this context we call a number a {term}`scalar`, since it scales all the elements equally.

::::{admonition} Example
:class: tip
If $\bfx=[1;\: 2;\: 3]$, then
```{math}
3\bfx = \begin{bmatrix} 3\\6\\9 \end{bmatrix}.
```
::::

## Linear combination

Vector addition and scalar multiplication combine to give an operation we will use repeatedly for both linear algebra and differential equations.

(definition-linalg-linear-combination)=

````{proof:definition} Linear combination
Given scalars $c_1,\ldots,c_n$ and the same number of vectors $\bfx_1,\ldots,\bfx_n$, all in $\real^m$ or $\complex^m$, a {term}`linear combination` of them is
```{math}
c_1 \bfx_1 + c_2 \bfx_2 + \cdots c_n \bfx_n,
```
where the $c_j$ are called **coefficients** of the linear combination.
````

Linear combinations interact conveniently with linear functions. If $L$ is linear, then according to the properties in the [definition of linearity](definition-linear),

$$
L( c_1 \bfx_1 + c_2 \bfx_2 + \cdots c_n \bfx_n ) = c_1 L(\bfx_1) + c_2 L(\bfx_2) + \cdots + c_n L(\bfx_n).
$$

This mundane-looking equation is the basis of a lot of important mathematics.

## Linear combinations and systems

An equation about linear combination of vectors is equivalent to a linear system of equations. For example, consider the system

\begin{align*}
x_1 - x_2  - x_3 & = 2 \\
3x_1 - 2x_2 & = 9 \\
x_1 - 2x_2 - x_3 & = 5.
\end{align*}

Interpreting vector equalities elementwise, this is equivalent to

```{math}
:label: linsys-lincomb
x_1 \threevec{1}{3}{1} + x_2 \threevec{-1}{-2}{-2} + x_3 \threevec{-1}{0}{-1} = \threevec{2}{9}{5}.
```

We can identify the three vectors on the left side as the columns of the coefficient matrix $\bfA$, and the one on the right is $\bfb$. I.e.,

```{math}
x_1 \bfa_1 + x_2 \bfa_2 + x_3 \bfa_3 = \bfb,
```

where we gave names to the columns. It's not hard to find the solution $\bfx=[1;\:-3;\:2]$. Hence

```{math}
\bfa_1 - 3 \bfa_2 + 2\bfa_3 = \bfb.
```

<!-- ## Vector multiplication

There are two kinds of multiplication between vectors. One is the {term}`inner product`, which is defined only for vectors of the same size. In the case of $\real^4$, for example,

```{math}
\bfx^T \bfy = x_1 y_1 + x_2 y_2 + x_3 y_3 + x_4y_4.
```

```{note}
The ${}^T$ superscript means **transpose**, which converts matrix and vector rows to columns and vice versa. 
```

The result is a scalar (i.e., number). This is the same as the dot product of vector calculus in two or three dimensions.

The other method of vector multiplication is *not* the cross product, however. It is the {term}`outer product`, which is defined for vectors of any sizes. It is easiest to demonstrate for small dimensions. If $\bfx\in\real^3$ and $\bfy\in\real^4$, then

$$
\bfx\bfy^T = \begin{bmatrix}  x_1 y_1 & x_1y_2 & x_1 y_3 & x_1y_4 \\
x_2 y_1 & x_2y_2 & x_2 y_3 & x_2y_4 \\
x_3 y_1 & x_3y_2 & x_3 y_3 & x_3y_4  
\end{bmatrix}.
$$

In general, if $\bfx$ is an $m$-vector and $\bfy$ is an $n$-vector, then $\bfx\bfy^T$ is an $m\times n$ matrix whose $(i,j)$ element is $x_iy_j$. We will not have a lot of use for outer products, but they have generated renewed interest of late in machine learning methods. -->

## MATLAB

If two vectors have the same size, then `+` and `-` work elementwise. 

```{code-cell}
[1;2;3] + [9;8;7]
```

For column vectors of different sizes, these operations cause errors.

```{code-cell}
---
tags: [raises-exception]
---
[1;2;3;4] - [1;0;1]
```

As a convenience, you can add or subtract a scalar to or from a vector, and the scalar will be used with each element.

```{code-cell}
[1;2;3] - 1i
```

The `*` operator does scalar multiplication.

```{code-cell}
-1*[4;3;2;1]
```

So we can express the linear system in {eq}`linsys-lincomb` using a linear combination of column vectors:

```{code-cell}
A = [1 -1 -1; 3 -2 0; 1 -2 -1]    % coefficient matrix
b = [2;9;5]    % right-side vector
```

```{code-cell}
1*A(:,1) - 3*A(:,2) + 2*A(:,3)
```

<div style="max-width:608px"><div style="position:relative;padding-bottom:66.118421052632%"><iframe id="kaltura_player" src="https://cdnapisec.kaltura.com/p/2358381/sp/235838100/embedIframeJs/uiconf_id/43030021/partner_id/2358381?iframeembed=true&playerId=kaltura_player&entry_id=1_eey4ivjm&flashvars[streamerType]=auto&amp;flashvars[localizationCode]=en&amp;flashvars[leadWithHTML5]=true&amp;flashvars[sideBarContainer.plugin]=true&amp;flashvars[sideBarContainer.position]=left&amp;flashvars[sideBarContainer.clickToClose]=true&amp;flashvars[chapters.plugin]=true&amp;flashvars[chapters.layout]=vertical&amp;flashvars[chapters.thumbnailRotator]=false&amp;flashvars[streamSelector.plugin]=true&amp;flashvars[EmbedPlayer.SpinnerTarget]=videoHolder&amp;flashvars[dualScreen.plugin]=true&amp;flashvars[Kaltura.addCrossoriginToIframe]=true&amp;&wid=1_oygunv57" width="608" height="402" allowfullscreen webkitallowfullscreen mozAllowFullScreen allow="autoplay *; fullscreen *; encrypted-media *" sandbox="allow-forms allow-same-origin allow-scripts allow-top-navigation allow-pointer-lock allow-popups allow-modals allow-orientation-lock allow-popups-to-escape-sandbox allow-presentation allow-top-navigation-by-user-activation" frameborder="0" title="Kaltura Player" style="position:absolute;top:0;left:0;width:100%;height:100%"></iframe></div></div>
