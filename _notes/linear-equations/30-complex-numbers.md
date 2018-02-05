---
layout: default
title: "Complex numbers"
chapter: "Linear equations"
---
* TOC
{:toc}

*For a really smart and entertaining introduction to complex numbers, I recommend [this video series](https://youtu.be/T647CGsuOVU).*

## The reality of imaginary numbers

We need to take a short but highly relevant detour to talk about complex numbers. 

There's a lot of weirdness about complex numbers. Terminology is part of the reason. Using "real" and "imaginary" to label numbers suggests a strong value judgment, one that ruled mathematics for centuries. But complex numbers are actually just as "real" as so-called real numbers--if anything, they are more fundamental to the universe, by a country mile. 

Let's rewind a bit. We can probably take for granted the positive integers 1, 2, 3, and so on (although the "and so on" part is a bit fishy in a finite universe), and we'll throw in zero too (though this too was controversial for centuries). It's not long before we want to solve a problem like $x+1=0$. Annoyingly, we can pose the problem using just nonnegative integers, but we can't solve it. So we accept the existence of the negative integers. 

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

Hence for real $t$, $e^{it}$ is the point at angle $t$ on the unit circle. Note also that for such a point,

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


## Geometry

There are profound connections between complex numbers and two-dimensional geometry. The starting point is the *complex plane*, where you plot with the real part horizontally and the imaginary part vertically. So $z=x+iy$ is the same as supplying the Cartesian coordinates $(x,y)$ of a point in the plane. By the Pythagorean Theorem, $\|z\|$ is the distance from $z$ to the origin. 

Note that Euler's identity is really about points on the unit circle of the complex plane; the point at angle $\theta$ lies at $(\cos \theta,\sin \theta)$, and thus $e^{i\theta}$ is equal to that point. For any nonzero point not on the unit circle, we can normalize it to get the angle, and therefore write

$$
z = |z|\cdot \frac{z}{|z|} = |z| e^{i\theta},
$$

which is an expression in polar coordinates. And if we multiply together two numbers in polar form,

$$
(r_1 e^{i\theta_1})(r_2 e^{i\theta_2}) = (r_1r_2) e^{i(\theta_1+\theta_2)}.
$$

So multiplication in the complex plane is equivalent to scaling and rotation. 

## Complex exponentials

If $\alpha$, $\beta$, and $t$ are real, then in polar form,

$$
f(t) = e^{(\alpha + i\beta)t} = e^{\alpha t} e^{i\beta t}.
$$

As $t$ increases, the magnitude of $f(t)$ varies exponentially, at rate $\alpha$. The angle (or phase) of $f$ increases linearly in time at rate $\beta$, though of course phase is only relevant modulo $2\pi$. 

(See MATLAB app complexExp.)
