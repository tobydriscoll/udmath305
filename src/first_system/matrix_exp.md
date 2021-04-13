# The matrix exponential

Suppose that $\mathbf{X}(t)$ is a fundamental matrix for the constant-coefficient problem $\bfx'=\mathbf{A}\bfx$. If we impose on the general solution $\mathbf{X}(t)\mathbf{c}$ an initial condition at $t=0$, we obtain

$$
\bfx_0 = \bfx(0) = \mathbf{X}(0)\mathbf{c}.
$$

Solving this linear system symbolically for $\mathbf{c}$, the general solution becomes

$$
\bfx = \mathbf{X}(t) \mathbf{X}(0)^{-1} \bfx_0.
$$

The matrix $\mathbf{Y}(t) = \mathbf{X}(t) \mathbf{X}(0)^{-1}$ is interesting. First, it also satisfies $\mathbf{Y}'=\bfA \mathbf{Y}$:

$$
\mathbf{Y}' = \bigl[ \mathbf{X}(t) \mathbf{X}(0)^{-1} \bigr]\,' =  \mathbf{X}(t)' \mathbf{X}(0)^{-1} = \bfA \mathbf{X}(t) \mathbf{X}(0)^{-1} = \bfA \mathbf{Y}.
$$

Hence $\mathbf{Y}(t)$ is also a fundamental matrix. Second, it has the property that $\mathbf{Y}(0)=\mathbf{I}$, which is what makes it especially useful for the initial-value problem. 

Thinking back to scalar problems, the function $g(t)$ that satisfies $g'=a g$ and $g(0)=1$ is $g(t)=e^{at}$. Amazingly, this exponential function can also be extended to having matrix arguments.

## Power series

We know the Taylor series 

:::{math}
e^{at} = 1 + at + \frac{1}{2!}(at)^2 + \frac{1}{3!} (at)^3 + \cdots.
:::

This series can be generalized directly to a square matrix $\mathbf{A}$, for which integer powers are possible:

:::{math}
:label: fs-eq-matrixexp
e^{t\mathbf{A}} = \mathbf{I} + t\mathbf{A} + \frac{1}{2!}t^2 \mathbf{A}^2 + \frac{1}{3!} t^3 \mathbf{A}^3 + \cdots.
:::

Let's not worry too much about whether this converges (it does). What are its properties? 

(fs-thm-matrixexp)=
::::{proof:theorem} Matrix exponential
Let $\mathbf{A},\mathbf{B}$ be $n\times n$ matrices. Then 

1. $e^{t\mathbf{A}}=\mathbf{I}$ if $t=0$,
2. $\displaystyle \dd{}{t}e^{t\mathbf{A}} = \mathbf{A} e^{t\mathbf{A}} = e^{t\mathbf{A}}\mathbf{A}$,
3. $[e^{t\mathbf{A}}]^{-1} = e^{-t\mathbf{A}}$, and
4. If $\mathbf{A}\mathbf{B}=\mathbf{B}\mathbf{A}$, then $e^{t(\mathbf{A}+\mathbf{B})} = e^{t\mathbf{A}}e^{t\mathbf{B}} = e^{t\mathbf{B}}e^{t\mathbf{A}}$.
::::

These conclusions follow pretty easily from the series definition {eq}`fs-eq-matrixexp`. Furthermore, the matrix $\mathbf{Y}(t)$ above is equal to $e^{t\mathbf{A}}$. 

::::{proof:formula} Matrix exponential
If $\mathbf{X}(t)$ is any fundamental matrix for $\bfx'=\bfA\bfx$, then 

$$
e^{t\bfA} = \mathbf{X}(t) \mathbf{X}(0)^{-1}.
$$
::::

This formula is one way to avoid the rather daunting prospect of having to sum an infinite series of matrices.

::::{admonition} Example
:class: tip
Given 

:::{math}
\mathbf{A} = \twomat{1}{1}{4}{1}
:::

and the eigenpairs $\lambda_1=3$, $\mathbf{v}_1 = \twovec{1}{2}$ and $\lambda_2=-1$, $\mathbf{v}_2=\twovec{1}{-2}$, find $e^{t\mathbf{A}}$.

:::{dropdown} Solution
We start with the fundamental matrix

$$
\mathbf{X}(t) = \begin{bmatrix} e^{3t} \mathbf{v}_1 & e^{-t} \mathbf{v}_2 \end{bmatrix}
= \twomat{e^{3t}}{e^{-t}}{2e^{3t}}{-2e^{-t}}.
$$

Now we find

