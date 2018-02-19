---
layout: note
title: "fLASH part 2"
chapter: "Linear equations"
---
* TOC
{:toc}

*(See section 4.3. However, it uses jargon from matrices that we won't discuss yet, and don't need.)*

So here we are, back at $ay'' +by'+cy=0$, and we want to know what happens when the characteristic equation has complex conjugate roots.

## Instructive example

> Solve $y'' +y=0$.

We have $r^2+1=0$, so $r_1=i$ and $r_2=-i$. The general solution is

$$
y = c_1 e^{it} + c_2 e^{-it}.
$$

This is a perfectly fine solution. Nothing wrong with it at all.

What's that? You're upset that a purely real problem has complex-valued solutions? Don't sweat it.

What? Still not happy? OK, fine. Suppose $y(0)=a$ and $y'(0)=b$ for real values of $a$ and $b$. We get a linear system,

$$
\begin{aligned}
a &= y(0) = c_1 + c_2  \\
b &= y'(0) = ic_1 - ic_2 
\end{aligned}
$$

And then

$$
\begin{aligned}
c_1 &= \frac{(2a)(-i)-(1)(2b)}{(1)(-i)-(1)(i)}=\frac{b+ia}{2i}=\frac{a-ib}{2}\\
c_2 &= \frac{(1)(2b)-(2a)(i)}{(1)(-i)-(1)(i)}=\frac{-b+ia}{2i}=\frac{a+ib}{2}
\end{aligned}
$$

And then

$$
y = \frac{a-ib}{2} e^{it} + \frac{a+ib}{2} e^{-it} = \frac{a}{2} ( e^{it}+e^{-it}) + i\frac{b}{2}( e^{-it} - e^{it})
$$

from which

$$
y = a\cos(t) +b\sin(t).
$$

So you see, the solution was real all along. It just didn't *look* that way.

(It's worth noting that in the course of the above we used

$$
\frac{e^{it}+e^{-it}}{2} = \cos(t),\qquad \frac{e^{it}-e^{-it}}{2i} = \sin(t).
$$

If these remind you at all of the definitions of the hyperbolic functions cosh and sinh, then you've just had your moment of Zen.)



## General complex case

We can always use the complex-valued exponentials. If the initial conditions are real, then the algebra will work out so that the result is always real, too. But it might not *look* real, and sometimes we want to see it that way. 

Here are the details. If $r$ is a complex root, then $\bar{r}$ is the other root. It works out that whatever the initial conditions are, $c_1=\bar{c}_2=c$. So the general solution is

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

But $c+\bar{c}=2\,\text{Re}(c)$ and $c-\bar{c}=2i\,\text{Im}(c)$. Renaming constants leads finally to 

$$
y = k_1 e^{\alpha t}  \cos(\beta t) + k_2 e^{\alpha t} \sin(\beta t)   
$$

for some purely real constants $k_1,k_2$. The bottom line is that we can *start* from this real expression of the general solution--it's just as valid as the complex version--and deduce $k_1,k_2$ directly from the initial data. 

### Example 

*(see Example 4, section 4.3)*

> Solve $16y'' -8y' + 145y = 0$, $y(0)=-2$, $y'(0)=1$.

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

It's common to portray solutions of the equation in *phase space*{:.def} or *state space*{:.def}. The idea is that both $y$ and $y'$ must be known at a given time to fully specify the state of the underlying system. 

*See MATLAB on the following examples from B&B.*

* $16y'' -8y' + 145y = 0$, $y(0)=-2$, $y'(0)=1$
* $y'' +5y'+6y=0,\quad y(0)=2,\, y'(0)=3$
* $y'' - y' + y/4 = 0, \quad y(0)=2,\, y'(0)=1/3$
