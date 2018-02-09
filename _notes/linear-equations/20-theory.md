---
layout: note
title: "Theory"
chapter: "Linear equations"
---
* TOC
{:toc}

## Existence and uniqueness

*(See pp. 70-71)*

Previously we saw how to solve a FLaSh problem using integrating factors. Now, what could possibly go wrong? Really, the only potential downfall is if one of the integrals fails to exist. And we can rule that out if the functions appearing in the standard form are, say, continuous. (To be clear, we may not be able to *find* the antiderivatives, but even so, they will exist.) Also recall that the one arbitrary constant of integration can be determined by a single initial value. In short, we have the theorem

**Theorem** *(Theorem 2.4.1)* (FLaShI) Suppose $p(t)$ and $g(t)$ are continuous in an open interval $I$, and that $t_0\in I$. Then the IVP

$$
y' + p(t)y = g(t), \qquad y(t_0)=y_0
$$

has a unique solution, existing for all $t\in I$. 

---

There are really three conclusions here: a solution exists, it is unique, and it exists for as long as the coefficient functions are continuous.

Pretty much exactly the same thing is true for higher-order linear problems, with one change: if the ODE has $n$ derivatives in it, then there need to be $n$ initial conditions. These apply to the lowest $n$ derivatives of the solution, starting at zero. 

**Theorem** *(see Theorem 4.2.1)*  (fLaShI) Suppose $p_1(t),\ldots,p_n(t)$ and $g(t)$ are continuous in an open interval $I$, and that $t_0\in I$. Then the IVP

$$
\begin{gather}
y^{(n)} + p_1(t)y^{(n-1)} + \cdots + p_n(t)y = g(t),\\
y(t_0)=y_0,\, y'(t_0) = y_1, \,\ldots,\, y^{(n-1)}(t_0)=y_{n-1}
\end{gather}
$$

has a unique solution, existing for all $t\in I$. 

---

The theorems don't say anything about values of $t$ for which the coefficient functions lack continuity.

### Example

> Solve the IVP $ty'+2y = 4t^2$, $y(1)=0$. Show that the domain of the solution is compatible with the existence theorem.

We earlier used an integrating factor to get the general solution $y=t^2+Ct^{-2}$. At $t=1$ we get $0=1+C$, which leads to $C=-1$. So the solution is $y=t^2-t^{-2}$. The largest domain we can choose for it that includes the initial time is $(0,\infty)$.

The original ODE looks innocuous, with globally continuous coefficient functions. But the theorem requires us to use the standard form $y'+(2/t)y=4t$, and the function $2/t$ fails to exist at $t=0$. So the theorem cannot guarantee a solution there. 

---

