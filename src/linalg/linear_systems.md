---
jupytext:
  cell_metadata_filter: -all
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: '0.12'
    jupytext_version: 1.5.0
kernelspec:
  display_name: Matlab
  language: matlab
  name: matlab
---

# Linear systems

When you first learned algebra, there was a lot of focus on solving equations. It's very likely that you started with linear equations, because these are the easiest ones. 

## One variable

It might feel silly, but let's review what it means to solve the linear equation

$$ax = b$$

for $x$.

1. If $a\neq 0$, there is a unique solution, $x=b/a$.
2. Otherwise,
   1. If also $b=0$, then every value of $x$ is a valid solution.
   2. Otherwise, there are no solutions.

To summarize, for nonzero $a$ there is exactly one solution, and otherwise, depending on $b$, there are either infinitely many or zero solutions. A linear system with no solutions is called {term}`inconsistent`, with the opposite being *consistent*.

Our goal is to understand equations that depend linearly on multiple variables. But before even writing out what that means, let me give away the punch line: *the only possibilities are exactly the same three outcomes described above*. The main difference is that the condition "$a=0$" is modified to something else.

## Two variables

Going one more baby step to two equations in two variables, we want to solve

\begin{align*}
ax + by &= f, \\
cx + dy &= g.
\end{align*}

There is some easy geometric intuition here. Each equation represents a straight line in the plane, and solving both equations simultaneously means finding an intersection of these lines. Our cases above translate directly into:

1. If the lines are not parallel, there is a unique solution.
2. Otherwise,
   1. If the lines are identical, there are infinitely many solutions.
   2. Otherwise, there are no solutions.

It's not hard to turn those statements into algebraic conditions. The slopes of the two lines are (ignoring infinities for a moment) $-a/b$ and $-c/d$, and we can say the slopes are equal if and only if $ad=bc$.

1. If $ad\neq bc$, there is a single solution.
2. Otherwise,
   1. If one line's equation is a multiple of the other, there are infinitely many solutions.
   2. Otherwise, there are no solutions.

````{proof:example}
If we look at the equations

\begin{align*}
x - 3y & = 1, \\
-2x + 6y & = 2,
\end{align*}

then we identify $(a,b,c,d)=(1,-3,-2,6)$, and $ad-bc=6-6=0$. So we know there is not a  unique solution (parallel lines). Dividing the second equation by $-2$ leads to the equivalent system

\begin{align*}
x - 3y & = 1, \\
x - 3y & = -1.
\end{align*}

It's now clear that there is no way to satisfy both equations simultaneously.
````

## General case 

Time to put on our big-kid pants. For $m$ equations in $ $ variables, we need to use subscripts rather than different letters for everything:

\begin{align*}
A_{11} x_1 + A_{12} x_2 + \cdots + A_{1n} x_n & = b_1 \\
A_{21} x_1 + A_{22} x_2 + \cdots + A_{2n} x_n & = b_2 \\
& \vdots \\
A_{m1} x_1 + A_{m2} x_2 + \cdots + A_{mn} x_n & = b_m.
\end{align*}

The first index on $A_{ij}$ is the equation number, and the second is the variable number. It now seems obvious that we want to collect these numbers into an $m\times n$ matrix $\bfA$. We can similarly identify the two vectors

$$
\bfx = \begin{bmatrix}
x_1 \\ x_2 \\ \vdots \\ x_n
\end{bmatrix}, \qquad
\bfb = \begin{bmatrix}
b_1 \\ b_2 \\ \vdots \\ b_m
\end{bmatrix}.
$$

Now $\bfA$ and $\bfb$ are the data of the linear system, and $\bfx$ is the solution.

## MATLAB

There is a syntax dedicated to solving linear systems. For example, here's the data for a $3\times 3$ linear system.

```{code-cell}
A = [ 1 -1 0; 2 2 -3; 4 0 1 ];
b = [ 3; -1; 1 ];
```

If the system has a unique solution, it is found using a backslash, `\`.

```{code-cell}
x = A \ b
```

In the other circumstances, the result is less clear.

```{code-cell}
A = [ 1 2 3; 4 5 6; 7 8 9 ];
x = A \ b
```

There's some foreshadowing here. The property "singular" in the warning message is the one that separates systems with unique solutions from the other kinds. When this happens, the solution from backslash isn't reliable; other techniques must be used.
