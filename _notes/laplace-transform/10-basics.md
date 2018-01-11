---
layout: note
title: "Basics"
chapter: "Laplace transform"
---
* TOC
{:toc}

*(See sections 5.1 and 5.2)*

What if we lived in Exponential Town? 

In Exponential Town, every function is an exponential. Taking its derivative is so easy--just multiply by a number. Integration is pretty easy, too (as soon as you figure out how to get a unique result). 

Sadly, Exponential Town isn't rich enough to sustain itself. But that doesn't mean we can't visit. While we're there, the functions we bring with us are remarkably chill about being differentiated. ODEs look like simple algebra. The tricky part is trying to bring the functions back home with us. Some of them, including a lot that are fun to hang out with, make the trip back just fine. But many require extensive surgery. Some just don't make it.

Here's how we take a function $f(t)$, defined for all $t\ge 0$, to Exponential Town. It's called the Laplace Express--I mean, Transform.

$${\cal L}[f] = F(s) = \int_0^\infty f(t) e^{-st}\, dt.$$

(I use square brackets instead of curly braces, which the book uses, because they're a tad easier to type. Don't make it a thing.) See what's happening here? The transformed function depends on a variable which we consistently call $s$. It's inside the integral. After the integration, we get a number that depends on $s$. That's the value of $F(s)$. 

### Canonical Example 1

Let $f(t)\equiv 1$. 

$${\cal L}[1] = \int_0^\infty e^{-st}\, dt = \left[ -\frac{1}{s} e^{-st} \right]_0^\infty = \frac{1}{s},$$

assuming we restrict to $s>0$. 

### Canonical Example exp

$${\cal L}[e^{(a+bi)t}] = \int_0^\infty e^{(a+bi-s)t}\, dt = \left[ -\frac{1}{s-a-bi} e^{(a+bi-s)t} \right]_0^\infty = \frac{1}{s-a-bi},$$

though we must restrict to $s>a$. 

### Canonical Example trig

Here's some fun. Since $\sin(bt) = \text{Im}[e^{ibt}]$, 

$${\cal L}[\sin(bt)] = \text{Im}({\cal L}[e^{ibt}]) = \text{Im}\left( \frac{1}{s-ib} \frac{s+ib}{s+ib} \right) = \frac{b}{s^2+b^2}$$,

where $s>0$. 

For cos, we just take the real part instead, and get $s/(s^2+b^2)$. 

### Canonical Example $d/dt$

*(See Theorem 5.2.2)*

Remember why we're going to Exponential Town? The whole idea was to make calculus into algebra. 

You'll have to brush up on integration by parts to follow. 

$$\begin{aligned}
{\cal L}[f'] = \int_0^\infty f'(t) e^{-st}\, dt 
&= \left[ f(t)e^{-st}\right]_0^\infty - \int_0^\infty (-s) f(t) e^{-st}\, dt\\
    &= -f(0) + s {\cal L}[f].
\end{aligned}$$

That is, if the transform of $f(t)$ is $F(s)$, then the transform of $f'(t)$ is $sF(s)-f(0)$. Algebra, as promised.

This generalizes to 

$${\cal L} [f''] = s {\cal L}[f'(t)]  - f'(0) =   s^2 F(s) - sf(0) - f'(0)$$

and 

$${\cal L} [f^{(n)}] = s^n F(s) - s^{(n-1)}f(0) - \cdots - f^{(n-1)}(0).$$

### Canonical Example power

*(See Theorem 5.2.4)*

OK. If we differentiate in $t$-space, we multiply in $s$-space. What if we differentiate in $s$-space? 

$$
\begin{aligned}
F'(s) &= \frac{d}{ds} \int_0^\infty f(t) e^{-st}\, dt \\
&= \int_0^\infty -t f(t) e^{-st}\, dt \\
&= -{\cal L}[tf(t)].
\end{aligned}
$$

That. Is. Cool! The general rule is

$$\frac{d}{ds} {\cal L}[f(t)] = (-1)^n {\cal L}[t^nf(t)].$$


### Canonical Example shift

*(See Theorem 5.2.1)*

Finally, remember that if we multiply exponentials together, you get another exponential with added exponents. How does this affect Exponential Town?

$${\cal L}[e^{at}f(t)] = \int_0^\infty f(t)e^{(a-s)t}\,dt = \left[\int_0^\infty f(t)e^{-ut}\,dt\right]_{u=s-a} =F(s-a).$$

### Linearity

*(See Theorem 5.1.2)*

One more thing before we see some examples. It's almost trivial to show that the transform is a linear operator, that is,

$${\cal L}[c_1f_1(t)+c_2f_2(t)] = c_1 {\cal L}[f_1(t)] + c_2 {\cal L}[f_2(t)].$$

### Examples

*Transform $f(t)=e^{-t}\cos(3t)$.*

Let $g(t) = \cos(3t)$. We use [Canonical Example trig](#canonical-example-trig) first and get $G(s) = s/(s^2+9)$. 

Now use [Canonical Example shift](#canonical-example-shift) to get $F(s) = G(s+1) = (s+1)/((s+1)^2+9)$. No need to simplify, really.  

*Transform $f(t)=t^2-te^{2t}$.*

Let $f_1=t^2$ and $f_2=te^{2t}$. Referring to [Canonical Example $d/dt$](#canonical-example-ddt), [Canonical Example 1](#canonical-example-1), and
[Canonical Example exp](#canonical-example-exp),

$$F_1(s) = (-1)^2 \frac{d^2}{ds^2} {\cal L}[1] = \frac{d^2}{ds^2}[1/s] = 2s^{-3}.$$

$$F_2(s) = (-1)^1 \frac{d}{ds} {\cal L}[e^{2t}] = (s-2)^{-2}. 

Hence $$F(s) = (2/s^3) - 1/(s-2)^2.$$

*How about a driven, undamped oscillator? Say, $my'' + ky = \sin(\omega t)$, $y(0)=1$, y'(0)=0$.*

Go piece by piece.

$$m [s^2Y(s) - sy(0) - y'(0)] + kY(s) = \frac{\omega}{s^2+\omega^2}$$

or

$$ (ms^2+k)Y(s) = s  + \frac{\omega}{s^2+\omega^2}.$$

It's impossible to resist the temptation to solve for $Y$!

$$ Y(s) = \frac{\omega + s(s^2+\omega^2)}{(ms^2+k)(s^2+\omega^2)}.$$

Uh, now what? 