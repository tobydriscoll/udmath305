# Overview

Up to this point, we have dealt only with ODEs that have a scalar dependent variable. These are important to understand thoroughly, but in applications it is rare to have just one unknown. In this chapter we take our first steps to vector-valued ODEs in the form

:::{math}
\frac{d \bfx}{dt} = \bff(t,\bfx), 
:::

where $\bfx$ is $n$-dimensional. An equivalent point of view and terminology is a coupled system of scalar ODEs,

:::{math}
\begin{split}
\frac{dx_1}{dt} &= f_1(t,x_1,\ldots,x_n),\\
& \vdots \\
\frac{dx_n}{dt} &= f_n(t,x_1,\ldots,x_n).
\end{split}
:::

::::{admonition} Example
:class: tip
A famous system of three ODEs is the **Lorenz system**,

:::{math}
\begin{split}
\dot{x} & = \sigma(y-x), \\
\dot{y} & = \rho x - y - x z, \\
\dot{z} & = -\beta z + x y,
\end{split}
:::

where the dots indicate time derivatives and $\sigma$, $\rho$, and $\beta$ are constant parameters. Conversion to the system notation follows from the definitions $x_1=x$, $x_2=y$, and $x_3=z$, though of course the ordering is arbitrary.
::::

We will be limited for now to linear problems,

:::{math}
\frac{d \bfx}{dt} = \bfA(t) \bfx + \bff(t),
:::

and open the discussion on nonlinear problems in the next chapter.

(example-fs-twotanks)=
::::{admonition} Example
:class: tip

Consider two connected tanks holding brine. Tank 1 holds 100 L, has an input of 4 L/hr of brine of concentration 3 kg/L, and an output of 6 L/hr. Tank 2 holds 200 L, has an input of 7 L/hr of brine of concentration 5 kg/L, and an output of 5 L/hr. Tank 1 pumps 1 L/hr into tank 2, and tank 2 pumps 3 L/hr into tank 1. 

Let $x_i(t)$ be the mass of salt in tank $i$. The statements above imply 

\begin{align*}
\dd{x_1}{t} & = 4\cdot 3 - 6\cdot \frac{x_1}{100} - 1\cdot \frac{x_1}{100} + 3 \cdot \frac{x_2}{200}  \\
\dd{x_2}{t} & = 7\cdot 5 - 5\cdot \frac{x_2}{200} - 3\cdot \frac{x_2}{200} +  1\cdot \frac{x_1}{100}\\
\end{align*}.

This is neatly expressed using linear algebra: 

:::{math}
\dd{}{t} \twovec{x_1}{x_2} = \frac{1}{200}\twomat{-14}{3}{2}{-8} \twovec{x_1}{x_2} + \twovec{12}{35}.
:::
::::

## Important terms

:::{glossary}

asymptotically stable
  Equilibrium to which small enough perturbations always return as $t\to\infty$.

center
  Equilibrium for which the coefficient matrix has pure imaginary eigenvalues.

coefficient matrix
  Matrix multiplying the dependent variable in a linear ODE system.

constant-coefficient
  Linear ODE system in which the coefficient matrix does not depend on the independent variable.

equilibrium solution
  Constant (time-invariant) solution of an ODE.

forcing function
  Nonhomogeneous term in a linear ODE system.

fundamental matrix
  Square time-dependent matrix whose columns form a basis for the homogeneous solutions of a linear ODE.

initial condition
  Prescribed value of the ODE solution at a particular time.

linear ODE system
  ODE for a vector-valued function that is linear in the dependent variable.

node
  Equilibrium for which the coefficient matrix has real eigenvalues of the same sign.

phase plane
  Graphical depiction of the solutions of a 2D system as trajectories parameterized by time.

saddle
  Equilibrium for which the coefficient matrix has real eigenvalues of opposite sign.

spiral
  Equilibrium for which the coefficient matrix has complex conjugate eigenvalues with nonzero real parts.

stable
  Equilibrium from which perturbations do not grow.

unstable
  Equilibrium from which perturbations diverge.
:::