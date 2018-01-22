---
layout: note
title: "Theory"
chapter: "Linear equations"
---
* TOC
{:toc}

## Existence and uniqueness

*(See pp. 70-71)*

Previously we saw how to solve a FLaShI problem using integrating factors. Now, what could possibly go wrong? Really, the only potential downfall is if one of the integrals fails to exist. And we can rule that out if the functions appearing in the standard form are, say, continuous. (To be clear, we may not be able to *find* the antiderivatives, but even so, they will exist.) Also recall that the one arbitrary constant of integration can be determined by a single initial value. In short, we have the theorem

**Theorem** *(Theorem 2.4.1)* Suppose $p(t)$ and $g(t)$ are continuous in an open interval $I$, and that $t_0\in I$. Then the IVP

$$
y' + p(t)y = g(t), \qquad y(t_0)=y_0
$$

has a unique solution, existing for all $t\in I$. 

---

There are really three conclusions here: a solution exists, it is unique, and it exists for as long as the coefficient functions are continuous.

Pretty much exactly the same thing is true for higher-order linear problems, with one change: if the ODE has $n$ derivatives in it, then there need to be $n$ initial conditions. 

**Theorem** *(see Theorem 4.2.1)*  Suppose $p_1(t),\ldots,p_n(t)$ and $g(t)$ are continuous in an open interval $I$, and that $t_0\in I$. Then the IVP

$$
\begin{gather}
y^{(n)} + p_1(t)y^{(n-1)} + \cdots + p_n(t)y = g(t),\\
y(t_0)=y_0,\, y'(t_0) = y_1, \,\ldots,\, y^{(n-1)}(t_0)=y_{n-1}
\end{gather}
$$

has a unique solution, existing for all $t\in I$. 

---

Cool, huh? The case we will be most interested in is $n\le 2$. For the rest of this discussion, in fact, let $n=2$. Remember that in a second-order linear problem, we need initial values on $y$ and $y'$ to get a *unique* solution. 

*(See section 4.2 for the remainder. But ignore everything involving the matrix **P**, and Abel's Theorem.)*
        
## Linear operators

*(see pp 219-220)*

The most important thing about a linear problem is that it is linear. (Duh.) What exactly do we mean by that? 

For this discussion we need to express the problem as an
*operator*{:.def}. Much as a function describes a mapping from numbers to
numbers, an operator describes a mapping from functions to
functions. Say we have the 2nd order problem $y'' +py'+qy=g$. Then the operator we want is defined by 

$$
L[y] = y'' +py'+qy, \text{ or } L = D^2 + pD + q,
$$

where $D$ (as is common) is used to denote the standard differentiation operator. 
(Interesting side note: $pD$ is not the same operator as $Dp$.) 

Now we're ready to cook. The key property conferred by linearity is (as is easily checked)

$$
L[c_1y_1 + c_2y_2] = c_1 L[y_1] + c_2 L[y_2],
$$

where $y_1$ and $y_2$ are any functions and $c_1$ and $c_2$ are any constants. (The quantity $c_1y_1 + c_2y_2$ is called a *linear combination*{:.def} of the functions.) In fact, this property is best thought of as the *definition*{:.def} of linearity. 

## Superposition
*(see p 220)*

Superposition is a fancy term for "addition".  Suppose we want to solve the homogeneous problem $L[y]=0$. If we happen to have two solutions, $y_1$ and $y_2$, just lying around, then for any constants $c_1$ and $c_2$,

$$
L[c_1y_1 + c_2y_2] = c_1 L[y_1] + c_2 L[y_2] = 0 + 0 = 0.
$$

So we can cook up infinitely many solutions, parameterized by $c_1$ and $c_2$. 

Note that in the nonhomogeneous case, this is not necessarily going to work. If $L[y_1]=L[y_2]=g$, then 

$$
L[c_1y_1 + c_2y_2] = c_1 L[y_1] + c_2 L[y_2] = (c1+c2)g.
$$

So we would either have to have $g=0$ or $c1+c2=1$ (this is called a *convex combination*). This is the main reason that among linear problems, homogeneous ones are extra special. 

## General solutions and the Wronskian

*(see Theorem 4.2.7)*

We have come to a good place. On one hand, if $y_1$ and $y_2$ solve a 2nd order LH problem, then so does any linear combination of them. On the other hand, we are supposed to use two initial conditions to specify the solution uniquely. We have just exactly as many free constants (two) as constraints to satisfy!

But there is a catch. Let's be concrete for a moment. It's clear that
$\sin(t)$ is a solution of $y'' +y=0$. If we tried to take $y_1=y_2=\sin(t)$, then the linear combination would be $(c_1+c_2)\sin(t)$. Even though it has two free constants, there is no way to make this expression satisfy the initial condition $y(0)=1$. In other words, it's impossible to get truly "new" solutions to the ODE by superposing $\sin(t)$ with itself.

If $y_1$ and $y_2$ are such that their linear combination can't be used to satisfy two arbitrary initial conditions, then we say they are *linearly dependent*{:.def}. Otherwise, they are *linearly independent*{:.def}, or (in the book's preferred jargon) they form a *fundamental set*{:.def}. 

Fortunately, there is a relatively easy, if unexpected, way to determine whether two given solutions to $L[y]=0$ are independent. Define the *Wronskian*{:.def} as the function

$$
W[y_1,y_2] = \begin{vmatrix} y_1 & y_2 \\ y_1' & y_2' \end{vmatrix}.
$$

Yes, this is a 2-by-2 determinant, evaluated in the usual "X" fashion. 

**Theorem** *(see Theorem 4.2.7)* Suppose $L[y_1]=L[y_2]=0$, where the coefficient functions of $L$ are continuous on interval $I$. If the Wronskian is nonzero at any value of $t\in I$, then the solutions are independent, and 

$$
y = c_1 y_1+ c_2 y_2
$$

is the general solution of $L[y]=0$. That is, *all* solutions can be expressed this way, including the unique solution of an IVP.


