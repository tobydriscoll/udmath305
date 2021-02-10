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

- If $a\neq 0$, there is a unique solution, $x=b/a$.
- Otherwise,
   - If also $b=0$, then every value of $x$ is a valid solution.
   - Otherwise, there are no solutions.

To summarize, for nonzero $a$ there is exactly one solution, and otherwise, depending on $b$, there are either infinitely many or zero solutions. A linear system with no solutions is called {term}`inconsistent`, with the opposite being *consistent*.

Our goal is to understand equations that depend linearly on multiple variables. But before even writing out what that means, let me give away the punch line: *the only possibilities are exactly the same three outcomes described above*. The main difference is that the condition "$a=0$" is modified to something else.

## Two variables

Going one more baby step to two equations in two variables, we want to solve

\begin{align*}
ax + by &= f, \\
cx + dy &= g.
\end{align*}

There is some easy geometric intuition here. Each equation represents a straight line in the plane, and solving both equations simultaneously means finding an intersection of these lines. Our cases above translate directly into:

- If the lines are not parallel, there is a unique solution.
- Otherwise,
   - If the lines are identical, there are infinitely many solutions.
   - Otherwise, there are no solutions.

It's not hard to turn those statements into algebraic conditions. The slopes of the two lines are (ignoring infinities for a moment) $-a/b$ and $-c/d$, and we can say the slopes are equal if and only if $ad=bc$.

- If $ad\neq bc$, there is a single solution.
- Otherwise,
   - If one equation is a multiple of the other, there are infinitely many solutions.
   - Otherwise, there are no solutions.

::::{admonition} Example
:class: tip
Find all solutions to the equations

\begin{align*}
x - 3y & = 1, \\
-2x + 6y & = 2.
\end{align*}

:::{dropdown} Solution

We identify $(a,b,c,d)=(1,-3,-2,6)$, and $ad-bc=6-6=0$. So we know there is not a unique solution (i.e., the lines are parallel). Dividing the second equation by $-2$ leads to the equivalent system

\begin{align*}
x - 3y & = 1, \\
x - 3y & = -1.
\end{align*}

It's now clear that there is no way to satisfy both equations simultaneously. The system is inconsistent.
:::
::::

## General case

Time to put on our big-kid pants. For $m$ equations in $ $ variables, we need to use subscripts rather than different letters for everything:

\begin{align*}
A_{11} x_1 + A_{12} x_2 + \cdots + A_{1n} x_n & = b_1 \\
A_{21} x_1 + A_{22} x_2 + \cdots + A_{2n} x_n & = b_2 \\
& \vdots \\
A_{m1} x_1 + A_{m2} x_2 + \cdots + A_{mn} x_n & = b_m.
\end{align*}

The first index on $A_{ij}$ is the equation number, and the second is the variable number. It now seems obvious that we want to collect these numbers into an $m\times n$ matrix $\bfA$, called the {term}`coefficient matrix` of the system. We can similarly identify the two vectors

$$
\bfx = \begin{bmatrix}
x_1 \\ x_2 \\ \vdots \\ x_n
\end{bmatrix}, \qquad
\bfb = \begin{bmatrix}
b_1 \\ b_2 \\ \vdots \\ b_m
\end{bmatrix}.
$$

Now $\bfA$ and $\bfb$ are the data of the linear system, and $\bfx$ is the solution.

::::{admonition} Example
:class: tip
Sometimes zeros are needed as placeholders in the coefficient matrix. In the linear system

\begin{align*}
  x_1 - x_2 + 3 x_3 &= 4,\\
  2x_2 + 5x_4 &= -1,
\end{align*}

the coefficient matrix is $2\times 4$, 

$$
\bfA =
\begin{bmatrix}
1 & -1 & 3 & 0 \\ 0 & 2 & 0 & 5
\end{bmatrix},
$$

and the right-side vector is $\twovec{4}{-1}$.
::::

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

<div style="max-width:608px"><div style="position:relative;padding-bottom:66.118421052632%"><iframe id="kaltura_player" src="https://cdnapisec.kaltura.com/p/2358381/sp/235838100/embedIframeJs/uiconf_id/43030021/partner_id/2358381?iframeembed=true&playerId=kaltura_player&entry_id=1_of4m6ftk&flashvars[streamerType]=auto&amp;flashvars[localizationCode]=en&amp;flashvars[leadWithHTML5]=true&amp;flashvars[sideBarContainer.plugin]=true&amp;flashvars[sideBarContainer.position]=left&amp;flashvars[sideBarContainer.clickToClose]=true&amp;flashvars[chapters.plugin]=true&amp;flashvars[chapters.layout]=vertical&amp;flashvars[chapters.thumbnailRotator]=false&amp;flashvars[streamSelector.plugin]=true&amp;flashvars[EmbedPlayer.SpinnerTarget]=videoHolder&amp;flashvars[dualScreen.plugin]=true&amp;flashvars[Kaltura.addCrossoriginToIframe]=true&amp;&wid=1_4lkn0joh" width="608" height="402" allowfullscreen webkitallowfullscreen mozAllowFullScreen allow="autoplay *; fullscreen *; encrypted-media *" sandbox="allow-forms allow-same-origin allow-scripts allow-top-navigation allow-pointer-lock allow-popups allow-modals allow-orientation-lock allow-popups-to-escape-sandbox allow-presentation allow-top-navigation-by-user-activation" frameborder="0" title="Kaltura Player" style="position:absolute;top:0;left:0;width:100%;height:100%"></iframe></div></div>
