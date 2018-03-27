---
layout: note
title: "Steady-state solutions" 
chapter: "Linear systems"
---
* TOC
{:toc}

## Linear ODE system

*Having found the world beyond Linearity Land a mostly scary and confusing place, we sail home. But we are blown off course to a part of Linearity Land that we have not visited--Vector Valley, nestled in the shadow of Matrix Mountain. The terrain and language are familiar, but some of the local customs are perplexing....*

The easiest type of ODE system to analyze in general is a *linear system*{:.def}. A linear system of 3 equations in 3 variables would look like

$$
\begin{aligned}
\frac{dx}{dt} &= ax + by + cz + d,\\
\frac{dy}{dt} &= fx + gy +hz + j,\\
\frac{dz}{dt} &= kx + my + pz + q,
\end{aligned}$$

where $a,b,c,\ldots$ might all be functions of $t$. Obviously this notation does not scale well to larger systems! Here's a better one:

$$
\begin{aligned}
\frac{dx_1}{dt} &= a_{11} x_1 + a_{12} x_2 + a_{13} x_3  + g_1,\\
\frac{dx_2}{dt} &= a_{21} x_1 + a_{22} x_2 + a_{23} x_3  + g_2,\\
\frac{dx_3}{dt} &= a_{31} x_1 + a_{32} x_2 + a_{33} x_3  + g_3.
\end{aligned}$$

Note that the first subscript in $a_{ij}$ says which equation we're in, while the second subscript tells us which variable we're working on. Next we define

$$\mathbf{x} = \begin{bmatrix}x_1\\x_2\\x_3\end{bmatrix}, \quad \mathbf{g} = \begin{bmatrix}g_1\\g_2\\g_3\end{bmatrix}, \quad
\mathbf{A} = \begin{bmatrix}a_{11} & a_{12} & a_{13} \\ a_{21} & a_{22} & a_{23} \\ a_{31} & a_{32} & a_{33} \end{bmatrix},$$

where $\mathbf{x}$ and $\mathbf{g}$ are 3-vectors and $ \mathbf{A} $ is a 3-by-3 *matrix*{:.def}. A matrix is an array of numbers that obeys certain algebraic rules. Foremost among these is the matrix-vector multiplication

$$ \begin{bmatrix}a_{11} & a_{12} & a_{13} \\ a_{21} & a_{22} & a_{23} \\ a_{31} & a_{32} & a_{33} \end{bmatrix} \begin{bmatrix}x_1\\x_2\\x_3\end{bmatrix} =
\begin{bmatrix} a_{11}x_1 + a_{12}x_2 + a_{13}x_3  \\ a_{21}x_1 + a_{22} x_2 + a_{23} x_3 \\ a_{31}x_1 + a_{32} x_2 + a_{33} x_3 \end{bmatrix}.$$

Part of the motivation behind this property is that it lets us summarize the ODE system very succinctly as 

$$\mathbf{x}' = \mathbf{A}(t) \mathbf{x}(t) + \mathbf{g}(t).$$


### Example

> Write the following system in matrix-vector form:
$$\begin{align}
x' &= 2x-3y, \\
y' &= -x+5y+7.
\end{align}$$

It helps to number the variables.

$$\begin{align}
x_1' &= 2x_1-3x_2, \\
x_2' &= -x_1+5x_2+7.
\end{align}$$

Remember, $a_{ij}$ is what multiplies $x_j$ in the equation for $x_1'$. Hence

$$\begin{align}
\mathbf{x}' &= \begin{bmatrix} 2 & -3 \\ -1 & 5 \end{bmatrix} \mathbf{x} + \begin{bmatrix} 0\\7 \end{bmatrix} \\
&= \mathbf{A} \mathbf{x} + \mathbf{g}.
\end{align}$$

Both $\mathbf{A}$ and $\mathbf{g}$ are constants. In this case we say the ODE has *constant coefficients*{:.def}. 

## Matrix-vector multiplication

The matrix-vector multiplication formula we used above looks maybe a little less formidable if we think of it as a linear combination of the columns of $\mathbf{A}$:

$$ \begin{bmatrix}a_{11} & a_{12} & a_{13} \\ a_{21} & a_{22} & a_{23} \\ a_{31} & a_{32} & a_{33} \end{bmatrix} \begin{bmatrix}x_1\\x_2\\x_3\end{bmatrix} = x_1 \begin{bmatrix}a_{11}\\a_{21}\\a_{31}\end{bmatrix} + x_2 \begin{bmatrix}a_{12}\\a_{22}\\a_{32}\end{bmatrix} + x_3 \begin{bmatrix}a_{13}\\a_{23}\\a_{33}\end{bmatrix} .$$

Or in the 2-by-2 example above, we had

$$ \begin{bmatrix} 2 & -3 \\ -1 & 5 \end{bmatrix} \begin{bmatrix} x_1\\x_2 \end{bmatrix} = x_1 \begin{bmatrix}2\\-1\end{bmatrix} + x_2 \begin{bmatrix}-3\\5\end{bmatrix} = 
\begin{bmatrix} 2x_1-3x_2 \\ -x_1+5x_2  \end{bmatrix}.$$

This rule generalizes to the multiplication of an $n\times n$ matrix by an $n\times 1$ vector. However, if the number of columns in $\mathbf{A}$ doesn't match the number of rows in $\mathbf{x}$, we can't define the product $\mathbf{A}\mathbf{x}$ this way. As a matter of fact, we don't define it at all. 

![Not commutative]({{ site.baseurl }}/assets/images/commutative.jpg)
{:.meme}

Now think about $\mathbf{x}\mathbf{A}$. The number of columns in $\mathbf{x}$ doesn't match the number of rows in $\mathbf{A}$. And as a result, this product is not defined. That is,

**$\mathbf{A} \mathbf{x}$ is not the same thing as $\mathbf{x} \mathbf{A}$.**

When it comes to multiplying matrices and vectors, *order matters*. 

![First pants]({{ site.baseurl }}/assets/images/first-pants.jpg)
{:.meme}


## Steady-state solutions

Consider the constant-coefficient problem $\mathbf{x}' = \mathbf{A} \mathbf{x} + \mathbf{g}$. 
An equilibrium or steady-state solution is a constant vector value such that $ \mathbf{x}' = \boldsymbol{0}$. Thus, we have

$$ \mathbf{A} \mathbf{x} + \mathbf{g} = \boldsymbol{0} .$$

For the numerical example above, this means

$$ \begin{align}
2x_1-3x_2 &= 0, \\
-x_1+5x_2 &= -7.
\end{align}$$

This is a linear system of 2 algebraic equations in 2 variables. You know how to solve this in practical terms already (Cramer's rule, for example). But now we're going to take a more abstract look, one that generalizes to systems with more than 2 variables. Ultimately we can use MATLAB to solve these systems for numerical values. (The name MATLAB stands for "matrix laboratory.") 
