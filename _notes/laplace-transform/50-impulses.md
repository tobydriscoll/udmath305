---
layout: note
title: "Impulses"
chapter: "Laplace transform"
---
* TOC
{:toc}

## Coffee intake

Earlier we saw that caffeine decays according to first-order kinetics (exponentially). How should we model the intake of caffeine through drinking coffee? 

We again assume that a large cup of coffee contains 300 mg of caffeine. One simple model is to assume constant consumption over half an hour, so that the caffeine concentration is "driven" at 16 (μg/mL)/hr over that time. So if consumption starts at time $c$, the forcing function is $16[u(t-c) - u(t-c-1/2)]$. We know how to cope with that.

Now suppose you guzzle the coffee in 15 minutes. That would be modeled as $32[u(t-c) - u(t-c-1/4)]$, again in our wheelhouse. If you slammed it all down in 5 minutes, first of all, that's kind of sad. Yet we could model it as the spike $96[u(t-c) - u(t-c-1/12)]$.

But say you prefer espresso and drink it like the Italians do, as one shot. We could model the spike to last a second or so. Often, though, we find it's more convenient to pass to an instantaneous limit. That's the idea behind an *impulse*{:.def} forcing.

## Dirac delta

An impulse is designated using the *Dirac delta*{:.def} $\delta(t)$. (We write it like a function, and people will call it a function, but it's not technically a function.) The value of $\delta(t)$ is zero if $t\neq 0$ and undefined at zero. We also have the defining property

$$ \int_I \delta(t)\, dt = 1,$$

if $I$ is any interval containing the origin. You can think of $\delta$ as a "kick" to the system being modeled, informally.

![Dirac]({{ site.baseurl }}/assets/images/dirac.jpeg)
{:.meme}

We can give an impulse an amplitude too, as in $A\delta(t)$. For an impulse at another time $t=p$, we use $\delta(t-p)$.

One way to think about $\delta$ is as a limiting process. Let $\delta_\epsilon(t)$ be a spike that is height $1/2\epsilon$ over $t\in[-\epsilon,\epsilon]$ and zero elsewhere. The area underneath the graph of $\delta_\epsilon(t)$ is one for all $\epsilon>0$. For many purposes, $\delta$ acts like the limit of $\delta_\epsilon$ as $\epsilon\to 0$. You get a spike of infinite height but infinitesimal width, such that the "area" underneath is one.

Let's make this more concrete. Suppose we integrate a function $f$ against the finite spike $\delta_\epsilon(t)$, over any interval $I$ containing the entire nonzero part of the spike. Then

$$\int_{I} \delta_\epsilon(t) f(t)\,dt = \int_{-\epsilon}^\epsilon \delta_\epsilon(t) f(t)\,dt= \frac{\phi(\epsilon)-\phi(-\epsilon)}{2\epsilon},$$

where $\phi$ is an antiderivative of $f$. Taking the limit as $\epsilon\to 0$,

$$\int_I \delta_\epsilon(t) f(t)\, dt  = \frac{1}{2} \frac{[\phi(\epsilon) - \phi(0)] + [\phi(0) - \phi(-\epsilon)]}{\epsilon} \rightarrow  \phi'(0) = f(0).$$

This justifies us saying that $\int_I \delta(t) f(t)\, dt=f(0)$, or more generally, 

$$\int_I \delta(t-p) f(t)\, dt = \begin{cases} f(p), & \text{if } p\in I, \\ 0, & \text{otherwise.} \end{cases}$$

## Transform

This is now easy.

$${\cal L}[\delta(t-p)] = \int_0^\infty \delta(t-p)e^{-st}\, dt = e^{-ps}.$$

And when the impulse time $p=0$, the Laplace transform is $F(s)\equiv 1$.

## IVPs

Returning to first-order PK with $y(-1)=0$, $y'+ky = C\delta(t)$, we get $Y(s) = C/(s+k)$, so $y(t)=Ce^{-kt}$. This is identical to starting with the initial condition $y(0)=C$ at $t=0$.

### Example

> Solve $y'' +y=4\delta(t-p)$, $y(0)=y'(0)=0$, where $p>0$.

$$Y(s) = \frac{4e^{-ps}}{s^2+1} = 4 e^{-ps} \left(\frac{1}{s^2+1}\right),$$

so $y(t)=4 u_{p}(t) \sin(t-p)$. The system just sits there until kicked, after which it oscillates forever.

### Example

> Solve $y'' + 2y' + 2y=\delta(t-\pi)$, $y(0)=1$, $y'(0)=0$.

Transformation gives

$$
Y(s) = \frac{1}{s^2+2s+2} \left[ s+2 + e^{-\pi s} \right]
$$

$$
Y(s) = 2 {\rm Re}\left[ \frac{(1-i)/2}{s-(-1+i)} \right] + 2 e^{-\pi s} {\rm Re}\left[ \frac{-i/2}{s-(-1+i)} \right]
$$

$$= Y_1(s) + e^{-\pi s} Y_2(s).$$

Whatever messy algebra details are to follow, one thing the LT makes clear is that the contributions of the initial conditions are entirely in $Y_1$, while the impulse is entirely within $e^{-\pi s} Y_2(s)$. We could actually solve those aspects of the problem separately and add the results together. Linearity rules!

Now as to those details\ldots

$$y_1(t) = e^{-t} {\rm Re}\left[ (1-i)e^{it} \right] = e^{-t}[\cos(t)+\sin(t)],$$

and

$$y_2(t) =  e^{-t} {\rm Re}\left[ (-i)e^{it} \right] = e^{-t}\sin(t).$$

So finally,

$$ y(t) = y_1(t) + u(t-\pi) y_2(t-\pi) = e^{-t} [ \cos(t)+\sin(t)] - u(t-\pi) e^{\pi-t} \sin(t).$$


## What does delta do?

### First-order problems

Let's look at the first-order IVP

$$ y' + ay = b \delta(t), \quad y(0)=0$$

for constants $a$ and $b$. We get

$$
Y(s) = \frac{b}{s+a},
$$

or $y(t)=be^{-at}$. This is identical to the solution of the homogeneous equation $y'+ay=0$ with $y(0)=b$. That is, delta "kicks" the $y$ value a bit, and then things evolve freely. If the kick occurs at a later time, as in $ y' + ay = b \delta(t-p)$, then $y=b u_p(t) e^{-a(t-p)}$. That is, nothing happens until the kick, and things evolve freely from there.

Two kicks must be twice as good, right?

$$ y' + ay = b_1 \delta(t-t_1) + b_2 \delta(t-t_2), \quad y(0)=0.$$

$$
Y(s) = e^{-t_1s} \frac{b_1}{s+a} + e^{-t_2s} \frac{b_2}{s+a},
$$

so $y(t) = b_1 u(t-t_1) e^{-a(t-t_1)} + b_2 u(t-t_2) e^{-a(t-t_2)}.$ The impulses do their things independently.

Suppose the forcing is $\sum_k b_k\delta(t-t_k)$. We'd write

$$y(t) = \sum_k b_k u(t-t_k) e^{-a(t-t_k)}.$$

Another way to write it that hides the step functions is

$$y(t) = \sum_{0\le t_k \le t}  b_k e^{-a(t-t_k)}.$$

Suppose there were zillions of impulses, packed together so densely that we stop trying to count or index them, and just use $b(\tau)$ to show the size of the impulse at time $\tau$. Wouldn't we like to write

$$y(t) = \int_0^t b(\tau) e^{-a(t-\tau)}\, d\tau.$$

Hold on. We can solve $y'+ay=b(t)$ with an integrating factor of $e^{at}$:

$$e^{at}y(t) - y(0) = \int_0^t b(\tau) e^{a\tau}\, d\tau.$$

It's exactly. The same. Formula! The forced system $y'+ay=b(t)$ is essentially constantly subjected to impulses, each giving a nudge to the solution value. 

### Second-order problems

What happens with impulses in a second-order problem? Consider

$$y'' + 2c y' + \omega_0^2 y = b \delta(t), \quad y(0)=y'(0)=0.$$

Then

$$Y(s) = \frac{b}{s^2 + 2c s + \omega_0^2}.$$

You can easily check that we get the same result for $Y$ from the problem 

$$y'' + 2c y' + \omega_0^2 y  = 0, \quad y(0)=0, \, y'(0)=b.$$

In the second-order case, impulse is equivalent to a nudge in the *velocity*. 

### Example 

*(see Exercise 5.7.17)* 

> Solve $y'' + y = \sum_{k=1}^{20} \delta(t-k\pi)$, $y(0)=y'(0)=0$.

It's easy to see that

$$Y(s) = \sum_{k=1}^{20} e^{-k\pi s} \left( \frac{1}{1+s^2} \right)$$

The inverse transform of the parenthesized quantity is $\sin(t)$, so $y(t) = \sum_{k=1}^{20} u_{k\pi}(t)\sin(t-k\pi).$ But if you think about it, these are very special phase shifts: $\sin(t-\pi)=-\sin(t)$, $\sin(t-2\pi)=\sin(t)$, etc. So in fact,

$$y(t) = \sin(t) \sum_{k=1}^{20} (-1)^k u_{k\pi}(t) = \sin(t) \sum_{m=1}^{10} u_{2m\pi}(t)-u_{(2m-1)\pi}(t)
= -\sin(t) \sum_{m=1}^{10} u_{(2m-1)\pi,2m\pi}(t).$$

So on intervals (odd,even) you get $-\sin(t)$, and on intervals (even,odd) you get zero. You keep kicking it and stopping it, over and over.

---

It's a little harder to summarize the continuous-impulse case with a formula, but the idea remains valid: a general forcing function is like a continuously varying impulse, each instant of which contributes to the motion. 


## Weird derivatives

Maybe you've observed that $\int_{-\infty}^t \delta(\tau)\, d\tau = u(t)$. If the integral of a delta is a step, does it follow that the derivative of a step is a delta? 

Remember how ${\cal L}[f'] = sF(s)-f(0)$? Then (assuming $c>0$),

$${\cal L}[u'_c(t)] = s(e^{-cs}/s) = e^{-cs} = {\cal L}[\delta(t-c)].$$

Yep. The derivative of $u_c$ is zero everywhere except at $t=c$, where it is infinite in a particular way. Truth be told, this point of view made mathematicians a little nervous until they spent a few decades building something called the theory of distributions to justify it. 


