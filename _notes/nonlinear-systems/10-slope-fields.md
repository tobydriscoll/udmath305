---
layout: note
title: "Slope fields"
chapter: "Nonlinear systems"
---
* TOC
{:toc}

*Now that we have mastered Linearity Land, we once more feel the pull of the wider world. Determined to remain true to our heritage, we set off....*

We are mainly going to be concerned with autonomous problems. This turns out not to be any real limitation. Suppose that $\mathbf{x}' = \mathbf{f}(t,\mathbf{x})$ and $\mathbf{x} $ has $n$ components. We can add another one by defining $x_{n+1}=t$, leading to the ODE $x_{n+1}'=1$. Now the system can be rewritten autonomously as $\mathbf{x}' = \mathbf{g}(\mathbf{x})$ in $n+1$ dimensions.

Thus henceforth, we assume $\mathbf{x}' = \mathbf{f}(\mathbf{x})$ is our equation.

## Fixed points

If $\mathbf{z}$ exists such that $ \mathbf{f}( \mathbf{z} )= \boldsymbol{0}$, then $ \mathbf{x}(t)\equiv \mathbf{z}$ is a constant solution. We call $ \mathbf{z}$ a *fixed point* or *equilibruim solution*.

## Slope fields

In scalar problems $y'=f(t,y)$ we used slope fields as a way to visualize solution behavior. In the $(t,y)$ plane, $f(t,y)$ gives the slope $dy/dt$ of the solution.

We can pull off a similar trick in the case of a 2-dimensional autonomous problem, which we will write in the form

$$\begin{align}
\frac{dx}{dt} &= f(x,y), \\
\frac{dy}{dt} &= g(x,y).
\end{align}$$

Then the chain rule tells us that

$$ \frac{dy}{dx} = \frac{dy/dt}{dx/dt} = \frac{g(x,y)}{f(x,y)}. $$

Defining $F(x,y) = g(x,y)/f(x,y)$, we see that values of $F$ give the slope of the solution in the $(x,y)$ phase plane. We can repurpose `slopefield` from earlier in the course.

### Example

> Draw fixed points and a slope field in the first quadrant for
> $$ \begin{align}  \frac{dx}{dt} &= 3x-xy/2, \\ \frac{dy}{dt} &= -y+xy/4. \end{align}$$

Setting $f=0$ implies $0=3x-xy/2=x(3-y/2)$, so $x=0$ or $y=6$. Setting $g=0$ implies $0=-y+xy/4=y(-1+x/4)$, so $y=0$ or $x=4$. This means that we satisfy both if and only if $(x,y)=(0,0)$ or $(4,6)$, so these are the fixed points.

~~~matlab
f = @(x,y) 3.*x-x.*y/2;
g = @(x,y) -y + x.*y/4;

slopefieldxy(f,g,[0 10],[0 12])
hold on
plot(0,0,'r*')
plot(4,6,'r*')
~~~

