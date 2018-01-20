---
layout: note
title: "Theory"
chapter: "Linear systems"
---
* TOC
{:toc}

*(See sections 3.2 and 6.2.)*

## Existence and uniqueness

We now turn our attention to the first-order vector ODE problem

$$ \mathbf{x}' = \mathbf{P}(t) \mathbf{x} + \mathbf{f}(t).$$

Here $ \mathbf{P} $ is $n\times n$, and $ \mathbf{x} $ and $ \mathbf{f} $ are both $n$-vectors. As this is a first-order vector problem, it requires a single vector initial condition, $ \mathbf{x}(t_0) = \mathbf{x}_0$. When it comes to existence and uniqueness, linearity remains a great friend.

**Theorem** (Theorem 6.2.1) If $ \mathbf{P} $ and $ \mathbf{f} $ are continuous on an open interval $I$, and $t_0\in I$, then the IVP $ \mathbf{x}' = \mathbf{P}\mathbf{x} + \mathbf{f},$ $\mathbf{x}(t_0) = \mathbf{x}_0$ has a unique solution throughout the interval $I$.

## Fundamental solutions

In the homogeneous linear case we continue to enjoy superposition of solutions.

**Theorem** (Theorem 6.2.2) If $\mathbf{x}_1(t), \ldots, \mathbf{x}_k(t)$ are solutions of $\mathbf{x}' = \mathbf{P}(t) \mathbf{x}$, then the linear combination $c_1 \mathbf{x}_1(t) + \cdots + c_k \mathbf{x}_k(t)$ is also a solution.

---

Just as with high-order scalar linear problems, the general solution is expressed as a linear combination of a fundamental set of solutions. We say that the solutions $\mathbf{x}_1(t), \ldots, \mathbf{x}_n(t)$ are *fundamental* if the matrix

$$ \mathbf{X}(t) = \begin{bmatrix} \mathbf{x}_1(t) & \ldots & \mathbf{x}_n(t) \end{bmatrix} $$

is nonsingular at any particular time. Given such a matrix, then the *general solution* is $\mathbf{X}(t) \mathbf{c}$ for an arbitrary $n$-vector $\mathbf{c}$. Note that if we are also given an initial condition, then we must satsify

$$ \mathbf{X}(t_0) \mathbf{c} = \mathbf{x}_0.$$

It turns out that if $ \mathbf{X} $ is nonsingular at one time, then it is nonsingular at all times (within an interval of coefficient continuity). So this is a linear system of equations that has a unique solution for $\mathbf{c}$.

## Equivalence to second-order equations

Consider the linear 2nd order problem $y'' + p(t)y' + q(t)y = f(t)$. Let's define a vector $ \mathbf{x} $ by $x_1(t)=y$, $x_2(t)=y'$. Then we find

$$ \mathbf{x}' = \begin{bmatrix} 0 & 1 \\ -q(t) & -p(t) \end{bmatrix} \mathbf{x} + \begin{bmatrix} 0 \\ f(t) \end{bmatrix}.$$

Thus, 2nd-order equations are entirely embedded within the universe of $2\times 2$ first-order linear systems. We could have skipped doing them and just read off conclusions from the more general case. 

(More generally, $n$th-order linear scalar problems are embedded within $n$-vector first-order problems. If we had a pair of $m$th-order and $n$th-order equations for two variables, we could transform them into a first-order system of dimension $m+n$, etc.)

In the case of constant coefficients, this gives us some idea what lies ahead: characteristic equations and exponential solutions. In fact, let's try an exponential solution for $ \mathbf{x}' = \mathbf{A} \mathbf{x}$ with constant matrix $ \mathbf{A}$:

$$ \mathbf{x}(t) = e^{rt} \mathbf{u} \Rightarrow r e^{rt} \mathbf{u} = \mathbf{A} (e^{rt} \mathbf{u}),$$

or simply $ \mathbf{A} \mathbf{u} = r \mathbf{u}$. Can such a problem be solved? (And no, you can't just "cancel out" the vectors.) This leads us to the other Big Problem of linear algebra. 

