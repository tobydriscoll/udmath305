---
layout: note
title: "fLASH part 1"
chapter: "Linear equations"
---
* TOC
{:toc}

*(See section 4.3. However, it uses jargon from matrices that we won't discuss yet, and don't need.)*

AKA 2nd-order linear homogeneous ODEs with constant coefficients. 

We now have a roadmap for solving the 2nd order problem $L[y]=0$: find two independent solutions $y_1$ and $y_2$. From there, we have the general solution, and can solve any IVP with just some algebra. 

The situation with the nonhomogeneous problem $L[y]=g$ is a little less clear for now. We know the IVP will have a unique solutions (provided coefficient continuity). We also know that if $y_p$ happens to be a solution of $L[y]=g$, then

$$
L[c_1y_1+c_2y_2 + y_p] = c_1\cdot 0 + c_2\cdot 0 + g = g.
$$

That is, we again have solutions to the original problem parameterized by two constants. So the associated homogeneous problem $L[y]=0$ will be important even here, and that's where we go now. 

## Characteristic equation

Suppose we are given $L[y]=ay'' +by'+cy=0$, where $a$, $b$, and $c$ are all constants. It so happens that we can guess our way to the answer. Let's just plug in $y=e^{rt}$ for an unknown constant $r$:

$$a r^2 y + b r y + c y = 0.$$

As the exponential of something, $y$ is never zero, and we can divide through by that. We're left with 

$$ar^2 + br + c = 0.$$

If we can make this equation true, then the ODE will be satisfied by our guessed solution. 

Obviously this is just an application of the quadratic formula to find $r$ in terms of $a,b,c$. Generically, we get two roots, $r_1$ and $r_2$, though they coincide if $b^2=4ac$ (repeated root). 

## Distinct real roots

If real values $r_1$ and $r_2$ both satisfy the characteristic equation, with $r_1\neq r_2$, then $y_1=e^{r_1t}$ and $y_2=e^{r_2 t}$ are solutions to the ODE. Their Wronskian is

$$
W = \begin{vmatrix} e^{r_1t} & e^{r_2t} \\ r_1 e^{r_1t} & r_2 e^{r_2t} \end{vmatrix} = (r_2-r_1)e^{(r_1+r_2)t}\neq 0,
$$

so they are independent. Hence the general solution is

$$y = c_1 e^{r_1t} + c_2 e^{r_2t}.$$

Given initial conditions on $y$ and $y'$, we can solve for unique values of $c_1$ and $c_2$. 

### Example

> Solve $y'' -y=0$.

The characteristic equation is $r^2-1=0$, which has roots $r_1=1$ and $r_2=-1$. Hence the general solution is

$$y = c_1 e^{t} + c_2 e^{-t}.$$

### Example

> Solve $y'' +3y'=0$, $y(1)=2$, $y'(1)=6$.

We get $r^2+3r=0$, which has roots $r_1=0$ and $r_2=-3$. So the general solution is

$$
y = c_1 e^{0t} + c_2 e^{-3t} = c_1 + c_2 e^{-3t}.
$$

The initial conditions imply

$$
\begin{aligned}
2 &= y(1) = c_1 + c_2 e^{-3} \\
6 &= y'(1) = -3c_2e^{-3}
\end{aligned}
$$

These are satisfied if $c_2=-2e^3$ and $c_1=4$. Our solution, finally, is $y=4-2e^{3-3t}$.


## Repeated root

If $b^2=4ac$ in the characteristic equation, then  $r_1=b/(2a)$ is a double root. Our reasoning still shows that $y_1=e^{r_1t}$ is a solution of $L[y]=0$. But the general solution requires us to find a second, independent solution as well. If you're curious to see how that can be done, read on. If you just want to know how to do the homework, skip to the "bottom line" below.

Now, $L=aD^2+bD+c$ and $ar^2+br+c=(r-r_1)^2$, so it's tempting to write $L=(D-r_1)^2$. This is actually legal (just expand the square). So our problem, which is to find $y_2$ such that $L[y_2]=0$, is equivalent to

$$
(D-r_1)\bigl[(D-r_1)[y_2]\bigr] = 0.
$$

It should be clear that $(D-r_1)e^{r_1t}=0$. This changes our goal to

$$
(D-r_1)[y_2] = e^{r_1t}.
$$

But this is just the first-order linear ODE $y_2'-r_1y_2 = e^{r_1t}.$ Its integrating factor is $e^{-r_1t}$, so

$$
e^{-r_1t}y_2 = \int dt = t+C,
$$

or $y_2=te^{r_1t}+Ce^{r_1t}.$ The second part there is already picked up by $y_1$, so we may as well use $C=0$. Thus $y_2=te^{r_1t}$ is a second solution to the original ODE. (It's sometimes called a *secular solution*{:.def}.) A quick check of the Wronskian shows that $y_1$ and $y_2$ are independent:

$$
W = \begin{vmatrix} e^{r_1t} & t e^{r_1t} \\ r_1 e^{r_1t} & e^{r_1t}(1+r_1t) \end{vmatrix}.
$$

At $t=0$, the Wronskian is $(1)(1)-(0)(r_1)=1$, thus we have independence.

**Bottom line:** For the double root $r=r_1$, the general solution is

$$
y = c_1 e^{r_1t} + c_2 te^{r_1t}.
$$

## Cramer's rule

![2 by 2]({{ site.baseurl }}/assets/images/2x2-linear-systems.jpg)
{:.meme}

For an IVP, you will have to solve 2-by-2 algebraic linear systems of equations. Here's a mechanical process to take some of the pain out. The solution to 

$$\begin{align}
ax_1 + bx_2 &= f \\
cx_1 + dx_2 &= g
\end{align}$$

is given using determinants via

$$
x_1 = \frac{\begin{vmatrix} f & b \\ g & d \end{vmatrix}}{\begin{vmatrix} a & b \\ c & d \end{vmatrix}}, \qquad 
x_2 = \frac{\begin{vmatrix} a & f \\ c & g \end{vmatrix}}{\begin{vmatrix} a & b \\ c & d \end{vmatrix}}.$$

### Example

> Solve $y'' -4y'+4y=0$, $y(0)=1$, $y'(0)=4$.

Since $r^2-4r+4=(r-2)^2$, we have a double root, and $y=c_1 e^{2t} + c_2te^{2t}$. The initial conditions imply

$$
\begin{aligned}
1 &= y(0) = c_1 + 0 c_2  \\
4 &= y'(0) = 2c_1 + 1c_2 
\end{aligned}
$$

Thus

$$
\begin{aligned}
c_1 &= \frac{(1)(1)-(0)(4) }{(1)(1)-(0)(2)} = 1\\
c_2 &= \frac{(1)(4)-(1)(2) }{(1)(1)-(0)(2)} = 2.
\end{aligned}
$$

So $y=e^{2t} +2te^{2t}$.

## Imaginary/complex roots

A third possibility is that the characteristic equation has two conjugate complex roots. So we have to look for something besides exponential solutions, obviously. 

Or do we?
