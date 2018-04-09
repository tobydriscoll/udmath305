---
layout: note
title: "Elimination"
chapter: "Linear systems"
---
* TOC
{:toc}

## Elimination

Suppose $ \mathbf{A} \mathbf{x} = \mathbf{b} $ is a square system of equations. The strategy for solving it is to make a series of transformations to equivalent systems, until eventually we reach a system that is easy to solve. You know how to do this instinctively in the $2\times 2$ case. For instance, consider

$$\begin{align} x_1 + 2x_2 &= 4 \\ 2x_1 - x_2 &= 6. \end{align}$$

The solutions are not changed if we add a multiple of one equation to another. If we multiply the first equation by $-2$ and add to the second, then

$$\begin{align} (-2 x_1 - 4x_2 &= -8) \\ +(2x_1 - x_2 &= 6) \\ \rule{1.5in}{1pt} & \rule{0.75in}{1pt} \\ -5x_2 &= -2. \end{align}$$

So the original system is equivalent to

$$\begin{align} x_1 + 2x_2 &= 4 \\ -5x_2  &= -2. \end{align}$$

Now the second equation is easy to solve for $x_2$, and once that is known, the first equation is easy to solve for $x_1$.

The generalization of this process to the $n\times n$ case is known as *Gaussian elimination*{:.def} (even though the Chinese apparently invented it).

![Tell me again]({{ site.baseurl }}/assets/images/tell-me-again.jpg)
{:.meme}


Through a systematic sequence of row operations, the system is transformed into an upper triangular one, which is straightforward to solve through a process of *backward substitution*{:.def}. 

It's not a difficult algorithm to understand, but presenting it in full generality is tediously messy. It's easiest to proceed [by example, using MATLAB to handle all the arithmetic](elimination.html).

## Singularity

If $ \mathbf{A} $ is nonsingular, then Gaussian elimination produces a unique solution to $ \mathbf{A} \mathbf{x} = \mathbf{b} $ for any $ \mathbf{b} $. The full description of what happens in the singular case is complicated. In a nutshell:

* If $ \mathbf{A} $ is nonsingular, then there is a unique solution for any $ \mathbf{b} $, and Gaussian elimination finds it.
* If $ \mathbf{A} $ is singular, then the system has either no solution or infinitely many solutions. 

Consider a special case for a moment. (Remember how special homogeneous equations are for linear ODEs?) It's clear that the system $\mathbf{A}\mathbf{x}=\boldsymbol{0}$ has the solution $\mathbf{x}=\boldsymbol{0}$ regardless of what $\mathbf{A}$ is. Now, if $\mathbf{A}$ is nonsingular, this is the *only* solution. But if $\mathbf{A}$ is singular, then there must be infinitely many other solutions as well. That is,

**$\mathbf{A}\mathbf{x}=\boldsymbol{0}$ has nonzero solutions if, and only if, $\mathbf{A}$ is singular.**

Of course, if $\mathbf{x}=\mathbf{v}$ happens to be a nonzero solution, then $\mathbf{x}=\alpha \mathbf{v}$ is too for any nonzero scalar $\alpha$: $\mathbf{A}(\alpha \mathbf{v}) = \alpha(\mathbf{A}\mathbf{v}) = \boldsymbol{0}$. Without knowing more, we can't say whether there are also other nonzero solutions that are not of this form. 

## Determinants

In the $2\times 2$ case $$\begin{bmatrix} a & b \\ c & d \end{bmatrix}$$ we noted that the matrix is singular if and only if $ad-bc=0$. This is the determinant of the matrix. The same is true for $n\times n$ matrices:

**$\mathbf{A}$ is singular if and only if $\det(\mathbf{A})=0$.**

This condition is pretty easy to check for $2\times 2$ and $3\times 3$ matrices, and occasionally larger ones as well. 