The case we will be most interested in is $n\le 2$. For the rest of this discussion, in fact, let $n=2$. Remember that in a second-order linear problem, we need initial values on $y$ and $y'$ to get a *unique* solution. 

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
(Interesting side note: $pD$ is not the same operator as $Dp$. Unlike numbers, operators don't generally follow the commutative law.)

### Example

> Let $L=D^2+D-t$ and $y=\sin(t)$. Find $L[y]$.

$$
L[y] = D^2y + Dy -ty = (-\sin(t)) + (\cos(t)) - (t\sin(t)) = \cos(t) = (1+t)\sin(t).
$$

---

Now we're ready to cook. The key property conferred by linearity is (as is easily checked)

$$
L[c_1y_1 + c_2y_2] = c_1 L[y_1] + c_2 L[y_2],
$$

where $y_1$ and $y_2$ are any functions and $c_1$ and $c_2$ are any constants. (The quantity $c_1y_1 + c_2y_2$ is called a *linear combination*{:.def} of the functions.) In fact, this property is best thought of as the *definition* of linearity. 

## Superposition
*(see p 220)*

Superposition is a fancy term for addition.  Suppose we want to solve the homogeneous problem $L[y]=0$. If we happen to have two solutions, $y_1$ and $y_2$, just lying around, then for any constants $c_1$ and $c_2$,

$$
L[c_1y_1 + c_2y_2] = c_1 L[y_1] + c_2 L[y_2] = 0 + 0 = 0.
$$

So we can cook up infinitely many solutions, parameterized by $c_1$ and $c_2$. 

Note that in the nonhomogeneous case, this is not necessarily going to work. If $L[y_1]=L[y_2]=g$, then 

$$
L[c_1y_1 + c_2y_2] = c_1 L[y_1] + c_2 L[y_2] = (c_1+c_2)g.
$$

So we would either have to have $g=0$ or $c_1+c_2=1$ (this is called a *convex combination*). This is the main reason that among linear problems, homogeneous ones are extra special. 

## General solutions and the Wronskian

*(see Theorem 4.2.7)*

We have come to a good place. On one hand, if $y_1$ and $y_2$ solve a 2nd order linear homogeneous problem, then so does any linear combination of them. On the other hand, we are supposed to use two initial conditions to specify the solution uniquely. We have just exactly as many free constants (two) as constraints to satisfy!

But there is a catch. Let's be concrete for a moment. It's clear that
$\sin(t)$ is a solution of $y'' +y=0$. If we tried to take $y_1=y_2=\sin(t)$, then the linear combination would be $(c_1+c_2)\sin(t)$. Even though it has two free constants, there is no way to make this expression satisfy the initial condition $y(0)=1$. In other words, it's impossible to get truly "new" solutions to the ODE by superposing $\sin(t)$ with itself.

If $y_1$ and $y_2$ are such that their linear combination can't be used to satisfy two arbitrary initial conditions, then we say they are *linearly dependent*{:.def}. Otherwise, they are *linearly independent*{:.def}, or we say they form a *fundamental set*{:.def}.

![Independent solutions]({{ site.baseurl }}/assets/images/independent.jpg)
{:.meme}


Fortunately, there is a relatively easy, if odd-looking, way to determine whether two given solutions to $L[y]=0$ are independent. Define the *Wronskian*{:.def} as the function

$$
W[y_1,y_2] = \begin{vmatrix} y_1 & y_2 \\ y_1' & y_2' \end{vmatrix}.
$$

This is a 2-by-2 determinant, evaluated in the usual "X" fashion. 

**Theorem** *(see Theorem 4.2.7)* Suppose $L[y_1]=L[y_2]=0$, where the coefficient functions of $L$ are continuous on interval $I$. If the Wronskian is nonzero at any value of $t\in I$, then the solutions are independent, and 

$$
y = c_1 y_1+ c_2 y_2
$$

is the general solution of $L[y]=0$. That is, *all* solutions can be expressed this way, including the unique solution of an IVP.

### Example

> Show that $\cos(t)$ and $\sin(t)$ are independent solutions of $y'' +y=0$.

Let $y_1=\cos(t)$ and $y_2=\sin(t)$. Since $y_1''=-\cos(t)=-y_1$ and $y_2''=-\sin(t)=-y_2$, each satisfies the ODE. Their Wronskian is

$$
W[y_1,y_2] = \begin{vmatrix} \cos(t) & \sin(t) \\ -\sin(t) & \cos(t) \end{vmatrix} = \cos^2 t + \sin^2 t = 1.
$$

Since this is nonzero everywhere, the solutions are independent.

---

It's worth noting that if the Wronskian is nonzero anywhere, then it's nonzero everywhere. So we can pick any value of $t$. (It's important to differentiate before picking a value of $t$, though.) Just stay inside the domain; if no domain is given, assume the largest possible for the given functions. 

### Example

> Show that $e^t\cos(2t)$ and $e^t\sin(2t)$ are independent.

We have

$$
W = \begin{vmatrix} e^t\cos(2t) & e^t\sin(2t) \\ e^t\cos(2t) - 2 e^t\sin(2t) & e^t\sin(2t)  + 2e^t\cos(2t) \end{vmatrix}.
$$

Ugh. But we can set $t=0$ before continuing. 

$$
W(0) = \begin{vmatrix} 1 & 0 \\ 1  &  2 \end{vmatrix} = 2 \neq 0.
$$

Done. 
