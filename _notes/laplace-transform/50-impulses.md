---
layout: note
title: "Impulses"
chapter: "Laplace transform"
---
* TOC
{:toc}

## Coffee intake

Earlier we saw that caffeine decays according to first-order kinetics (exponentially). How should we model the intake of caffeine through drinking coffee? 

We again assume that a large cup of coffee contains 300 mg of caffeine. One simple model is to assume constant consumption over half an hour, so that the caffeine concentration is "driven" at 16 (μg/mL)/hr over that time. So if consumption starts at time $t_c$, the forcing function is $16(u(t-t_c) - u(t-t_c-1/2)$. We know how to cope with that.

Now suppose you guzzle the coffee in 15 minutes. That would be modeled as $32(u(t-t_c) - u(t-t_c-1/4)$, again in our wheelhouse. If you slammed it all down in 5 minutes, first of all, that's kind of sad. Yet we could model it as the spike $96(u(t-t_c) - u(t-t_c-1/12)$.

But say you prefer espresso and drink it like the Italians do, as one shot. We could model the spike to last a second or so. Often, though, we find it's more convenient to pass to an instantaneous limit. That's the idea behind an *impulse*{:.def} forcing.

## Dirac delta

An impulse is designated using the *Dirac delta*{:.def} $\delta(t)$. (We write it like a function, and people will call it a function, but it's not technically a function.) The value of $\delta(t)$ is zero if $t\neq 0$ and undefined at zero. We also have the defining property

$$ \int_I \delta(t)\, dt = 1,$$

if $I$ is any interval containing the origin. You can think of $\delta$, and its effects, as the limit of a family of spikes that get taller and narrower, with constant unit area inside. It's also called a "kick", informally.

![Dirac]({{ site.baseurl }}/assets/images/dirac.jpeg)


We can give an impulse an amplitude too, as in $a\delta(t)$. For an impulse at another time $t_i$, we use $\delta(t-t_i)$.

Here's an interesting and critical property. Suppose we integrate a function $f$ over a tiny interval $(-\epsilon,\epsilon)$ that supports a spike $\delta_\epsilon(t)$ of height $1/(2\epsilon)$. Again let $I$ contain the origin, so it also contains $(-\epsilon,\epsilon)$ if we're small enough. Then

$$\int_{I} \delta_\epsilon(t) f(t)\,dt = \frac{\phi(\epsilon)-\phi(-\epsilon)}{2\epsilon},$$

where $\phi$ is the antiderivative of $f$. Taking the limit as $\epsilon\to 0$,

$$\int_I \delta(t) f(t)\, dt  = \frac{[\phi(\epsilon) - \phi(0)] + [\phi(0) - \phi(-\epsilon)]}{2\epsilon} = \phi'(0) = f(0).$$

In general, if $t_i\in I$,

$$\int_I \delta(t) f(t)\, dt = f(t_i).$$

## Transform

This is now easy.

$${\cal L}[\delta(t-t_i)] = \int_0^\infty \delta(t-t_i)e^{-st}\, dt = e^{-t_is}.$$

And when the impulse time is $t_i=0$, the Laplace transform is $F(s)\equiv 1$.

## IVPs

Returning to first-order PK with $y(-1)=0$, $y'+ky = C\delta(t)$, we get $Y(s) = C/(s+k)$, so $y(t)=Ce^{-kt}$. This is identical to starting with the initial condition $y(0)=C$ at $t=0$.

Another illustrative case is $y'' +y=A\delta(t-t_i)$, $y(0)=y'(0)=0$, where $t_i>0$. We get

$$Y(s) = \frac{Ae^{-t_is}}{s^2+1} = A e^{-t_is} \left(\frac{1}{s^2+1}\right),$$

so $y(t)=A u_{t_i}(t) \sin(t-t_i)$. The system just sits there until kicked, after which it oscillates forever.

### Example 

*(see Exercise 5.7.17)* 

> *Solve $y'' + y = \sum_{k=1}^{20} \delta(t-k\pi)$.*

It's easy to see that

$$Y(s) = \sum_{k=1}^{20} e^{-k\pi s} \left( \frac{1}{1+s^2} \right)$$

The inverse of the parenthesized quantity is $\sin(t)$, so $y(t) = \sum_{k=1}^{20} u_{k\pi}(t)\sin(t-k\pi).$ But if you think about it, these are very special phase shifts: $\sin(t-\pi)=-\sin(t)$, $\sin(t-2\pi)=\sin(t)$, etc. So in fact,

$$y(t) = \sin(t) \sum_{k=1}^{20} (-1)^k u_{k\pi}(t) = \sin(t) \sum_{m=1}^{10} u_{2m}(t)-u_{2m-1}(t)
= -\sin(t) \sum_{m=1}^{10} u_{2m-1,2m}(t).$$

So on intervals (odd,even) you get $-\sin(t)$, and on intervals (even,odd) you get zero. You keep kicking it and stopping it, over and over.

## Weird derivatives

Maybe you've observed that $\int_{-\infty}^t \delta(\tau)\, d\tau = u(t)$. If the integral of a delta is a step, does it follow that the derivative of a step is a delta? 

Remember how ${\cal L}[f'] = sF(s)-f(0)$? Then (assuming $c>0$),

$${\cal L}[u'_c(t)] = s(e^{-cs}/s) = e^{-cs} = {\cal L}[\delta(t-c)].$$

Yep. The derivative of $u_c$ is zero everwhere except at $t_c$, where it is infinite in a particular way. 