$$
\mathbf{X}(0)^{-1} = \twomat{1}{1}{2}{-2}^{-1} = \frac{1}{-4} \twomat{-2}{-1}{-2}{1}.
$$

Thus

$$
e^{t\mathbf{A}} = \frac{1}{4} \twomat{e^{3t}}{e^{-t}}{2e^{3t}}{-2e^{-t}} 
\twomat{2}{1}{2}{-1} = \frac{1}{4} \twomat{2e^{3t}+2e^{-t}}{e^{3t}-e^{-t}}{4e^{3t}-4e^{-t}}{2e^{3t}+2e^{-t}} .
$$
:::

::::

::::{admonition} Example
:class: tip
Given that 

:::{math}
\mathbf{A} = \twomat{1}{-1}{5}{-3}
:::

has the eigenpairs 

:::{math}
\lambda = -1\pm i, \; \mathbf{v} = \twovec{1}{2\mp i},
:::

find $e^{t\bfA}$ and the solution of the IVP $\bfx'=\mathbf{A}\bfx$, $\bfx(0)=\twovec{2}{1}$.

:::{dropdown} Solution
For $\lambda=-1+ i$, an eigenvector is

$$
\twovec{1}{2} + i\,\twovec{0}{-1}.
$$

Therefore we can construct a fundamental matrix from the columns

$$
\bfx_1(t) = e^{-t} \left(\cos(t) \twovec{1}{2} - \sin(t) \twovec{0}{-1}\right), \qquad \bfx_2(t) = e^{-t} \left(\cos(t) \twovec{0}{-1} + \sin(t) \twovec{1}{2}\right).
$$

Hence

$$
\mathbf{X}(0)^{-1} = \twomat{1}{0}{2}{-1}^{\,-1} = -1 \twomat{-1}{0}{-2}{1} = \twomat{1}{0}{2}{-1}.
$$

We can now compute

\begin{align*}
e^{t\bfA} &= e^{-t}\twomat{\cos(t)}{\sin(t)}{2\cos(t)+\sin(t)}{2\sin(t)-\cos(t)} \twomat{1}{0}{2}{-1}\\[0.5ex]
& = e^{-t}\twomat{\cos(t)+2\sin(t)}{-\sin(t)}{5\sin(t)}{\cos(t)-2\sin(t)}.
\end{align*}

Finally, then,

$$
\bfx(t) = e^{t\bfA} \bfx(0) = e^{-t}\twomat{\cos(t)+2\sin(t)}{-\sin(t)}{5\sin(t)}{\cos(t)-2\sin(t)} \twovec{2}{1} = e^{-t} \twovec{2\cos(t)+2\sin(t)}{\cos(t)+8\sin(t)}. 
$$

<!-- Begin with 

$$
\mathbf{X}(t) = e^{-t} \twomat{e^{it}}{e^{-it}}{(2-i)e^{it}}{(2+i)e^{-it}},
$$

from which

$$
\mathbf{X}(0)^{-1} =\twomat{1}{1}{2-i}{2+i}^{-1} = \frac{1}{2+i-2+i}\, \twomat{2+i}{-1}{-2+i}{1} = \frac{i}{2}\, \twomat{-2-i}{1}{2-i}{-1}.
$$

Then 

\begin{align*}
e^{t \mathbf{A}} & = \frac{i}{2} e^{-t} \,\twomat{e^{it}}{e^{-it}}{(2-i)e^{it}}{(2+i)e^{-it}}\, \twomat{-2-i}{1}{2-i}{-1} \\[1mm]
& = \frac{i}{2}e^{-t}\,  \twomat{-(2+i)e^{it}+(2-i) e^{-it}}{e^{it}-e^{-it}}{-(2-i)(2+i)e^{it}+(2+i)(2-i) e^{-it}}{(2-i)e^{it}-(2+i) e^{-it}}.
\end{align*}

Fear not! Each element of the matrix has the same form,

$$
z - \overline{z} = 2i \operatorname{Im}(z).
$$

We can factor out the $2i$, combining it with the $i/2$ in front, and then just compute an imaginary part for each element. For instance,

$$
-(2+i)e^{it} = (-2-i)[ \cos(t)+i\sin(t) ] = [ \text{real stuff} ] + i[ -\cos(t) -2\sin(t) ].
$$

Following this template, we get

$$
e^{t \mathbf{A}} = -e^{-t} \twomat{-\cos(t)-2\sin(t)}{\sin(t)}{-5\sin(t)}{-\cos(t)+2\sin(t)}.
$$

Finally, the IVP solution is

