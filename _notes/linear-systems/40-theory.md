---
layout: note
title: "ODE theory"
chapter: "Linear systems"
---
* TOC
{:toc}

*(See sections 3.2 and 6.2.)*

## Existence and uniqueness

We now turn our attention to the first-order vector ODE problem

$$ \mathbf{x}' = \mathbf{P}(t) \mathbf{x} + \mathbf{g}(t).$$

Here $ \mathbf{P} $ is $n\times n$, and $ \mathbf{x} $ and $ \mathbf{g} $ are both $n$-vectors. As this is a first-order vector problem, it requires a single vector initial condition, $ \mathbf{x}(t_0) = \mathbf{x}_0$. When it comes to existence and uniqueness, linearity remains a great friend.

**Theorem** *(Theorem 6.2.1)* If $ \mathbf{P} $ and $ \mathbf{g} $ are continuous on an open interval $I$, and $t_0\in I$, then the IVP $ \mathbf{x}' = \mathbf{P}\mathbf{x} + \mathbf{g},$ $\mathbf{x}(t_0) = \mathbf{x}_0$ has a unique solution throughout the interval $I$.

## Fundamental solutions

In the homogeneous linear case we continue to enjoy superposition of solutions.

**Theorem** (Theorem 6.2.2) If $\mathbf{x}_1(t), \ldots, \mathbf{x}_k(t)$ are solutions of $\mathbf{x}' = \mathbf{P}(t) \mathbf{x}$, then the linear combination $c_1 \mathbf{x}_1(t) + \cdots + c_k \mathbf{x}_k(t)$ is also a solution.

---

We sometimes use matrix-vector multiplication to express this kind of linear combination. Suppose that $\mathbf{x}_1(t), \ldots, \mathbf{x}_n(t)$ are solutions of the linear homogenous ODE $\mathbf{x}' = \mathbf{P}(t) \mathbf{x}$. Define the $n\times n$ matrix

$$ \mathbf{X}(t) = \begin{bmatrix} \mathbf{x}_1(t) & \ldots & \mathbf{x}_n(t) \end{bmatrix}. $$

In the vector case, we define the *Wronskian*{:.def} of this solution set as the determinant of $\mathbf{X}$. Just as with high-order scalar linear problems, we say these solutions are *linearly independent*{:.def} if their Wronskian is nonzero (and if it is nonzero at any single time, then it is nonzero at all times in the interval where $\mathbf{P}$ is continuous). We also call this set of solutions *fundamental*{:.def} in this case.

Why is this important? Welp, we know that by superposition, $\mathbf{X(t)}\mathbf{c}$ is also a solution for any constant $n$-vector $\mathbf{c}$. We can furthermore use this constant vector to satisfy any initial condition, as long as we can solve

$$ \mathbf{x}_0 = \mathbf{X(t_0)}\mathbf{c}.$$

But this is guaranteed to be possible if $\mathbf{X(t_0)}$ is nonsingular, which is guaranteed if the Wronskian is nonzero. 

In summary: If $\mathbf{x}_1(t), \ldots, \mathbf{x}_n(t)$ are a fundamental (i.e., independent) set of solutions of $\mathbf{x}' = \mathbf{P}(t) \mathbf{x}$, then $\mathbf{x}(t)=\mathbf{X}(t)\mathbf{c}$ is the *general solution*{:.def} of that problem.


## Equivalence to second-order scalar equations

Consider the linear 2nd order problem $y'' + p(t)y' + q(t)y = f(t)$. Let's define a vector $ \mathbf{x} $ by $x_1(t)=y$, $x_2(t)=y'$. Then we find

$$ \mathbf{x}' = \begin{bmatrix} 0 & 1 \\ -q(t) & -p(t) \end{bmatrix} \mathbf{x} + \begin{bmatrix} 0 \\ f(t) \end{bmatrix}.$$

Thus, 2nd-order equations are entirely embedded within the universe of $2\times 2$ first-order linear systems. We could have skipped doing them and just read off conclusions from the more general case. 

(More generally, $n$th-order linear scalar problems are embedded within $n$-vector first-order problems. If we had a pair of $m$th-order and $n$th-order equations for two variables, we could transform them into a first-order system of dimension $m+n$, etc.)

In the case of constant coefficients, this gives us some idea what lies ahead: characteristic equations and exponential solutions. In fact, let's try an exponential solution for $ \mathbf{x}' = \mathbf{A} \mathbf{x}$ with constant matrix $ \mathbf{A}$:

$$ \mathbf{x}(t) = e^{rt} \mathbf{u} \Rightarrow r e^{rt} \mathbf{u} = \mathbf{A} (e^{rt} \mathbf{u}),$$

or simply $ \mathbf{A} \mathbf{u} = r \mathbf{u}$. Can such a problem be solved? (And no, you can't just "cancel out" the vectors.) This leads us to another Big Problem of linear algebra. 

