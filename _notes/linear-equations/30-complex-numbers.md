---
layout: default
title: "Complex numbers"
chapter: "Linear equations"
---
* TOC
{:toc}

*For a really smart and entertaining introduction to complex numbers, I recommend [this video series](https://youtu.be/T647CGsuOVU).*

We need to take a short but highly relevant detour to talk about complex numbers. 

There's often a lot of uneasiness about complex numbers. Terminology is part of the reason. Using "real" and "imaginary" to label numbers suggests a strong value judgment, one that ruled mathematics for centuries. But complex numbers are actually just as "real" as so-called real numbers. If anything, they are actually *more* fundamental to the universe. 

## The reality of imaginary numbers (optional)

Let's rewind a bit. We can probably take for granted the positive integers 1, 2, 3, and so on, and we'll throw in zero too (though this too was controversial for centuries). It's not long before we want to solve a problem like $x+1=0$. Annoyingly, we can pose the problem using just nonnegative integers, but we can't solve it. So we accept the existence of the negative integers. 

I can imagine quite a bit of skepticism about this historically. ("Sure, Wei. Ever seen a negative goat?") But if you've ever taken out a loan, you know that negative numbers can have very real consequences. 

Eventually, the negative integers seem "obvious" and perfectly natural. But then we run into a problem like

$$
2x - 1 = 0.
$$

We can pose this problem with integers, but we can't solve it. So we get used to accepting rational numbers, too.

Rational numbers are pretty weird. Between any pair of them, you have infinitely more rational numbers! Yet it turns out they have (huge) gaps as well. You can't solve

$$
x^2 - 2 = 0
$$

using only rational numbers. So, you're willing to take on irrational numbers too. Talk about weird--every one of them has an infinite, non-repeating decimal expansion.  

So much for the "real" numbers. At least we have filled in the so-called number line. But then you get to

$$
x^2 + 1 = 0,
$$

which is purely "real" but insolvable. Solutions to this equation were widely resisted for a very long time (say, the 18th century), to the point they were called "imaginary" (thanks, Descartes). 

Yet something amazing happens if you do accept imaginary numbers, and their expansion to the complex numbers. Namely, *The Fundamental Theorem of Algebra*, which states that if you write down a polynomial using complex numbers, it will have only complex numbers as solutions. So there's no infinite ladder of hypercomplex numbers that we have to ascend--just one rung past the "real" ones.

## The curious case of the missing singularities (optional)

In Calc II you learn how to derive this power series using the geometric series:

$$
\frac{1}{1-x^2} = 1 + x^2 + x^4 + x^6 + \cdots.
$$

It's only valid for $\|x\| < 1$. This seems reasonable, as the function blows up at $\|x\|=1$ anyway.

~~~matlab
clf
func = @(x) 1./(1-x.^2);
series = @(x) sum( (x.^2).^(0:50) );
fplot(func,[-1.4 1.4],'linew',2)
hold on
fplot(series,[-1.4 1.4],'linew',2)
ylim([-6 6])
~~~

![Series 1]({{ site.baseurl }}/assets/images/series-converge1.svg)

Now we can substitute $-x^2$ for $x^2$ and get

$$
\frac{1}{1+x^2} = 1 - x^2 + x^4 - x^6 + \cdots,
$$

still good only for $\|x\| < 1$. This is harder to understand, though, because the function is continuous, with infinitely many derivatives, on the whole real line.

~~~matlab
clf
func = @(x) 1./(1+x.^2);
series = @(x) sum( (-x.^2).^(0:50) );
fplot(func,[-1.4 1.4],'linew',2)
hold on
fplot(series,[-1.4 1.4],'linew',2)
ylim([-1 5])
grid on
~~~

![Series 2]({{ site.baseurl }}/assets/images/series-converge2.svg)

Why does the series go bad, with no clear barrier in sight?

The answer is that power series for complex variables always converge inside of disks. Because $1/(1+x^2)$ blows up at $x=\pm i$, the largest disk we can fit at the origin still has radius 1. That is, even though the singularities are "imaginary", they have a very "real" effect on the convergence. 



## Basics

We can write a complex number $z\in \mathbb{C}$ as $z=x+iy$, where $i^2=-1$ and $x$ and $y$ are real numbers known as the *real*{:.def} and *imaginary*{:.def} parts of $z$,

$$
z = x+iy \quad \Leftrightarrow \quad x = \text{Re}(z), \quad y = \text{Im}(z).
$$

You add, subtract, and multiply complex numbers by applying the obvious algebraic rules. Division is a little trickier. It's easiest to use the *conjugate*{:.def},

$$
\bar{z} =\text{Re}(z) - i \,\text{Im}(z).
$$

(No matter how complicated the expression, you just replace $i$ by $-i$ to get the conjugate.) Then 

$$ 
\frac{w}{z} = \frac{w \bar{z}}{z \bar{z}} = \frac{w \bar{z}}{|z|^2},
$$

where $\|z\|$ is the *modulus*{:.def}, easily computed via

$$
|z|^2 = [\text{Re}(z)]^2 + [\text{Im}(z)]^2.
$$

## Euler's formula


Things really start to heat up with this amazing identity, due to Leonhard Euler (pronounced "oiler"):

$$
e^{it} = \cos(t) + i \sin(t).
$$

![Euler]({{ site.baseurl }}/assets/images/goes-blind-by.jpg)
{:.meme}

Note that when $t$ is real,

$$ \left( e^{it}\right)^{-1} = e^{-it} = \overline{e^{it}}. $$

Key are the three special cases, $e^{i\pi/2} = i$, $e^{i\pi}=-1$, and $e^{2i\pi}=1$. For example,

$$
i^i = (e^{i\pi/2})^i = e^{i^2\pi/2} = e^{-\pi/2}.
$$

Euler's formula makes some trig identities into child's play:

$$
\begin{aligned}
\cos(2t) + i \sin(2t) = e^{2it} &= (e^{it})^2 \\
    &= (\cos(t) + i \sin(t))^2 \\
    &= (\cos^2(t) - \sin^2(t)) + i(2\sin(t)\cos(t)).
\end{aligned}
$$

Exponentials of complex numbers (having nonzero real and imaginary parts) simply obey the usual rules for exponentials:

$$
e^{a+ib} = e^a e^{ib} = e^a(\cos b + i\sin b) = (e^a \cos b) + i(e^a \sin b).
$$


## Geometry

There are profound connections between complex numbers and two-dimensional geometry. The starting point is the *complex plane*, where you plot with the real part horizontally and the imaginary part vertically. So $z=x+iy$ is the same as supplying the Cartesian coordinates $(x,y)$ of a point in the plane. By the Pythagorean Theorem, $\|z\|$ is the distance from $z$ to the origin. 

Note that Euler's identity for real $t$,

$$
e^{it} = \cos(t) + i \sin(t),
$$

is really about points on the unit circle of the complex plane; the point at angle $\theta$ lies at $(\cos \theta,\sin \theta)$, and thus $e^{i\theta}$ is equivalent to that point. As you know, any number in the plane can be expressed in polar coordinates $(r,\theta)$. As stated above, $r=\|z\|$. Observe that

$$re^{i\theta} = (r\cos \theta) + i (r\sin\theta) = x + iy.$$

The expression on the left can be thought of as the complex variables expression of a point using polar coordinates.

For complex numbers in rectangular or Cartesian form, it's easy to think of complex addition in terms of 2D vectors:

$$
(x_1+iy_1) + (x_2 + iy_2) = (x_1+x_2) + i(y_1+y_2).
$$

This is clearly just a restatement of

$$
\begin{bmatrix}
x_1 \\ y_1
\end{bmatrix}
+
\begin{bmatrix}
x_2 \\ y_2
\end{bmatrix}
=
\begin{bmatrix}
x_1+x_2 \\ y_1+y_2
\end{bmatrix}.
$$

In polar form, it's multiplication that becomes interesting:

$$
(r_1 e^{i\theta_1})(r_2 e^{i\theta_2}) = (r_1r_2) e^{i(\theta_1+\theta_2)}.
$$

That is, multiplication in the complex plane is equivalent to scaling and rotation. 


## Complex exponential functions

Suppose $\gamma = \alpha +i\beta$ and $t$ is real. Define

$$
f(t) = e^{\gamma t} = e^{(\alpha + i\beta)t} = e^{\alpha t} e^{i\beta t}.
$$

Using the polar interpretation, we see that $\|f(t)\|=e^{\alpha t}$. That is, the magnitude of $f(t)$ grows or decays exponentially in time, as controlled by the sign of the real part of $\gamma$. (The magnitude is constant at 1 in the edge case of $\alpha=0$.) The angle (or phase) of $f(t)$ varies linearly in time, at a frequency $\beta$. Of course, phase is only relevant modulo $2\pi$. 

(See MATLAB app complexExp.)

~~~matlab
gamma = 0.15 + 6i;
f = @(t) exp(gamma*t);
Re_f = @(t) real(f(t));
Im_f = @(t) imag(f(t));

clf
set(gcf,'defaultaxesdataaspectratiomode','manual')
subplot(2,1,1)
fplot(Re_f,[0 10],'linew',2)
hold on
fplot(Im_f,[0 10],'linew',2)
fplot(@(t) exp(real(gamma)*t),[0 10],'k--')
fplot(@(t) -exp(real(gamma)*t),[0 10],'k--')
xlabel('t'), ylabel('Re/Im parts of f(t)')

subplot(2,1,2)
t = linspace(0,6,350);
comet(Re_f(t),Im_f(t))
~~~

