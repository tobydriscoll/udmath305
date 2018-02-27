---
layout: note
title: "Undetermined coefficients"
chapter: "Linear equations"
---
* TOC
{:toc}

In the last section we solved fLASH problems. Now we change the H to h (introduce a so-called forcing term). 

*(See section 4.5.)*

##  Complementary, particular, general solutions

We previously found that the general solution of $L[y]=0$ is 

$$y_c(t) = c_1 y_1(t) + c_2 y_2(t).$$

We know how to find $y_1$ and $y_2$, as well. 

We also pointed out before that if $L[y_p]=g$, then $L[y_c+y_p]=g$ is a general solution. We now call $y_c$ the *complementary solution*{:.def} and $y_p$ is a (nonunique) *particular solution*{:.def}. Once we have any way to find $y_p$, we have the general solution and win the game. (But, the cake is a lie.)

This may not sound super-advanced, but sometimes the best way to get a particular solution is by judicious guessing. This is more properly called the *method of undetermined coefficients*{:.def}.  

## Exponentials

In the case $L[y]=a e^{kt}$, we guess $y_p = A e^{kt}$ for a constant $A$ to be determined. 

### Example 

> Find the general solution of $y'' -2y'-3y=-10e^{4t}$.

First you find the roots for $L[y]=0$. These are $3$ and $-1$. So $y_c=c_1 e^{3t}+c_2e^{-t}$. 

Next, you plug $y_p=A e^{4t}$ into the original ODE and try to make it work:

$$(16A e^{4t}) -2(4Ae^{4t}) -3(Ae^{4t})  = -10e^{4t}.$$

We require this to be true for all $t$. The exponentials cancel to give $16A-8A-3A=-10$, or $A=-2$. The general solution is 

$$y=y_c+y_p = c_1 e^{3t}+c_2e^{-t} - 2e^{4t}.$$

## Polynomials

If $L[y]=q(t)$ for a polynomial $q$ of degree $m$, then try $y_p=Q(t)$ for a generic polynomial $Q$ of degree $m$ whose coefficients are to be determined. 

### Example

> Solve $y'' +4y'+4y=8t^2$.

This has a double root at $r=-2$. So $y_c=c_1 e^{-2t} + c_2 t e^{-2t}$. 

Try $y_p=A+Bt+Ct^2$. For this to work, we require

$$\begin{align}
2C + 4(B+2Ct) + 4(A+Bt+Ct^2) &= 8t^2 \\
4C t^2 + (8C+4B) + (2C+4B+4A) &= 8t^2.
\end{align}$$

This has to be an identity for all $t$. Matching powers, we can read off $C=2$, then $B=-4$, and finally $A=3$. This gives the solution. 

## Trig

If $L[y]=k_1 e^{at} \cos(bt) + k_2e^{at} \sin(bt)$, use $y_p=Ae^{at} \cos(bt) + Be^{at} \sin(bt)$. Note the special case $a=0$ (pure sin/cos). Also, both terms must be used in $y_p$ even if $k_1$ or $k_2$ is zero. 

### Example

> Solve $y'' -2y'+2y=10\sin(2t)$.

The roots are $1\pm 1i$. Hence $y_c = c_1 e^t \sin(t) + c_2e^t \cos(t)$. 

Mercifully, there is no exponential in the forcing term. We use $y_p=A\sin(2t) + B \cos(2t)$. To get a solution, we require

$$
-4A \sin(2t) -4B\cos(2t)  - 2[2A\cos(2t)-2B\sin(2t)] + 2[A\sin(2t)+B\cos(2t)] = 10 \sin(2t).
$$

Again, this must be an identity for all $t$. Collecting like terms, we conclude 

$$
-4A+4B+2A = 10, \quad -4B-4A+2B = 0.
$$

The solution is found to be $A=-1$, $B=2$. 

## The fine print

If $L[y]=g$ and $g$ is a linear combination of terms like those seen above, then you can pick it apart and find a $Y_p(t)$ for each piece, then add them all together to get $y_p$. Yay linearity!

There are rules for polynomial times exponential/trig, too. You should be glad we're ignoring those, as the algebra gets crazy. You can always ask a computer.

## One more thing

![Doesn't work]({{ site.baseurl }}/assets/images/doesnt-work.jpg)
{:.meme}

Finally, the method as presented here can **fail**. 

### Example

> Solve $y'' +y = 5\sin(t)$.

The roots are $\pm i$, and $y_c=c_1 \sin(t) + c_2 \cos(t)$. We try $y_p=A\sin(t)+B\cos(t)$. 

$$(-A\sin(t)-B\cos(t)) + (A\sin(t)+B\cos(t)) = 5\sin(t).$$

This is impossible! 

---

We could have expected trouble since in the above, $y_c+y_p$ is not essentially different from $y_c$. This is an issue of independence again. The method is fixable, and it's not all that bad to do it, but we're going to punt. In the next chapter we'll use a different approach to solve this and similar problems.
