# Autonomous scalar problems

Our general form for a first-order scalar ODE is $x'=f(t,x)$. In the special case where $f$ does not depend explicitly on time, i.e., when 

$$
x'=f(x),
$$ 

we say the equation is {term}`autonomous`. These equations are the simplest place to start. 

:::{index} steady state
:::
:::{index} equilibrium
:::
Even before attempting a full solution of the problem, we can see that a value $x_*$ that satisfies $f(x_*)=0$ is special: the constant function $x(t)\equiv x_*$ is a solution. Such a value is called a {term}`steady state`,  {term}`equilibrium solution`, or {term}`fixed point`. One of the most important characteristics of each steady state is its **stability**, as we first encountered in the phase plane. Here we use some definitions to formalize the idea a bit more.

<!-- Imagine holding a broom with bristles pointed down using two fingers. This is ideally a pendulum with a steady state of the broom pointing straight down. You will have no difficulty holding the broom in approximately that position as long as you want.

Now imagine trying to hold the broom using the same two fingers, but with the bristles pointing upward. This is an *inverted pendulum*, and ideally there is a steady state with the broom pointing straight up. Yet you will find it difficult to hold the broom in that position for more than a few seconds.

:::{index} stability
:::
The distinction between these steady states is the property of {term}`stability`. It's impossible to place the broom in *exactly* the equilibrium position with no motion whatsoever of your hand. In the real world, a steady state is constantly undergoing small perturbations. If the effects of those perturbations die out with time, the steady state is stable, but if they grow, it is unstable. -->

We will use a shorthand to help pin down these properties. Let $x(t,X)$ be the solution of the initial-value problem

$$
\frac{d x}{d t}=f(x), \quad x(0)=X.
$$

::::{proof:definition} Asymptotic stability
The steady state $x_*$ is said to be {term}`asymptotically stable` if there is a positive number $\delta$ such that 

$$
\lim_{t\to\infty} x(t,X) = x_*
$$

whenever $|X-x_*|< \delta$. 
::::

In words, asymptotic stability means that if you start close enough to $x_*$, then you end up there as $t \to \infty$. There is a weaker form of the property that is a bit more difficult to parse.

::::{proof:definition} Stability
The steady state $x_*$ is said to be {term}`stable` if, for any $\epsilon>0$, you can ensure that $|x(t,X)-x_*|<\epsilon$ for all time whenever $|X-x_*|<\delta$, where $\delta$ depends on $\epsilon$. 
::::

Stability means that you can stay as close as you like to $x_*$ by starting off close enough to it. Any point that is asymptotically stable is stable by this definition as well. We will call this **weak stability** to highlight the contrast with asymptotic stability. Finally, a steady state that is not at least weakly stable is called **unstable**.

:::{index} phase line diagram
:::
One tool for discriminating between stable and unstable equilibria is a {term}`phase line diagram`. 

::::{admonition} Example
:class: tip

Consider the ODE $x'=x-x^3$. We will start by graphing $f(x)=x-x^3$.

![PL diagram 1](pldiag1.svg)

The equilibrium solutions occur at the crossings of the $x$-axis in the plot, where $dx/dt=0$. 

![PL diagram 2](pldiag2.svg)

Now we highlight those parts of the plot where the graph is above the $x$-axis, i.e., where $dx/dt > 0$. 

![PL diagram 3](pldiag3.svg)

Imagine that the solution is represented by a point $x(t)$ sliding along the $x$-axis. Under the highlighted regions, this point has to be sliding rightward, because $x'>0$ there.

![PL diagram 4](pldiag4.svg)

Similarly, on the remaining segments of the $x$-axis, the solution must be sliding leftward. 

![PL diagram 5](pldiag5.svg)

Graphically it is now clear that the steady states at $x=\pm 1$ are stable, while the one at $x=0$ is unstable.
::::


An analytical test for stability is:

- If $f'(x_*)<0$, then $x_*$ is asymptotically stable.
- If $f'(x_*)>0$, then $x_*$ is unstable.

As you might surmise, the case $f'(x_*)=0$ is ambiguous, and a phase line or other analysis is needed to reveal the stability.