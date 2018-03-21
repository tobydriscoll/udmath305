---
layout: note
title: "Steady-state solutions" 
chapter: "Linear systems"
---
* TOC
{:toc}

## Linear ODE system

*Having found the world beyond Linearity Land a mostly scary and confusing place, we sail home. But we are blown off course to a part of Linearity Land that we have not visited--Vector Valley, nestled in the shadow of Matrix Mountain. The terrain and language are familiar, but some of the local customs are perplexing....*

When we are given $n$ equations with $n$ variables, we find it much more convenient to write the analysis in terms of vectors. When the system is linear, we furthermore use a specialized notation. 

### Example

$$\begin{align}
x' &= 2x-3y, \\
y' &= -x+5y+7.
\end{align}$$

Define $u_1=x$ and $u_2=y$. Clearly, $\mathbf{u}' = \mathbf{f}(t,\mathbf{u})$. But the system is linear in $x$ and $y$, so we can go further:

$$\begin{align}
\mathbf{u}' &= \begin{bmatrix} 2 & -3 \\ -1 & 5 \end{bmatrix} \mathbf{u} + \begin{bmatrix} 0\\7 \end{bmatrix} \\
&= \mathbf{A} \mathbf{u} + \mathbf{b}.
\end{align}$$

We call $ \mathbf{A} $ a 2-by-2 *matrix*{:.def} and $\mathbf{b}$ a 2-vector. In this case we say the equation has *constant coefficients*{:.def}. 

## Matrix-vector multiplication

If the above example is to make sense, then it must be that

$$ \begin{bmatrix} 2 & -3 \\ -1 & 5 \end{bmatrix} \begin{bmatrix} x\\y \end{bmatrix} =
\begin{bmatrix} 2x-3y \\ -x+5y  \end{bmatrix}.$$

This is, in fact, how multiplication of a $2\times 2$ matrix and $2\times 1$ vector is defined.

$$ \begin{bmatrix} a_{11} & a_{12} \\ a_{21} & a_{22} \end{bmatrix} \begin{bmatrix} u_1 \\ u_2 \end{bmatrix} =
\begin{bmatrix} a_{11}u_1 + a_{12}u_2  \\ a_{21}u_1 + a_{22} u_2  \end{bmatrix}.$$

![Not commutative]({{ site.baseurl }}/assets/images/commutative.jpg)
{:.meme}


Some important things to note right off the bat:

* We always refer to rows first, then columns. So $a_{21}$ is in the second row, first column.
* This multiplication is **not commutative**. That is, $ \mathbf{A} \mathbf{u} \neq \mathbf{u} \mathbf{A} $. In fact, the second product isn't even defined. So always write your products carefully, without changing the order.



## Steady-state solutions

An equilibrium or steady-state solution is a constant vector value such that $ \mathbf{u}' = \boldsymbol{0}$. Thus, in the above we would have

$$ \mathbf{A} \mathbf{u} + \mathbf{b} = \boldsymbol{0} .$$

Decoding the symbols for the example above, this means

$$ \begin{align}
2u_1-3u_2 &= 0, \\
-u_1+5u_2 &= -7.
\end{align}$$

This is a linear system of 2 algebraic equations in 2 variables. You know how to solve this in practical terms already (Cramer's rule). But now we're going to take a more abstract look, one that generalizes to systems with more than 2 variables. Ultimately we can use MATLAB to solve these systems for numerical values. (The name MATLAB stands for "matrix laboratory.") 
