# Solutions to 2nd-order ODEs

For first-order ODEs we [introduced](../steps/laplace.md) the Laplace transform, which converts a function of time $t\ge 0$ to a function of an abstract $s$. There's no need for us to repeat [its definition](definition-steps-laplace) here, as we are more interested in applying its properties than deriving them.

First, we generalize the [derivative property](formula-steps-laplace-diff) to the second derivative (by applying the original formula twice).

(formula-laplace-diff)=

````{proof:formula} Transforms of derivatives
\begin{align*}
\lx[x'(t)] &= s X(s) - x(0),\\ 
\lx[x''(t)] &= s^2X(s) - sx(0) - x'(0).
\end{align*}
````

We collect the transforms in our [earlier table](table-steps-LT) and add a few new ones in the following table.

```{list-table} Laplace transforms (complete)
:header-rows: 1
:name: table-laplace-transforms

* - Function
  - Transform
* - $x(t)$, $f(t)$
  - $X(s)$, $F(s)$
* - $x'(t)$
  - $sX(s)-x(0)$
* - $x''(t)$
  - $s^2X(s)-sx(0)-x'(0)$
* - 1
  - $\dfrac{1}{s}$
* - $e^{at}$
  - $\dfrac{1}{s-a}$
* - $e^{at} f(t)$
  - $F(s-a)$
* - $\cos(\omega t)$
  - $\dfrac{s}{s^2+\omega^2}$
* - $\sin(\omega t)$
  - $\dfrac{\omega}{s^2+\omega^2}$
* - $t^n, \quad n=1,2,3,\dots$
  - $\dfrac{n!}{s^{n+1}}$
* - $t^n f(t), \quad n=1,2,3,\dots$
  - $(-1)^n F^{(n)}(s)$
* - $H(t-T)$
  - $\dfrac{e^{-sT}}{s}$
* - $H(t-T)f(t-T)$
  - $e^{-sT}F(s)$ (shift theorem)
* - $\delta(t-T)$
  - $e^{-sT}$
```

Note that complex numbers are allowed for the exponentials. Thus, for example,

$$
\lx[ e^{i\omega t}] = \frac{1}{s - i}.
$$

Also, by Euler's formula and linearity,

$$
\lx[ e^{i\omega t}] = \lx[\cos(t)] + i \lx[\sin(t)] = \frac{s}{s^2 + 1 } + \frac{i}{s^2 + 1 }.
$$

Of course, they agree:

$$
\frac{s}{s^2 + 1 } + \frac{i}{s^2 + 1 } = \frac{s+i}{(s+i)(s-i) } = \frac{1}{s-i}.
$$

## Solving 2nd-order ODEs

Here is an example to get us started.

::::{admonition,dropdown,tip} Example
> Find a particular solution of $x''-x=e^{-4 t}$.

Transforming both sides of the ODE leads directly to

$$
s^2X(s) - s x(0) - x'(0) - X(s) = \frac{1}{s+4},
$$

so that

$$
X(s) = x'(0)\frac{1}{(s^2-1)} + x(0)\frac{s}{(s^2-1)} + \frac{1}{(s^2-1)(s+4)}.
$$

Since the goal is to find any particular solution, we are clearly happiest choosing one with $x(0)=x'(0)=0$. Then

$$
X_p(s) = \frac{1}{(s-1)(s+1)(s+4)}.
$$

The method of partial fractions says that we can express this as

$$
\frac{1}{(s-1)(s+1)(s+4)} = \frac{A}{s-1} + \frac{B}{s+1} + \frac{C}{s+4}
$$

for constants $A$, $B$, $C$. The easiest way to find them is to clear the denominators, yielding

$$
1 = A(s+1)(s+4) + B(s-1)(s+4) + C(s-1)(s+1).
$$

The hard way to proceed is to multiply out the left side, then equate coefficients of like powers of $s$. The easy way is to drop in $1$, $-1$, and $4$ for $s$:

\begin{align*}
1 &= A(2)(5) + B(0)(5) + C(0)(2) = 10A, \\ 
1 &= A(0)(3) + B(-2)(3) + C(-2)(0) = -6B, \\ 
1 &= A(-3)(0) + B(-5)(0) + C(-5)(-3) = 15C.
\end{align*}

We put this all together and find

$$
X_p(s) = \frac{1/10}{s-1} + \frac{-1/6}{s+1} + \frac{1/15}{s+4}.
$$

Each of these terms is easy to invert, giving an exponential in each case:

$$
x_p(t) = \frac{1}{10}e^t - \frac{1}{6} e^{-t} + \frac{1}{15}e^{-4t}.
$$
::::

Let's pause for a moment. If we apply the method of undetermined coefficients to $x''-x=e^{-4 t}$, we get $x_p(t)=e^{-4t}/15$. The solution in the example was

$$
x_p(t) = \frac{1}{10}e^t - \frac{1}{6} e^{-t} + \frac{1}{15}e^{-4t}.
$$

Which is right? Both of them. Each method gives a particular solution, but they don't give the *same* particular solution. Notice that the homogeneous solution is

$$
x_h(t) = c_1 e^t + c_2 e^{-t},
$$

and the two methods get different values for $c_1$ and $c_2$. Frankly, the MUC is a lot simpler for this problem.

## Poles

The basic transform $\lx[e^{at}] = 1/(s-a)$, including for complex values of $a$, leads us to look for roots of the denominator in a transform.

```{proof:definition} Pole of a transform
If

$$
X(s) = \frac{F(s)}{(s-z)^k}
$$

for some positive integer $k$, complex number $z$ such that $F(z)\neq 0$, then $z$ is a {term}`pole` of order $k$ of $X$.
```

In the general case we get

```{math}
[s^2X(s) - sx(0)-x'(0)] + b[sX(s)-x(0)] + cX(s) = F(s).
```

If we choose to find a particular solution with zero initial conditions, then

```{math}
X_p(s) = \frac{F(s)}{s^2+bs+c}.
```

The eigenvalues of the ODE are therefore poles of $X_p$, and the forcing function contributes one or more of its own poles.

::::{admonition,dropdown,tip} Example
> Find a particular solution of $x''+9x = 15\sin(2t)$.

Taking the transform and solving for $X$ gives

$$
X_p(s) = \frac{30}{(s^2+4)(s^2+9)}.
$$

This has conjugate poles at $\pm 2i$ and $\pm 3i$. We can do the partial fraction decomposition two ways. If we allow complex poles, then we have

$$
\frac{30}{s^2(s^2+9)}= \frac{A+iB}{s+2i} + \frac{A-iB}{s-2i} + \frac{C+iD}{s+3i} + \frac{{C-iD}}{s-3i}.
$$

If we want to keep everything real, it's

$$
\frac{30}{s^2(s^2+9)} = \frac{As+B}{s^2+4} + \frac{Cs+D}{s^2+9}.
$$

Taking the second approach, we clear denominators to get

$$
30 = (As+B)(s^2+9) + (Cs+D)(s^2+4) = (9B+4D) + (9A+4C)s + (B+D)s^2 + (A+C)s^3.
$$

Equating like powers leads to $A+C=B+D=9A+4C=0$ and $9B+4D=30$. These imply $A=C=0$, $B=6$, $D=-6$. Hence

$$
X_p(s) = \frac{3\cdot 2}{s^2+4} + \frac{-2\cdot 3}{s^2+9}.
$$

Inverting the transform gives

$$
x_p(t) = 3\sin(2t) - 2\sin(3t).
$$
::::

In the previous example, we had

$$
\frac{30}{s^2(s^2+9)} = \frac{As+B}{s^2+4} + \frac{Cs+D}{s^2+9}.
$$

The first term on the right side leads to a combination of $\cos(2t)$ and $\sin(2t)$, while the second leads to a combination of $\cos(3t)$ and $\sin(3t)$. Since $\cos(3t)$ and $\sin(3t)$ form a basis of the homogeneous solution, we can leave them out of the inverse transform and still get a particular solution, $3\sin(2t)$. We still have to keep the second term around in order to set up correct equations for $A,B,C,D$; we just don't need to solve for $C$ and $D$ or include their corresponding terms in $x_p$. This can save a lot of algebra, though it basically returns us to the method of undetermined coefficients.


<!-- ::::{admonition,dropdown,tip} Example
> Find a particular solution of $x''+2x'+10x=1$.

Solving for the transform of the solution gives

$$
X_p(s) = \frac{1}{s(s^2+2s+10)}.
$$

An appropriate PFD in real form is

$$
\frac{1}{s(s^2+2s+10)} = \frac{A}{s} + \frac{Bs+C}{s^2+2s+10}.
$$

However, the second term above results from the eigenvalues of the ODE, and its contributions to the particular solution can be ignored. Thus we only need to solve for $A$.

Clearing denominators gives

$$
1 = A(s^2+2s+10) + (Bs+C)s.
$$

We choose $s=0$ and get $A=1/10$. Hence a particular solution is

$$
x_p(t) = \frac{1}{10}.
$$

Of course, this would have been obvious from the method of undetermined coefficients.  -->

<!-- ## Complex poles 

When complex poles occur in $X_p$, we again have two choices. One is to use complex exponentials in the partial fraction decomposition. The other is to appeal to the transform pair

$$
e^{at} f(t) \Longleftrightarrow F(s-a).
$$

::::{admonition,dropdown,tip} Example
> Find a particular solution of $x''-4x=24e^{-t}\cos(2t)$.

The forcing function is $e^{-t}f(t)$, where $f(t)=24\cos(2t)$. Hence its transform is $F(s+1)$, where $F(s)=24s/(s^2+4)$. The result is

$$
\frac{24(s+1)}{(s+1)^2+4}.
$$

Solving for the transform of the particular solution with zero initial conditions gives

$$
X_p(s) = \frac{24(s+1)}{[(s+1)^2+4](s^2-4)}.
$$

In real form, the correct PFD is

$$
\frac{24(s+1)}{[(s+1)^2+4](s^2-4)} = \frac{As+B}{(s+1)^2+4} + \frac{C}{s-2} + \frac{D}{s+2}.
$$

Clearing the denominators gives

$$
24(s+1) = (As+B)(s^2-4) + C[(s+1)^2+4](s+2) + C[(s+1)^2+4](s-2).
$$

Before proceeding, we look for a shortcut. The terms with poles at $\pm 2$ come from the eigenvalues of the ODE and will contribute exponentials that are part of the homogeneous solution. So we don't need to find the constants $C$ and $D$, though this changes the particular solution we will find.

We insert each of the poles at $-1\pm 2i$ to get equations for $A$ and $B$ only:

\begin{align*}
24(-1+2i+1) &= [A(-1+2i)+B][(-1+2i)^2-4], \\
24(-1-2i+1) &= [A(-1-2i)+B][(-1-2i)^2-4].
\end{align*}

The first gives

$$
-48i = (B-A+2iA)(1-4i-4-4) = (B-A+2iA)(-7-4i) = (7A-7B+8A) + i(-14A+4A-4B)


This has poles at zero and $1\pm 3i$. So an appropriate PFD is

$$
\frac{1}{s(s^2+2s+10)} = \frac{A}{s} + \frac{B+iC}{s-1+3i} + \frac{B-iC}{s-1-3i},
$$

for real $A,B,C$. Clearing denominators, we have

$$
1 = A(s^2+2s+10) + (B+iC)s(s-1-3i) + (B-iC)s(s-1+3i).
$$

We choose $s=0$ and get $A=1/10$. 



-->
