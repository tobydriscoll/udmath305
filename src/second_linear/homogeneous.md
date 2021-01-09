# Homogeneous solutions

We now look for solutions of the homogeneous equation

$$
x'' + b x' +  k x = 0,
$$

where $b$ and $k$ are constants. We will use $x_h$ to name the solution, as a reminder that the ODE is homogeneous.

All the solutions to first-order linear ODEs were exponential functions. The same is true for second-order linear problems, though with a significant caveat.

## Characteristic polynomial

The king of ODE solution methods is to guess the answer and then show that it works. In that tradition, we try

$$
x_h(t) = e^{\lambda t}
$$

for a to-be-determined value of $\lambda$. We substitute it into the ODE and get

\begin{align*}
0 &= \lambda^2 e^{\lambda t} + b \bigl(\lambda e^{\lambda t}\bigr) + k \bigl(e^{\lambda t}\bigr)\\ 
&= e^{\lambda t} \bigl(\lambda^2 + b \lambda + k \bigr).
\end{align*}

We therefore know that $x_h$ is a homogeneous solution provided that $\lambda^2 + b \lambda + k =0$.

````{proof:definition} Characteristic polynomial of a linear ODE
The {term}`characteristic polynomial` of the linear operator $\opA[x]=x''+bx'+kx$ is

$$
p(s) = s^2 + b s + k.
$$

Its roots are called the {term}`eigenvalues` of $\opA$.
````

:::{note}
We earlier used the terms *characteristic polynomial* and *eigenvalues* with matrices. The connections go way beyond the names, as we will see in the future.
:::

```{warning}
The term "eigenvalue" for a linear operator or homogeneous ODE is not common in textbooks, but it seems irresistable to me.
```

(theorem-secondlin-homogeneous-distinct)=

````{proof:theorem} Homogeneous solution, distinct eigenvalues
Let $\lambda_1,\lambda_2$ be the eigenvalues of $\opA$, where $\opA[x]=x''+bx'+kx.$ If  $\lambda_1\neq \lambda_2$, then the general solution of $\opA[x]= 0$ is

```{math}
:label: secondlin-homogeneous-distinct
x_h(t) = c_1 e^{\lambda_1 t} + c_2 e^{\lambda_2 t}.
```
````

We have to handle the case $\lambda_1=\lambda_2$ separately. (You might recall that a double eigenvalue was a hassle for matrices as well.) Without fuss, we jump to the result, which is easy to verify by substitution.

(theorem-secondlin-homogeneous-repeated)=

````{proof:theorem} Homogeneous solution, repeated eigenvalue
Let $\lambda$ be a double eigenvalue of $\opA$, where $\opA[x]=x''+bx'+kx.$ The general solution of $\opA[x]= 0$ is

```{math}
:label: secondlin-homogeneous-repeated
x_h(t) = e^{\lambda t} \bigl( c_1 t + c_2 \bigr).
```
````

::::{admonition,dropdown,tip} Example
> Find the general solution of $x''-x'-2x=0$.

The characteristic polynomial is $s^2-s-2$, which has roots $\lambda_1=-1$, $\lambda_2=2$. This gives the general solution $x_h(t)=c_1 e^{-t} + c_2 e^{2t}$.
::::

::::{admonition,dropdown,tip} Example
We could think of the trivial problem $x''=0$ as being linear with $b=k=0$. The characteristic polynomial is $s^2$, which make zero a double eigenvalue. So the general solution is

$$
x_h(t) = e^{0t} (c_1 t + c_2) = c_1 t + c_2,
$$

as we already know.
::::

::::{admonition,dropdown,tip} Example
> Solve the IVP $x'' - 5 x = 0$, $x(0)=6$, $x'(0)=0$.

The eigenvalues are the roots of $s^2-5$, hence $\lambda_1=\sqrt{5}$, $\lambda_2=-\sqrt{5}$. The general solution is

$$
x(t) = c_1 e^{\sqrt{5}\, t} + c_2 e^{-\sqrt{5}\, t}.
$$

The initial conditions lead to

\begin{align*}
6 &= x(0) = c_1 e^0 + c_2 e^0 = c_1 + c_2, \\ 
0 &= x'(0) = \sqrt{5} c_1 e^0 - \sqrt{5} c_2 e^0 = \sqrt{5}(c_1-c_2).
\end{align*}

It's easy to conclude from here that $c_1=c_2=3$. In general we might have to solve a $2\times 2$ linear algebraic system for the constants.
::::

## Complex eigenvalues

All seems well, until you remember that the roots of a real quadratic may come as a complex conjugate pair. What then are we to make of {eq}`secondlin-homogeneous-distinct` or {eq}`secondlin-homogeneous-repeated`? That's the next task.
