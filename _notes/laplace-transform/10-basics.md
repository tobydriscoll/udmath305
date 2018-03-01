---
layout: note
title: "Basics"
chapter: "Laplace transform"
---
* TOC
{:toc}

*(See sections 5.1 and 5.2)*

*We hop aboard the Laplace Express, which takes us to a curious corner of Linearity Land. It's rumored that the inhabitants live by strange rules, and trying to leave it with functions in your luggage famously causes a nightmare of paperwork, if you can get them out at all. But stories of beautiful solutions for complicated inputs give the place a mysterious pull.*

Here is a rule for replacing a function $f(t)$ (defined for $t\ge 0$) by a counterpart $F(s)$ called its *Laplace transform*{:.def}:

$${\cal L}[f] = F(s) = \int_0^\infty f(t) e^{-st}\, dt.$$

(I use square brackets instead of the curly braces that the book uses. You use what you like.) In principle, for a given $s$ we could plug it into the integral and get a number, which is the value of $F(s)$. Often we could evaluate the defining integral symbolically to get an expression for $F(s)$. 

In practice, though, you learn to do Laplace transforms on actual functions the same way you learned to take derivatives, by learning key canonical cases and how they combine in more complicated instances. 

## Canonical Example 1

Let $f(t)\equiv 1$. 

$${\cal L}[1] = \int_0^\infty e^{-st}\, dt = \left[ -\frac{1}{s} e^{-st} \right]_0^\infty = \frac{1}{s},$$

assuming we restrict to $s>0$. 

## Canonical Example exp

$${\cal L}[e^{(a+bi)t}] = \int_0^\infty e^{(a+bi-s)t}\, dt = \left[ -\frac{1}{s-a-bi} e^{(a+bi-s)t} \right]_0^\infty = \frac{1}{s-a-bi},$$

though we must restrict to $s>a$. We're just going to ignore those restrictions on $s$, which only matter when you dive into the technicalities.

## Canonical Example trig

Here's some fun. Since $\sin(bt) = \text{Im}[e^{ibt}]$, 

$$
{\cal L}[\sin(bt)] = \text{Im}({\cal L}[e^{ibt}]) = \text{Im}\left( \frac{1}{s-ib} \frac{s+ib}{s+ib} \right) = \frac{b}{s^2+b^2}.
$$

For cos, we just take the real part instead, and get

$${\cal L}[\cos(bt)] =  \frac{s}{s^2+b^2}.$$

## Canonical Example $d/dt$

*(See Theorem 5.2.2)*

Here we come the main attraction of riding the Laplace Express: it turns calculus into algebra. 

You'll have to brush up on integration by parts to follow this derivation:

$$\begin{aligned}
{\cal L}[f'] = \int_0^\infty f'(t) e^{-st}\, dt 
&= \left[ f(t)e^{-st}\right]_0^\infty - \int_0^\infty (-s) f(t) e^{-st}\, dt\\
    &= -f(0) + s {\cal L}[f].
\end{aligned}$$

That is, if the transform of $f(t)$ is $F(s)$, then the transform of $f'(t)$ is $sF(s)-f(0)$. See? calculus became algebra.

This generalizes to 

$${\cal L} [f''] = s {\cal L}[f'(t)]  - f'(0) =   s^2 F(s) - sf(0) - f'(0)$$

and 

$${\cal L} [f^{(n)}] = s^n F(s) - s^{(n-1)}f(0) - \cdots - f^{(n-1)}(0).$$

## Canonical Example power

*(See Theorem 5.2.4)*

OK. We just saw that if we differentiate in $t$-space, then we multiply in $s$-space. What if we differentiate in $s$-space? 

$$
\begin{aligned}
F'(s) &= \frac{d}{ds} \int_0^\infty f(t) e^{-st}\, dt \\
&= \int_0^\infty -t f(t) e^{-st}\, dt \\
&= -{\cal L}[tf(t)].
\end{aligned}
$$

![Diff/mult]({{ site.baseurl }}/assets/images/diff-mult.jpg)
{:.meme}

The general rule is

$$\frac{d}{ds} {\cal L}[f(t)] = (-1)^n {\cal L}[t^nf(t)].$$ 

A very important special case of this rule is if $f(t)\equiv 1$. We repeatedly differentiate $F(s)=s^{-1}$ and get

$$ {\cal L}[t^n] = \frac{n!}{s^{n+1}}.$$ 


## Canonical Example shift

*(See Theorem 5.2.1)*

Finally, something memorable happens if we multiply any $f(t)$ by an exponential: 

$${\cal L}[e^{at}f(t)] = \int_0^\infty f(t)e^{(a-s)t}\,dt = \left[\int_0^\infty f(t)e^{-ut}\,dt\right]_{u=s-a} =F(s-a).$$

## Linearity

*(See Theorem 5.1.2)*

One more important thing before we see some examples. It's trivial to show that the Laplace transform is a linear operator. That is,

$${\cal L}[c_1f_1(t)+c_2f_2(t)] = c_1 {\cal L}[f_1(t)] + c_2 {\cal L}[f_2(t)].$$

## Examples

> *Transform $f(t)=e^{-t}\cos(3t)$.*

Let $g(t) = \cos(3t)$. We use [Canonical Example trig](#canonical-example-trig) first and get $G(s) = s/(s^2+9)$. 

Now use [Canonical Example shift](#canonical-example-shift) to get $F(s) = G(s+1) = (s+1)/((s+1)^2+9)$. No need to simplify, really.  

> *Transform $f(t)=t^2-te^{2t}$.*

Let $f_1=t^2$ and $f_2=te^{2t}$. Referring to [Canonical Example $d/dt$](#canonical-example-ddt), [Canonical Example 1](#canonical-example-1), and
[Canonical Example exp](#canonical-example-exp),

$$F_1(s) = (-1)^2 \frac{d^2}{ds^2} {\cal L}[1] = \frac{d^2}{ds^2}[1/s] = 2s^{-3}.$$

$$F_2(s) = (-1)^1 \frac{d}{ds} {\cal L}[e^{2t}] = (s-2)^{-2}. $$

Hence $$F(s) = (2/s^3) - 1/(s-2)^2.$$

> *How about a driven, undamped oscillator? Say, $my'' + ky = \sin(\omega t)$, $y(0)=1$, $y'(0)=0$.*

Go piece by piece.

$$m [s^2Y(s) - sy(0) - y'(0)] + kY(s) = \frac{\omega}{s^2+\omega^2}$$

or

$$ (ms^2+k)Y(s) = s  + \frac{\omega}{s^2+\omega^2}.$$

It's impossible to resist the temptation to solve for $Y$!

$$ Y(s) = \frac{\omega + s(s^2+\omega^2)}{(ms^2+k)(s^2+\omega^2)}.$$

Uh, now what?

![Inverse transforms]({{ site.baseurl }}/assets/images/inverse-transforms.jpg)
{:.meme}
