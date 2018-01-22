---
layout: note
title: "First order"
chapter: "Linear equations"
---
* TOC
{:toc}

*See section 2.2, and section 2.3 excluding Example 4.* 

We start with first-order linear equations, which is about as simple as ODEs can get. That is, we are already guaranteeing F, L, and S in our classification scheme. Let's go even further and go for the all-caps FLASH:

$$
a \frac{dy}{dt} + by = 0,
$$

where $a$ and $b$ are constants. Of course, it's not an ODE if $a=0$, so we rule that out. And then we might as well divide through by $a$ and rename the constant to get simply

$$
\frac{dy}{dt} + by = 0.
$$

This is truly a minimalist ODE! 

You already know the answer to this problem. Once we rewrite it as $y=-by$, it's clear that the solution must be $y(t)=Ce^{-bt}$ for any choice of the constant $C$. We'll call this the *general solution*{:.def} of the ODE.

Our next step up the ladder will be to go from type A to a, to get FLaSH. That is, we let the coefficient become a function of the independent variable $t$:

$$
\frac{dy}{dt} + b(t)y = 0.
$$

It's pretty tempting to continue with the exponential function to get the solution. To do this, suppose $y(t)=C\exp(B(t))$. Then by the chain rule for derivatives, we'll be fine as long as $B'(t)=-b(t)$. In other words, we just need to find an antiderivative of $-b$, and we get a solution:

$$
\frac{dy}{dt} + b(t)y = 0 \Rightarrow y = C \exp\left[\int -b(t)\,dt\right].
$$

There's an interesting aspect to this result. The indefinite integral (i.e., antiderivative) gives us an extra additive constant. So we ought to get 

$$
y = C \exp(B(t)+K)
$$

for another aribtrary constant $K$. But this is the same as 

$$
y = (Ce^K) \exp(B(t)),
$$

which means that nothing new is introduced by $K$, as we still just have an arbitrary constant out in front. So we can ignore the integration constant. 

## Integrating factor

Now let's look at the most general case of a linear, first-order equation (FLaSh),

$$
a(t) \frac{dy}{dt} + b(t)y = c(t).
$$

First we divide through by $a(t)$ to get what the book calls *standard form*{:.def},

$$
\frac{dy}{dt} + p(t)y = q(t).
$$

