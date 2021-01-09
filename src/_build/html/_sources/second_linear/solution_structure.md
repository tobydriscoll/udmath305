# Structure of solutions

````{proof:definition} Second-order ODE
A {term}`second-order ODE` is an equation of the form

$$
x'' = F(t,x,x'),
$$

to be solved for $x(t)$.
````

:::{note}
Technically, this is not the most general form possible, since an equation in the implicit form $F(t,x,x',x'')=0$ might be impossible to manipulate into an explicit expression for $x''$. We won't be considering such equations.
:::

As with first-order problems, we can learn a little from the trivial case $x''=0$. This ODE implies that $x'$ is constant, so $x(t)=c_1 t + c_2$ for arbitrary constants $c_1,c_2$. While a generalization of this observation is far from obvious at this point, it is nonetheless true.

:::{note}
The general solution of second-order ODE has two integration constants.
:::

As a consequence, we note that two initial conditions are now needed to specify the integration constants to get a unique solution.

````{proof:definition} Second-order IVP
A {term}`second-order IVP` (initial-value problem) is

```{math}
x'' = F(t,x,x'), \quad x(a) = x_0,\, x'(a) = v_0.
```
````

## Linear problems

We will focus on the linear problem

```{math}
:label: secondlin-linear-cc
x'' + bx' + k x = f(t),
```

in which the coefficients $b$ and $k$ are constant, and $f(t)$ is a forcing function.

:::{note}
In {eq}`secondlin-linear-cc` the coefficient $b$ has units $1/T$, the coefficient $k$ has units $1/T^2$, and $f(t)$ has units $X/T^2$, where $X$ and $T$ are the units of $x$ and $t$, respectively.
:::

Equation {eq}`secondlin-linear-cc` is in the form of $\opA[x]=f$ for the linear operator

```{math}
\opA[x] = \ddd{x}{t} + b \dd{x}{t} + k x.
```

We now get some payoff for using the abstract language of operators with first-order problems, because the connections between general solutions and homogeneous solutions is *exactly the same* as before. In particular, we still have a [theorem](theorem-firstlin-general) and an [algorithm](algorithm-firstlin-solve) that provide a blueprint for the solution:

1. Find the general solution $x_h$ of the associated homogeneous problem $\opA[x]=0$.
2. Find any particular solution $x_p$ of the original $\opA[x]=f$.
3. Add them.
4. If given, use initial conditions to solve for the integration constants.

We will deal with the homogeneous and particular parts in turn. Each is a direct extension of what we did for first-order problems, but there are some hurdles we must clear to make that transparent.
