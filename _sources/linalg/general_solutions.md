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

# General solutions

Let's focus on the linear system $\bfA\bfx=\bfb$ for an $n\times n$ coefficient matrix $\bfA$. If $\bfA$ is invertible, then $\bfx=\bfA^{-1}\bfb$ is the unique solution. What about when $\bfA$ is singular? All we know at the moment is that there are no solutions, or infinitely many of them.

## Homogeneous systems

We say that the linear system is {term}`homogeneous` if $\bfb=\bfzero$, that is, the system is $\bfA\bfx = \bfzero$. Here is one of those old habits you must learn to break.

```{warning}
A homogeneous system $\bfA\bfx = \bfzero$ can have nonzero solutions for $\bfx$, even if $\bfA$ is not the zero matrix.
```

To be clear, nonzero homogeneous solutions can occur only when $\bfA$ is singular, because otherwise the solution $\bfx=\bfA^{-1}\bfzero=\bfzero$ is unique.

A nice feature of zero is that adding multiples of zero to zero is still zero. So, if $\mathbf{R}$ is the RREF of $\bfA$, then the RREF of the augmented matrix $[\bfA;\,\bfzero]$ is just $[\mathbf{R};\,\bfzero]$. Each free column of $\mathbf{R}$ therefore introduces a free variable in the homogeneous solution.

````{proof:example}
The RREF of 

```{math}
\bfA = \begin{bmatrix} 1 & 2 & 3 \\ 4 & 5 & 6 \\ 7 & 8 & 9 \end{bmatrix}
```

is

```{math}
\begin{bmatrix} 1 & 0 & -1 \\ 0 & 1 & 2 \\ 0 & 0 & 0 \end{bmatrix}.
```

Therefore, solutions of the homogeneous system $\bfA\bfx=\bfzero$ can be read off from the augmented matrix

```{math}
\begin{bmatrix} 1 & 0 & -1 & 0\\ 0 & 1 & 2 & 0 \\ 0 & 0 & 0 & 0\end{bmatrix}.
```

Column 3 is free, so the solution is

```{math}
x_1 = s, \quad x_2 = -2s, \quad x_3 = s,
```

or $s[1;\,-2;\,1]$ for any value of $s$.
```
````

````{proof:example}
The RREF of 

```{math}
\bfA = \begin{bmatrix} 1 & 2 & 0 & -4 \\
-2 & -4 & 1 & 9 \\
-3 & -6 & 1 & 13 \\
-2 & -4 & 0 & 8   
 \end{bmatrix}
```

is

```{math}
\begin{bmatrix} 
1 & 2 & 0 & -4 \\
0 & 0 & 1 & 1 \\
0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0   
 \end{bmatrix}.
```

Hence columns 2 and 4 are free, so we set $x_2=s$, $x_4=t$. The rest of the solution is

```{math}
x_1 = -2s+4t, \quad x_3 = -t.
```

Note that we can also write 
```{math}
\bfx = s \begin{bmatrix} -2 \\ 1 \\ 0 \\ 0 \end{bmatrix} + t \begin{bmatrix} 4 \\ 0 \\ -1 \\ 1 \end{bmatrix}.
```
````

The preceding examples are typical in that the homogeneous solution always takes the form

```{math}
:label: linalg-general-homog
\bfx = c_1 \bfu_1 + c_2 \bfu_2 + \cdots + c_k \bfu_k,
```

where the $c_j$ are aribtrary, one for each free column of the RREF, and the vectors are constant. It's no accident that this has the form of a linear combination!

````{proof:definition}
The formula {eq}`linalg-general-homog` is called the {term}`general solution` of the homogeneous problem $\bfA\bfx=\bfzero$. We say that $\bfu_1,\ldots,\bfu_k$ form a {term}`basis` for the general solution.
````

In the new terminology, we can unify the case of an invertible $\bfA$ by saying that it has an empty basis, with a general solution of just $\bfzero$.

## Particular solution

Now we consider the nonhomogeneous system $\bfA\bfx=\bfb$. We introduce one of the simplest yet most confusing terms in the course. A {term}`particular solution` of the linear system $\bfA\bfx=\bfb$ is just any one solution of the problem. The only reason the term exists is to distinguish it from the *general* solution, which (as above) is an expression for *every possible* solution of the system.

````{proof:theorem} General solution of a linear system

All solutions of $\bfA\bfx=\bfb$ may be written as

```{math}
\bfx = \bfx_h + \bfx_p
```,

where $\bfx_h$ is the general solution of $\bfA\bfx=\bfzero$ and $\bfx_p$ is any particular solution of $\bfA\bfx=\bfb$. We call this the {term}`general solution` of a linear system of $\bfA\bfx=\bfb$.
````

````{proof:proof}
Let $\bfx_p$ be a particular solution, and suppose $\bfv$ is another solution. Then

```{math}
\bfA(\bfv-\bfx_p)=\bfA\bfv - \bfA\bfx_p = \bfb - \bfb = \bfzero.
```

Hence $\bfv-\bfx_p$ is a homogeneous solution, which means that we can write it as $\bfx_h$.
````

Hence every linear system is closely tied to its homogeneous counterpart. The general solution of $\bfA\bfx=\bfb$ requires just one solution, plus the general homogeneous solution.

````{proof:example}
Suppose

```{math}
\begin{bmatrix}
0 & -2 & 4 \\ 0 & 1 & -2 \\ 0 & 3 & -6
\end{bmatrix} \bfx = \threevec{-8}{4}{12}.
```

The RREF of the augmented matrix is found to be

```{math}
\begin{bmatrix}
0 & 1 & -2 & 4 \\ 0 & 0 & 0 & 0 \\ 0 & 0 & 0 & 0
\end{bmatrix}. 
```

If we replace the last column with zeros, we get the RREF of the associated homogeneous problem. Columns 1 and 3 are free, so we would get the homogeneous solution

```{math}
\bfx_h = \threevec{s}{2t}{t} = s \threevec{1}{0}{0} + t \threevec{0}{2}{1}.
```

Returning to the original nonhomogeneous problem, we only need to find one particular $\bfx_p$. It's easiest for us if we set all the free variables to be zero, in which case we get $x_1=x_3=0$ and $x_2 = 4$. Thus the general solution is

```{math}
\bfx = \bfx_p + \bfx_h = \threevec{0}{4}{0} + c_1 \threevec{1}{2}{1} + c_2 \threevec{0}{0}{1}.
```

```{tip}
The basis vectors and $\bfx_p$ aren't unique, so it's quite possible to write down two forms of the solution that look quite different but are equivalent.
```

The particular/homogeneous approach will come up again, and often, for differential equations in future chapters.
