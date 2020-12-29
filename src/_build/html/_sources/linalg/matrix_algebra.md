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

````{proof:example}
If $\bfx=[1;\: 2;\: 3]$ and $\bfy=[-2;\: 2;\: 0]$, then 
```{math}
\bfx + \bfy = \begin{bmatrix} -1\\4\\3 \end{bmatrix}.
```
````

Things get a little more interesting with multiplication. We begin with {term}`scalar multiplication`, which is between a number and a vector. Each element is multiplied by the number. In this context we call numbers {term}`scalars`, since they scale all the elements equally.

````{proof:example}
If $\bfx=[1;\: 2;\: 3]$, then
```{math}
3\bfx = \begin{bmatrix} 3\\6\\9 \end{bmatrix}.
```
````

## Linear combination

Vector addition and scalar multiplication combine to give an operation we will use over and over, both for linear algebra and differential equations.

````{proof:definition} Linear combination
Given scalars $c_1,\ldots,c_n$ and the same number of vectors $\bfx_1,\ldots,\bfx_n$, all in $\real^m$ or $\complex^m$, a {term}`linear combination` of them is
```{math}
c_1 \bfx_1 + c_2 \bfx_2 + \cdots c_n \bfx_n,
```
where the $c_j$ are called **coefficients** of the linear combination.
````

Linear combinations interact conveniently with linear functions. If $L$ is linear, then according to the properties in the [definition](definition-linear),

$$
L( c_1 \bfx_1 + c_2 \bfx_2 + \cdots c_n \bfx_n ) = c_1 L(\bfx_1) + c_2 L(\bfx_2) + \cdots + c_n L(\bfx_n).
$$

This mundane-looking equation is the basis of a lot of important mathematics.

## Vector multiplication

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

In general, if $\bfx$ is an $m$-vector and $\bfy$ is an $n$-vector, then $\bfx\bfy^T$ is an $m\times n$ matrix whose $(i,j)$ element is $x_iy_j$. We will not have a lot of use for outer products, but they have generated renewed interest of late in machine learning methods.

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

Inner and outer products on column vectors are achieved with `x'*y` and `x*y'`, respectively.

```{code-cell}
x = [3;2;1];    % semicolon suppresses output
y = [-1;1;-2];
innerprod1 = x'*y
innerprod2 = y'*x
```

As the output above suggests, the inner product is commutative. The same is not true of outer products:

```{code-cell}
outerprod1 = x*y'
outerprod2 = y*x'
```
