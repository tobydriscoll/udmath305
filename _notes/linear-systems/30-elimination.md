---
layout: note
title: "Elimination"
chapter: "Linear systems"
---
* TOC
{:toc}

## Row operations

Suppose $ \mathbf{A} \mathbf{x} = \mathbf{b} $ is a square system of equations. The strategy for solving it is to make a series of transformations to equivalent systems, until eventually we reach a system that is easy to solve by inspection. Each transformation has an expression in terms of matrix algebra.

We begin by setting up the *augmented matrix*

$$
\tilde{ \mathbf{A} } = \begin{bmatrix} \mathbf{A} & \mathbf{b} \end{bmatrix}.
$$

It has size $n\times (n+1)$.

Clearly the system is essentially unchanged (in the sense of having the same solution set) if we multiply one its equations by a nonzero scalar. This is equivalent to multiplying the corresponding row of $\tilde{ \mathbf{A} }$ by that scalar.

The system is also unchanged if we change the order by swapping two of the equations. This is equivalent to swapping the corresponding rows of $\tilde{ \mathbf{A} }$.

Finally, the solutions are not changed if we add a multiple of one equation to another. For instance, consider

$$\begin{align} x_1 + 2x_2 &= 4 \\ 2x_1 - x_2 &= 6. \end{align}$$

If we multiply the first equation by $-2$ and add to the second, then

$$\begin{align} (-2 x_1 - 4x_2 &= -8) \\ +(2x_1 - x_2 &= 6) \\ \rule{1.5in}{0.5pt} & \rule{0.75in}{0.5pt} \\ -5x_2 &= -2. \end{align}$$

So the original system is equivalent to

$$\begin{align} x_1 + 2x_2 &= 4 \\ -5x_2  &= -2, \end{align}$$

which, not incidentally, is easy to solve. This maneuver is also equivalent to operating on the rows of $\tilde{ \mathbf{A} }$.

Thus we recognize three kinds of *elementary row operations*:

1. Multiply one row of $\tilde{ \mathbf{A} }$ by a nonzero scalar.
1. Swap two rows of $\tilde{ \mathbf{A} }$.
1. Add a multiple of one row of $\tilde{ \mathbf{A} }$ to another row, in place.

It turns out that these are sufficient to solve all linear systems having a nonsingular matrix. 

## Elimination

Solving a linear system is literally a process of elimination, often called *Gaussian elimination*. Through a systematic sequence of row operations, the system is transformed into an upper triangular one, which is straightforward to solve through a process of *back substitution*. 

It's not a difficult algorithm to understand, but presenting it in full generality is tediously messy. It's easiest to proceed [by example, using MATLAB to handle all the arithmetic](elimination.html).

## Singularity

Maybe you noticed that if at some point we had a zero pivot value, and all the elements underneath it were also zero, we would seem to be stuck. More precisely, we could continue elimination, because that column is already in upper triangular form. But when we do the back substitution, we will have to divide by zero, and the algorithm falls apart. 

However, this only happens when the original matrix is singular. Conversely, if $ \mathbf{A} $ is nonsingular, then Gaussian elimination produces a unique solution to $ \mathbf{A} \mathbf{x} = \mathbf{b} $ for any $ \mathbf{b} $.

The full description of what happens in the singular case is complicated. In a nutshell:

* If $ \mathbf{A} $ is nonsingular, then there is a unique solution for any $ \mathbf{b} $.
* If $ \mathbf{A} $ is singular, then the system has either no solution or infinitely many solutions. 

That will be more than enough for us.
