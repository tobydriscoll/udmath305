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

where $\beta$ and $\delta$ are per capita birth and death rates. This model leads to exponential growth or decay.

Next in the hierarchy is the *logistic model*,

$$\frac{1}{P}\frac{dP}{dt} = rP(1-P/K),$$ 

in which $K$ is the *carrying capacity*. Setting $f(P)=rP(1-P/K)$, we note equilibria at $P=0$ and $P=K$. Since $f'(P) = r(1-2P/K)$, we find $f'(0)>0$ (unstable) and $f'(K)<0$ (stable). The logistic equation is separable and can be solved explicitly.

The *threshold model* is 

$$\frac{1}{P}\frac{dP}{dt} = -rP(1-P/T),$$ 

where $T$ is the *threshold*. All we did was change $K$ to $T$ and $r$ to $-r$. This makes $P=0$ a stable equilibrium and $P=T$ an unstable one. As a result, the long-term behavior is very different. 

The logistic and threshold models are combined in

$$\frac{1}{P}\frac{dP}{dt} = -rP(1-P/K)(1-P/T),$$

where $0<T<K$. You can check that $0$ and $K$ are stable equilibria, while $T$ is unstable. 

These basic models can be combined with effects such as harvesting, species competition, and spatial distribution in more complex DE formulations. 

## Gompertz growth

The *Gompertz equation* is considered a fundamental model of tumor growth ([West et al., 2016](http://epubs.siam.org.udel.idm.oclc.org/doi/abs/10.1137/15M1044825)). Here $P$ is a population of cancer cells, growing at a decreasing rate:

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

Suppose a tank of cross-sectional area $A$ contains water of height $h(t)$. The tank has a small hole at the bottom of cross-sectional area $a$. Then *Toricelli's Law* states that the water exiting through the hole has the same kinetic energy as water at the top of the tank; that is, it exits with velocity $v$ satisfying

$$v^2=2gh,$$

where $g$ is gravitational acceleration. The rate of volume decrease due to exiting water is $av$, which must be equaled by a change in height, $h'A$. So

$$\frac{dh}{dt} = -\frac{a}{A}\sqrt{2gh}.$$

This equation is separable:

$$2\sqrt{h} = -\frac{a\sqrt{2g}}{A}t + C$$ 

$$2\sqrt{h} = -\frac{a\sqrt{2g}}{A}t + 2\sqrt{h_0}$$

$$h = \left( \sqrt{h_0} - \frac{a\sqrt{g}}{A\sqrt{2}}t  \right)^2.$$

The time it takes for the tank to empty is $A\sqrt{2h_0}/(a\sqrt{g})$.  

