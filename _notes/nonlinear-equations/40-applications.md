---
layout: note
title: "Applications"
chapter: "Nonlinear equations"
---
* TOC
{:toc}

## Population dynamics

*(Seen in a MATLAB project. Also see section 2.5.)*

Populations of organisms and cells are driven by intrinsic dynamics of birth and death. The most fundamental description is

$$\frac{1}{P}\frac{dP}{dt} = \beta - \delta,$$

where $\beta$ and $\delta$ are per capita birth and death rates. This model leads to $P'=rP$, i.e., exponential growth or decay.

Next in the hierarchy is the *logistic model*{:.def},

$$\frac{1}{P}\frac{dP}{dt} = r\left(1-\frac{P}{K}\right),$$ 

in which $r>0$ is the growth rate when $P\ll K$, and $K>0$ is the constant *carrying capacity*{:.def}. Setting $f(P)=rP(1-P/K)$, we note equilibria at $P=0$ and $P=K$. Since $f'(P) = r(1-2P/K)$, we find $f'(0)>0$ (unstable) and $f'(K)<0$ (stable). The logistic equation is separable and can be solved explicitly.

### Solution of the logistic model

$$ \frac{K\,dP}{P(K-P)} = r\, dt$$

Partial fractions alert!

$$\int \left[ \frac{1}{P} + \frac{1}{K-P} \right] \, dP = \int r\, dt$$

$$\ln\left( \frac{P}{K-P} \right) = rt + C$$ 

$$ \frac{P}{K-P}  = Ae^{rt}$$

This is a good place to set $t=0$, $P=P_0$, to get $A=P_0/(K-P_0)$. Continuing to solve for $P$,

$$ P = \frac{AK e^{rt}}{1 + Ae^{rt}} = \frac{P_0K}{(K-P_0)e^{-rt} + P_0}.$$

From this it's easy to see that $P\to K$ as $t\to\infty$.

## Threshold model

The *threshold model*{:.def} is 

$$\frac{dP}{dt} = -rP\left(1-\frac{P}{T}\right),$$ 

where $T$ is the *threshold*{:.def}. All we did was change $K$ to $T$ and $r$ to $-r$. However, this makes $P=0$ a stable equilibrium and $P=T$ an unstable one, and the long-term behavior is very different:

$$ P = \frac{P_0T}{(T-P_0)e^{rt} + P_0}.$$

The denominator is zero if ever $e^{rt}=P_0/(P_0-T)$. This happens for $t>0$ if, and only if, $P_0>T$; this is a "doomsday" of infinite population at a finite time. On the other hand, if $P_0<T$, the solution exists at all $t>0$, and $P\to 0$ as $t\to\infty$. 

## Combined model

The logistic and threshold models are combined in

$$\frac{dP}{dt} = -rP\left(1-\frac{P}{K}\right)\left(1-\frac{P}{T}\right),$$

where $0<T<K$. We have equilibria at $P=0$, $P=T$, and $P=K$. Setting $f(P)$ to the right-hand side of the ODE, we get

$$f'(P) = -r\left[ \left(1-\frac{P}{K}\right)\left(1-\frac{P}{T}\right) - \frac{1}{K} P \left(1-\frac{P}{T}\right) - \frac{1}{T} P \left(1-\frac{P}{K}\right) \right].$$

$$\begin{split}
f'(0) &= -r < 0, \\
f'(T) &= r\left( 1-\frac{T}{K} \right) > 0,\\
f'(K) &= r\left( 1-\frac{K}{T} \right) < 0,
\end{split}$$

hence $0$ and $K$ are stable equilibria, while $T$ is unstable. Solutions converge to $0$ or to $K$ as $t\to\infty$, depending on whether $P_0>T$. 

These basic models can be combined with effects such as harvesting, species competition, and spatial distribution in more complex DE formulations. 

## Gompertz growth

The *Gompertz equation*{:.def} is considered a fundamental model of tumor growth ([West et al., 2016](http://epubs.siam.org.udel.idm.oclc.org/doi/abs/10.1137/15M1044825)). Here $P$ is a population of cancer cells, growing at a decreasing rate:

$$P' = \gamma(t) P, \qquad \gamma' = -\alpha \gamma.$$

We thus get a separable equation for $P$:

$$\frac{dP}{dt} = \gamma_0 e^{-\alpha t} P.$$

Thus $\ln P = -(\gamma_0/\alpha) e^{-\alpha t} + C$, which leads to

$$P = P_0 \exp\left[ \frac{\gamma_0}{\alpha} (1-e^{-\alpha t}) \right].$$

~~~matlab
gamma0 = 0.6;
alpha = 0.1;
P = @(t) exp( (gamma0/alpha)*(1-exp(-alpha*t)) );
fplot(P,[0 100])
~~~

There are three growth regimes: the subclinical phase, marked by increasing $P'$ and $P''$ and exponential growth in $P$, the clinical phase, in which $P'$ reaches a maximum and $P$ increases close to linearly, and the saturation phase, with a rapidly slowing growth rate. 

## Toricelli's Law

Suppose a bucket of cross-sectional area $A$ contains water of height $h(t)$. The tank has a small hole at the bottom of cross-sectional area $a$. Then *Toricelli's Law*{:.def} states that the water exiting through the hole has the same kinetic energy as water at the top of the bucket; that is, it exits with velocity $v$ satisfying

$$v^2=2gh,$$

where $g$ is gravitational acceleration. The rate of volume decrease due to exiting water is $av$, which must be equaled by a change in height, $h'A$. So

$$\frac{dh}{dt} = -\frac{a}{A}\sqrt{2gh}.$$

![Bucket]({{ site.baseurl }}/assets/images/bucket.jpg)
{:.meme}


This equation is separable:

$$2\sqrt{h} = -\frac{a\sqrt{2g}}{A}t + C$$ 

$$2\sqrt{h} = -\frac{a\sqrt{2g}}{A}t + 2\sqrt{h_0}$$

$$h = \left( \sqrt{h_0} - \frac{a\sqrt{g}}{A\sqrt{2}}t  \right)^2.$$

The time it takes for the bucket to empty is $A\sqrt{2h_0}/(a\sqrt{g})$.  

