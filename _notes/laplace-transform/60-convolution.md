---
layout: note
title: "Convolution"
chapter: "Laplace transform"
---
* TOC
{:toc}

*(See section 5.8.)*

## Moving average

The following grabs and plots the closing price of Bitcoin for the
last 31 days.

```matlab
bc = webread('https://api.coindesk.com/v1/bpi/historical/close.json');
data = jsondecode(bc);
v = struct2cell(data.bpi);
v = cat(1,v{:});
plot(v,'-o')
```

It's a noisy curve. We can smooth that out by taking 4-day moving averages, for example. I don't claim that this is the best way, but we can do this by:

```matlab
clf, plot(v,'-ko')
for i = 4:31
    z(i) = (v(i) + v(i-1) + v(i-2) + v(i-3)) / 4;
end
z(1:3) = NaN;  % not a number
hold on, plot(z,'-o')
```

We might decide, however, to weight the most recent values more heavily. Here's how this might look.

```matlab
clf, plot(v,'-ko')
w = [4 3 2 1];
for i = 4:31
    z(i) = (w(1)*v(i) + w(2)*v(i-1) + w(3)*v(i-2) + w(4)*v(i-3)) / sum(w);
end
z(1:3) = NaN;  % not a number
hold on, plot(z,'-o')
```

Note that each new value $z_i$ is a linear combination of the elements of $v$, weighted by the values in $w$. And we always go forward $1,2,3,4$ in $w$, while on $v$ we have a sliding group going backward: $i,i-1,i-2,i-3$. Put concisely, the indices add up to the constant value $i+1$. 

## Convolution integral

With that in mind, let's consider the definition of the *convolution integral*{:.def}. Given two functions on $[0,\infty)$, the convolution is a third function, written $f*g$, with

$$ [f*g](t) = \int_0^t f(t-\tau)g(\tau)\, d\tau. $$

Ignore the integation limits for a moment and focus on the integrand. The term $g(\tau)$ is like the vector $w$ above, always being accessed like $1,2,3,4$. The term $f(t-\tau)$ is like a sliding access to $f$, going backward, such that the "indices" add to $t$, which varies to give us a new function. So you can view this convolution as a moving weighted average of the values of $f$, as weighted by $g$. It is, in fact, a smoothing operation.

## Properties

*(See Theorem 5.8.2.)*

While we interpreted $f*g$ as $g$ acting on $f$, in fact the operation is symmetric:

$$[g*f](t) = \int_0^t f(t-\tau)g(\tau)\, d\tau = \int_t^0 f(u)g(t-u)\, (-du) = \int_0^t g(t-u)f(u)\, du = [f*g](t).$$

We can also easily prove some properties we really like to have, such as $f * ( g * h )=( f * g) * h$, $f * (g+h)=(f * g)+(f*h)$, and $f * 0=0$.

It is *not* true, however, that $f*1=f$, unless $f$ is the zero function. Instead, the right formula is

$$[f*\delta](t) = \displaystyle\int_0^t f(t-\tau) \delta(\tau)\, d\tau = f(t).$$ 

A big part of convolution's appeal is the way it interacts with transforms. This is the *convolution theorem*{:.def}.

**Theorem** *(Theorem 5.8.3)* Suppose ${\cal L}[f] = F(s)$, ${\cal L}[g] = G(s)$, $h=f*g$, and ${\cal L}[h] = H(s)$. Then $H(s)=F(s)G(s)$.

I.e., convolution in time is multiplication in transform space. Since ${\cal L}[\delta]=1$, for example, this confirms that $f*\delta=f$. 

## The last word on the 2nd-order, linear, constant-coefficient problem

![Sick of this ODE]({{site.baseurl}}/assets/images/sick-ode.jpg)
{:.meme}

Once more, with feeling! Say $ay'' + by' + c = g(t)$, $y(0)=y_0$, $y'(0)=y_1$. This has everything. We want to solve the *input-output problem*{:.def}: given inputs $a,b,c,g,y_0,y_1$, what is the result?

In transform space,

$$(as^2 +bs + c)Y(s) = G(s) + (as+b)y_0 + ay_1.$$

The function $H(s)=1/(as^2 + bs+c)$ is known as the *transfer function*{:.def}, as it plays a key role in transferring inputs to outputs. Now we can write

$$Y(s) = H(s)[(as+b)y_0 + ay_1] + H(s)G(s).$$

The first term on the right is the *free response*{:.def}, depending only on initial state and no forcing. By contrast, the *forced response*{:.def} is $h * g$.

Of particular interest is when $G(s)=1$, i.e. $g(t)=\delta(t)$, because then the forced response is $h(t)$, called the *impulse response*{:.def}. In theory, measuring the impulse response gives you everything you need to solve the completely general IVP! 

### Example

*Given $y'' + 3y' + 2y = g(t)$, find the transfer function and impulse response. Then find the forced response for $g(t)=\cos(t)$.*

The transfer function pops right out: $H(s)=1/(s^2+3s+2) = 1/(s+1) - 1/(s+2)$. So the impulse response is $h(t) = e^{-t} - e^{-2t}$. For the forced response, we could try to evaluate the convolution integral, but usually it's easier to proceed through the transform.

$Y(s) = H(s)\frac{s}{s^2+1}$, with residues $(2/5,-1/2,(1-3i)/20,(1+3i)/20)$ at $(-2,-1,i,-i)$. So

$$y(t) = \frac{2}{5}e^{-2t} - \frac{1}{2} e^{-t} + \frac{e^t}{10} \text{Re}[(1-3i)e^{it}]
=  \frac{2}{5}e^{-2t} - \frac{1}{2} e^{-t} + \frac{e^t}{10} (\cos(t) + 3\sin(t)).$$

## By the way...

Why is the function that multiplies polynomials together called `conv`? 
