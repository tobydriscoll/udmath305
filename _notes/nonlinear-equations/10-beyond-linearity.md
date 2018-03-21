---
layout: note
title: "Beyond linearity"
chapter: "Nonlinear equations"
---
* TOC
{:toc}

*Growing weary of the tired predictability of Linearity Land, we sail off in search of new adventures in exotic countries.*

Don't it always seem to go that you don't know what you've got til it's gone?  Remember the benefits linearity has given us.

* Existence of solutions, wherever the coefficient functions are continuous.
* Uniqueness of solution to a properly posed IVP.
* Superposition of solutions.
* Fundamental sets of solutions.
* Complementary/particular solutions.
* Computable exponential solutions. 
* Solution by transforms. 

**All of these properties now go away.**

For example, consider the nonlinear problem $y'=y^2$. You can easily check that $y_1=1/(1-t)$ is a solution. (Note that it is certainly not in the form of an exponential function.) So is $y_2=1/(2-t)$. But $2y_1$ is not. Neither is $y_1+y_2$. Buh-bye, superposition.

![Not a solution]({{site.baseurl}}/assets/images/not-a-solution.jpg)
{:.meme}


## Existence and uniqueness

*(See parts of section 2.4.)*

Let's stay with $y'=y^2$. It's simple to verify that $y=1/(C-t)$ is a solution for any constant $C$. This value of $C$ can be used to match an initial condition $y(0)=y_0$, leading to

$$
y = \frac{y_0}{1 - y_0t}.
$$

But this solution is undefined at $t=1/y_0$. That is, we lose the *existence* of this solution, even though there is no lack of continuity in the ODE itself. 

Here's another instructive case. Suppose $y'=2\sqrt{y}$, and $y(0)=0$. It's clear that $y=t^2$ is a solution for all $t\ge 0$. But so is the zero function, $y\equiv 0$. For that matter, so is $y=u_c(t)(t-c)^2$ for any $c>0$. These solutions lack *uniqueness*. 

We can sometimes say something about these issues in a nonlinear problem.

**Theorem** *(Theorem 2.4.2)* Suppose $f(t,y)$ is a function such that $f$ and $\partial f/\partial y$ are continuous in a rectangle $t\in(a,b)$, $y\in(c,d)$, and that $(t_0,y_0)$ is a point in the rectangle. Then on some interval $(t_0-h,t_0+h)$ inside $(a,b)$, there is a unique solution to the IVP $y'=f(t,y)$, $y(t_0)=y_0$. 

---

Let's look back at our case studies. In the case $f(t,y)=y^2$, $\partial f/\partial y = 2y$ is continuous in any rectangle we want to draw. But existence is guaranteed only for an unknown length of time from $t_0$. In fact, we saw above that the solution disappears a finite time later.

In the other case of $f(t,y)=\sqrt{y}$, we cannot get continuity of $\partial f/\partial y$ for any rectangle containing $y_0=0$. That's why we're able to find multiple solutions as close as we like to $t_0=0$. 

The theorem does not say that $f$ *must* meet these conditions in order to get a unique solution. A problem could fail the test of the theorem, and have a unique solution all day long. We just can't tell, at least not using this theorem. 

## Implicit representation

We were spoiled in Linearity Land. All the problems had solutions we could find in the form $y=g(t)$: plug in $t$, get a value for $y$. 

In the larger world, we may have to be satisfied with a solution in *implicit* form $F(t,y)=0$. 

### Example

> Find solutions of $2t+y^2+2tyy'=0$.

It happens that the function $G(t,y)=t^2+ty^2$ satisfies $G_t=2t+y^2$ and $G_y=2ty$. Therefore, 

$$ \frac{\partial G}{\partial t} + \frac{\partial G}{\partial y} \frac{dy}{dt} = 0 .$$

But by the multivariate chain rule, the left side is the total derivative of $G$ with respect to $t$, when $y$ is a function of $t$. Hence

$$ \frac{d}{dt}( t^2 + ty^2) = 0,$$

and we conclude that $t^2+ty^2=C$ for any constant $C$.

~~~matlab
F = @(t,y) t.^2+t.*y.^2;
fcontour(F,[-5 5 -5 5],'levellist',-100:4:100,'linewidth',2)
~~~

## Alternatives to solutions

We often (usually, in fact) have to give up the idea of knowing everything about the solution from a straightforward formula for it. Instead, we have to employ other means:

* Numerical simulation
* Qualitative theory
* Analytic approximation, and "near-linearity"
    