(The question of what happens if $a$ is zero at some value of $t$ is an interesting one, and we'll get back there soon.) The presence of $q(t)$ on the right side is a new wrinkle, and we need to modify our approach. Suppose we multiply through on both sides by a term in the form of $\exp(\mu(t))$, with $\mu(t)$ to be determined shortly. Then

$$
e^{\mu(t)} \frac{dy}{dt} + p(t)e^{\mu(t)} y = e^{\mu(t)} q(t).
$$

Why was this a good idea? Well, if we use the product and chain rules for differentiation, we see that we can rewrite this as

$$
\frac{d}{dt} \left[ e^{\mu(t)} y(t) \right] = e^{\mu(t)} q(t),
$$

provided only that $p(t)=\mu'(t)$. The left side can be integrated immediately (which is why $e^\mu$ is called an *integrating factor*{:.def}), leading to the formal solution

$$
 y(t) = e^{-\mu(t)} \int e^{\mu(t)} q(t)\, dt.
$$

This is a bit of a mouthful as a formula, and remember that the integral written here is an indefinite one, so it brings out an arbitrary constant. It's better to think of the solution as a process, rather than a formula:

1. If necessary, bring the equation into standard form; the coefficient of $dy/dt$ must equal one.
1. (First integration) Find $\mu(t)=\int p(t)\, dt$. You can omit this integration constant (for the same reasons we did in the simpler case above). 
1. Multiply both sides of the original ODE by $e^{\mu(t)}$. 
1. Rearrange the left-hand side into the derivative of $e^{\mu(t)} y(t)$. (If this is impossible, you've messed up.)
1. (Second integration) Integrate both sides, this time including the integration constant on the right-hand side. 
1. Multiply through by $e^{-\mu(t)}$. Solved!


![Integrating factor]({{ site.baseurl }}/assets/images/integrating-factor.jpg)

### Example

> Solve $y'+2y = te^{-2t}$.

This is already in standard form.

$$
\begin{aligned}
\mu(t) &= \int 2\, dt = 2t\\
 e^{2t} y' + 2 e^{2t}y &= t \\
[e^{2t}y]' &= t \\
e^{2t}y &= \frac{1}{2}t^2+C\\
y &=  \frac{1}{2}t^2e^{-2t} + Ce^{-2t}
\end{aligned}
$$

Since the solution has an arbitrary constant in it, we call it the general solution. 

![plot of solutions](10-example1.svg)

```matlab
for C = -3:3
    y = @(t) t.^2.*exp(-2*t)/2 + C*exp(-2*t);
    fplot(y,[-3 3])
    hold on
end
ylim([-10 10])
xlabel t, ylabel y
```

### Example

> Solve $ty'+2y = 4t^2$.

A common error is to forget to put the equation into standard form first. Here, that means dividing through by $t$.

$$
\begin{aligned}
\mu(t) &= \int \frac{2}{t}\, dt = 2 \ln t\\
 t^2 y' + 2 ty &= 4t^3 \\
[t^2 y]' &= 4t^3 \\
t^2 y &= t^4+C\\
y &=  t^2 + C t^{-2}
\end{aligned}
$$

An interesting thing about this solution is that it (usually) does not exist at $t=0$. This is where the coefficient function $2/t$ fails to exist, too. 

![plot of solutions](10-example2.svg)

```matlab
for C = -3:3
    y = @(t) t.^2 + C./t.^2;
    fplot(y,[-2 2])
    hold on
end
ylim([-5 5])
xlabel t, ylabel y
```
## IVPs

When initial conditions are given, it pins down the value of the arbitrary constant. That is, one of the solution curves is selected--the one that passes through the point specified by the initial condition. 

### Example (*see Example 3 in section 2.3*)

*A pond holds 10 million L of water. Each year, 5 million L flow in and out of the pond (leaving its volume constant). Though the pond [was originally pristine](https://youtu.be/94bdMSCdw20), the inflowing water has become contaminated with benzene, whose concentration varies according to $\gamma(t) = 2 + \sin 2t$ g/L. Find the mass of benzene in the pond as a function of time.*

In a "word problem", the first item of business is to find a mathematical model. Here we apply conservation of mass. If $Q(t)$ is the mass of benzene in the pond, then

$$
\frac{dQ}{dt} = \text{mass inflow rate} - \text{mass outflow rate}. 
$$

The inflow rate is calculated as 

$$
\gamma(t) \frac{\text{g}}{\text{L}} \times (5\times 10^6) \frac{\text{L}}{\text{year}}.
$$

The amount flowing out depends on the current concentration:

$$
\frac{Q(t)}{10^7}  \frac{\text{g}}{\text{L}} \times (5\times 10^6) \frac{\text{L}}{\text{year}} = \frac{Q(t)}{2} \frac{\text{g}}{\text{year}}.
$$

Hence

$$
\frac{dQ}{dt} = (5\times 10^6)\gamma(t) - \frac{1}{2}Q.
$$

It's a bit more convenient if we measure mass in megagrams; i.e., let $q=Q/10^6$. Then also $q'=Q'/10^6$, and after the smoke clears,

$$
q' +  \frac{1}{2}q = 5 \gamma(t),
$$

which is in standard form. One more bit of data is that $q(0)=0$, so we have a FLaShI problem. 

We'll be able to solve it, but it's interesting to see the solution computationally first. 

```matlab
dom = [0 20];
N = chebop(@(t,q) diff(q)+q./2-5.*(2+sin(2.*t)), dom);
N.bc = @(t,q) q(0);
q = N\0;
plot(q, 'LineWidth', 2)
xlabel('t'), ylabel('q')
```