$$
\begin{split}
\bfx(t) = e^{t \mathbf{A}} \bfx_0 &= -e^{-t} \twomat{-\cos(t)-2\sin(t)}{\sin(t)}{-5\sin(t)}{-\cos(t)+2\sin(t)} \twovec{2}{1} \\[2mm]
&= e^{-t} \, \twovec{2\cos(t)+3\sin(t)}{\cos(t) + 8\sin(t)}.
\end{split}
$$

Whee! -->
:::
::::

## Defective matrix case

There is one situation in $\bfx'=\bfA \bfx$ for which we have not yet produced a fundamental matrix in the constant-coefficient case: when $\bfA$ is defective. It's complicated to spell out what happens in full generality, but it's easily managed for the $2\times 2$ case.

{numref}`Theorem {number}<thm-la-2x2defective>` states that for a $2\times 2$ matrix with a repeated eigenvalue, the matrix is either a multiple of the identity, or defective. In the latter case, something useful happens, which we state without proof.

:::{proof:theorem}
If $\mathbf{A}$ is a defective $2\times 2$ matrix with double eigenvalue $\lambda$, then $(\mathbf{A}-\lambda \mathbf{I})^2= \boldsymbol{0}$.
:::

Note that by part 4 of the matrix exponential theorem above,

$$
e^{t\mathbf{A}} = e^{t\lambda\mathbf{I}} \,  e^{t(\mathbf{A}-\lambda \mathbf{I})}.
$$

For the first right-side term we get

$$
e^{t\lambda\mathbf{I}} = \mathbf{I} + t\lambda \mathbf{I} + \frac{1}{2!}(t\lambda)^2 \mathbf{I}^2 + \cdots = \bigl(1 + t\lambda + \frac{1}{2!}(t\lambda)^2 + \cdots\bigr)\, \mathbf{I} = 
e^{t\lambda} \mathbf{I},
$$

and for the second term we get a power series that truncates after two terms:

$$
e^{t(\mathbf{A}-\lambda \mathbf{I})} = \mathbf{I} + t(\mathbf{A}-\lambda \mathbf{I}) + \frac{1}{2!}t^2 (\mathbf{A}-\lambda \mathbf{I})^2 + \cdots.
$$

Thus we arrive at the following.

::::{proof:formula} Matrix exponential for $2\times 2$ defective

:::{math}
:label: ls-2x2exp-defective
e^{t\mathbf{A}} = \bigl( e^{t\lambda} \meye \bigr) \,  \bigl( \mathbf{I} + t(\mathbf{A}-\lambda \mathbf{I}) \bigr)  =  e^{t\lambda} \bigl( \mathbf{I} + t(\mathbf{A}-\lambda \mathbf{I}) \bigr).
:::

::::

::::{admonition} Example
:class: tip
Find $e^{t\mathbf{A}}$ if $\bfA=\twomat{4}{1}{0}{4}$.

:::{dropdown} Solution
You can check that $\lambda=4$ is the only eigenvalue, with algebraic multiplicity equal to 2. By inspection, then, it is defective. Hence

$$
e^{t\mathbf{A}} =  e^{4t} \bigl() \mathbf{I} + t\, \twomat{0}{1}{0}{0} \bigr)
= e^{4t} \twomat{1}{t}{0}{1}.
$$
:::
::::

::::{admonition} Example
:class: tip
A critically damped free oscillator with natural frequency $\omega_0$ is equivalent to a system with the matrix

$$
\bfA = \twomat{0}{1}{-\omega_0^2}{-2\omega_0}.
$$

The characteristic polynomial is $\lambda^2 + 2\omega_0\lambda + \omega_0^2$, which has the double root $\lambda=-\omega_0$. Clearly this matrix is not a multiple of $\meye$, so it is defective. We compute

$$
\bfA - \lambda\meye = \twomat{\omega_0}{1}{-\omega_0^2}{-\omega_0}.
$$

This gives the exponential

$$
e^{t\mathbf{A}} = e^{-t\omega_0} \twomat{1+t\omega_0}{t}{-t\omega_0^2}{1-t\omega_0},
$$

which is a fundamental matrix. The oscillator position is the first component of the general solution,

$$
e^{-t\omega_0}[ c_1 (1+t\omega_0) + c_2 t],
$$

which is equivalent to the general solution we saw before for this problem, $e^{-t\omega_0}(c_1+c_2t)$.
::::

## Propagators

Obviously the formulas lead to some intense algebra for particular examples, even in the $2\times 2$ case. A computer can handle it, but the elementwise expressions get tediously long in all but special cases. 

The theoretical implications are more significant. 