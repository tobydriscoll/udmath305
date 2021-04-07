---
jupytext:
  cell_metadata_filter: -all
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.12
    jupytext_version: 1.8.2
kernelspec:
  display_name: Matlab
  language: matlab
  name: matlab
---

```{code-cell}
---
tags: ["hide-cell"]
---
% nothing
```

# Direction fields

An autonomous system in two dimensions has the particular form 

\begin{align*}
	\dd{x_1}{t} & = f_1(x_1,x_2), \\
	\dd{x_2}{t} & = f_2(x_1,x_2). \\
\end{align*}

For such a system we can use a simple visualization to suggest solution behavior. For instance, here is a direction field for the linear ODE system

\begin{align*}
\dd{x}{t} & = -y,\\
\dd{y}{t} & = x.
\end{align*}

We will use a function [`slopefield.m`](slopefield.m) provided separately.

```{code-cell}
F = @(x,y) -y;   G = @(x,y) x;

slopefield(F,G,[-2 2],[-2 2])
```

Here is a slope field in the first quadrant for the nonlinear system

\begin{align*}
\dd{x}{t} & = 3x - \frac{1}{2} x y,\\
\dd{y}{t} & = \frac{1}{4} x y - y.
\end{align*}

```{code-cell}
F = @(x,y) 3.*x-x.*y/2;
G = @(x,y) -y + x.*y/4;

slopefield(F,G,[0 10],[0 12])
```

## Nonautonomous scalar problems

We can use a simple trick to create direction fields for the nonautonomous scalar problem 

$$
x'=f(t,x)
$$ 

as well. Introducing the variables $u_1=t$ and $u_2=x$, we have 

\begin{align*}
\dd{u_1}{t} & = 1, \\
\dd{u_2}{t} & = f(u_1,u_2),
\end{align*}

which has the form of a two-dimensional autonomous system. 

Here is a direction field for $x'=t-x^2$. Note that the arrows are horizontal along the sideways parabola $t=x^2$. 

```{code-cell}
f = @(t,x) t-x^2;
slopefield(f,[-2 2],[-2 2])
```

Direction fields are useful to get an overall sense of how a small system or scalar problem behaves.