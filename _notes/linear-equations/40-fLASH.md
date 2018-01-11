---
layout: note
title: "fLASH"
chapter: "Linear equations"
---
* TOC
{:toc}

AKA 2nd-order linear homogeneous ODEs with constant coefficients. 

We now have a roadmap for solving the 2nd order problem $L[y]=0$: find two independent solutions $y_1$ and $y_2$. From there, we have the general solution, and can solve any IVP with just some algebra. 

The situation with the nonhomogeneous problem $L[y]=g$ is a little less clear for now. We know the IVP will have a unique solutions (provided coefficient continuity). We also know that if $y_p$ happens to be a solution of $L[y]=g$, then

$$
L[c_1y_1+c_2y_2 + y_p] = c_1\cdot 0 + c_2\cdot 0 + g = g.
$$

That is, we again have solutions to the original problem parameterized by two constants. So the associated homogeneous problem $L[y]=0$ will be important even here, and that's where we go now. 

## Characteristic equation

Suppose we are given $L[y]=ay''+by'+cy=0$, where $a$, $b$, and $c$ are all (real) constants. It so happens that we can guess our way to the answer. Let's just plug in $y=e^{rt}$ for an unknown constant $r$:

$$a r^2 y + b r y + c y = 0.$$

As the exponential of something, $y$ is never zero, and we can divide through by that. We're left with 

$$ar^2 + br + c = 0.$$

If we can make this equation true, then the ODE will be true for our guessed solution. 

Obviously this is just an application of the quadratic formula to find $r$ in terms of $a,b,c$. We have two toggles to consider:

* Roots are repeated or distinct.
* Roots are real or complex conjugates. 

The first toggle is essential, while the second is mostly cosmetic.

## Distinct roots

If $r_1$ and $r_2$ both satisfy the characteristic equation, then $y_1=e^{r_1t}$ and $y_2=e^{r2 t}$ are solutions to the ODE. One can show using the Wronskian that they are always independent. Hence the general solution is

$$y = c_1 e^{r_1t} + c_2 e^{r_2t}.$$

Given initial conditions on $y$ and $y'$, we can solve for unique values of $c_1$ and $c_2$. 

Mathematically, that's really all there is to it. But when the roots are complex, it would seem like we get complex-valued solutions to our problem. Should we worry? 

No. If the initial conditions are real, then the algebra will work out so that the result is always real, too. But it might not *look* real, and sometimes we want to see it that way. 

Here are the details. If $r$ is a complex root, then $\bar{r}$ is the other root. It works out that whatever the initial conditions are, $c_1=\bar{c_2}=c$. So the general solution is

$$
y = c e^{rt} + \bar{c} e^{\bar{r}t}.
$$

Define $r = \alpha + i\beta$. Then 

$$
\begin{aligned}
y &= e^{\alpha t}( c e^{i\beta t} + \bar{c} e^{-i\beta t} ) \\
    &= e^{\alpha t} \Bigl[ (c+\bar{c}) \cos(\beta t) + i(c-\bar{c}) \sin(\beta t)   \Bigr].
\end{aligned}
$$

But $c+\bar{c}=2\text{Re}(c)$ and $c-\bar{c}=2i\text{Im}(c)$. Renaming constants leads finally to 

$$
y = k_1 e^{\alpha t}  \cos(\beta t) + k_2 e^{\alpha t} \sin(\beta t)   
$$

for some purely real constants $k_1,k_2$. The bottom line is that we can *start* from this real expression of the general solution--it's just as valid as the complex version--and deduce $k_1,k_2$ directly from the initial data. 

## Repeated root

If $r_1=r_2=r$, then $y_1=e^{rt}$ is a solution of $L[y]=0$. But the general solution requires us to find a second, independent solution as well. Without proof or fanfare, we may just show that $y_2=te^{rt}$ fills the bill. (This is sometimes called a *secular solution*.) So the general solution is

$$
y = c_1 e^{rt} + c_2 te^{rt}.
$$

## Cramer's rule

Note: *Not* Kramer's rule. ("Without rules, there's chaos!")

For an IVP, you will have to solve 2-by-2 linear systems. Here's a mechanical process to take some of the pain out. The solution to 

$$\begin{align}
ax_1 + bx_2 &= f \\
cx_1 + dx_2 &= g
\end{align}$$

is given using determinants via

$$
x_1 = \frac{\begin{vmatrix} f & b \\ g & d \end{vmatrix}}{\begin{vmatrix} a & b \\ c & d \end{vmatrix}}, \qquad 
x_2 = \frac{\begin{vmatrix} a & f \\ c & g \end{vmatrix}}{\begin{vmatrix} a & b \\ c & d \end{vmatrix}}.$$

### Example (*see Example 4, section 4.3*)

*Solve $16y'' -8y' + 145y = 0$, $y(0)=-2$, $y'(0)=1$.*

Roots are $1/4\pm 3i$. System to solve is 

$$\begin{align}
1c_1 + 0c_2 &= -2 \\
\frac{1}{4}c_1 + 3c_2 &= 1
\end{align}$$

Thus

$$
c_1 = \frac{-6}{3}=-2,\qquad c_2=\frac{1+1/2}{3}=\frac{1}{2}.
$$

## Phase portraits

It's common to portray solutions of the equation in *phase space* or *state space*. The idea is that both $y$ and $y'$ must be known at a given time to fully specify the state of the underlying system. 

*See MATLAB on the following examples from B&B.*

* $16y'' -8y' + 145y = 0$, $y(0)=-2$, $y'(0)=1$
* $y''+5y'+6y=0,\quad y(0)=2,\, y'(0)=3$
* $y'' - y' + y/4 = 0, \quad y(0)=2,\, y'(0)=1/3$