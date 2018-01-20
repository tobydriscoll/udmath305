---
layout: note
title: "Repeated eigenvalues"
chapter: "Linear systems"
---
* TOC
{:toc}

*(See section 3.5.)*


The characteristic polynomial in the $2\times 2$ case may have a repeated root. We only have to consider real eigenvalues, if the original matrix is real. Two kinds of eigenspaces emerge in this case.

Note: Some of what follows is specific to $2\times 2$, and is a little complicated to generalize to $n\times n$.

## Diagonal

If the matrix is diagonal and has repeated eigenvalues, then it is a multiple of the identity, $ \mathbf{A} = a \mathbf{I}$. This turns out to be easy. First, note that $\det(a \mathbf{I} - \lambda \mathbf{I} )=(a-\lambda)^2$, so $a$ is the repeated eigenvalue. Now, an eigenvector has to satisfy $( \mathbf{A} - \lambda \mathbf{I} ) \mathbf{v} = \boldsymbol{0}$. But $\mathbf{A} - a \mathbf{I}$ is the zero matrix, so we can choose any $ \mathbf{v} $ at all! To get independent solutions, it's easiest to choose columns of the identity. So the general solution is

$$ c_1 e^{\lambda t} \begin{bmatrix} 1 \\ 0 \end{bmatrix} + c_2 e^{\lambda t} \begin{bmatrix} 0 \\ 1 \end{bmatrix}.$$

## Nondiagonal

If an eigenvalue is repeated in a nondiagonal $2\times 2$ matrix, it turns out that we can only find one independent eigenvector.

### Example

> Find the eigenspace of
> $$ \mathbf{A} = \begin{bmatrix} -1 & 1 \\ 0 & -1 \end{bmatrix}.$$


You may verify that the characteristic polynomial is $(\lambda+1)^2$, so we have the double root $\lambda=-1$. The eigenvector system is

$$ \begin{bmatrix} 0 & 1 \\ 0 & 0 \end{bmatrix} \mathbf{v} = \boldsymbol{0}.$$

The second row of the system is just $0=0$, i.e., no restriction. But the first row dictates that $v_2=0$. So the eigenvectors all have the form $[c,0]^T$, and they span only one dimension (the $x_1$-axis).

## ODE with a defective matrix

Suppose $ \mathbf{x}' = \mathbf{A} \mathbf{x}$ and $ \mathbf{A} $ is defective with eigenvalue $\lambda$. We do get one solution $ \mathbf{x} = e^{\lambda t} \mathbf{v}$, where $( \mathbf{A} - \lambda \mathbf{I} ) \mathbf{v} = \boldsymbol{0} $. We need to find a second, independent solution to get the general solution.

From our experiences with 2nd-order equations, it's reasonable to assume that $te^{\lambda t}$ will play some role. So we plug in $te^{\lambda t} \mathbf{w}$ for an unknown $ \mathbf{w} $:

$$ (\lambda t e^{\lambda t} + e^{\lambda t}) \mathbf{w} = t e^{\lambda t} \mathbf{A} \mathbf{w}.$$

The exponentials all cancel. But we don't have enough to balance both the $t^0$ and $t^1$ terms. A better guess is  $ \mathbf{x} = te^{\lambda t} \mathbf{v} + e^{\lambda t} \mathbf{w}$, where $ \mathbf{v} $ is an eigenvector. Then

$$ (\lambda t e^{\lambda t} + e^{\lambda t}) \mathbf{v} + \lambda e^{\lambda t} \mathbf{w} = t e^{\lambda t} \mathbf{A} \mathbf{v} + e^{\lambda t} \mathbf{A} \mathbf{w}.$$

Grouping together like terms, we have

$$ t( \mathbf{A} \mathbf{v} - \lambda \mathbf{v} ) + (  \mathbf{A} \mathbf{w} - \lambda \mathbf{w} ) = \mathbf{v}.$$

The term multiplying $t$ is zero, by the eigenvector property. So we've got a solution if

$$ (  \mathbf{A} - \lambda \mathbf{I} )  \mathbf{w} = \mathbf{v} $$

can be solved for $ \mathbf{w}$. Fortunately, this is always possible. We call $ \mathbf{w}$ a *generalized eigenvector*.  

### Example

> Find the general solution of
> $$ \mathbf{x}' = \begin{bmatrix} -1 & 1 \\ 0 & -1 \end{bmatrix} \mathbf{x}.$$

This is the same matrix as in the example above, with double eigenvalue $\lambda=-1$ and eigenvector $[c_1,0]^T$. We solve for the generalized eigenvector:

$$ \begin{bmatrix} 0 & 1 \\ 0 & 0 \end{bmatrix} \mathbf{w} = \begin{bmatrix} c_1 \\ 0 \end{bmatrix}. $$

The first row of this system tells us $w_2=c_1$. The second row makes no restrictions on us, so $ \mathbf{w} = [ c_2,c_1 ]$. Hence the general solution is

$$ t e^{-t} \begin{bmatrix} c_1 \\ 0 \end{bmatrix} + e^{-t} \begin{bmatrix} c_2 \\ c_1 \end{bmatrix}
= c_1 e^{-t} \begin{bmatrix} t \\ 1 \end{bmatrix} + c_2 e^{-t} \begin{bmatrix} 1 \\ 0 \end{bmatrix}.$$

## Asymptotic behavior

Compared to a factor $t$, an exponential always wins. So if $\lambda < 0$, the origin is a sink, and if $\lambda > 0$, it is a source. Sometimes it gets the label *improper* or *degenerate* attached.

## Matrix exponential

If $ \mathbf{x}' = \mathbf{A} \mathbf{x}$, then the general solution should be $ \mathbf{x} = e^{t \mathbf{A}} \mathbf{c}$, right? Suppose we use a Taylor series to define the exponential function for a matrix:

$$ e^{t \mathbf{A}} = \mathbf{I} + t \mathbf{A} + \frac{t^2}{2!} \mathbf{A}^2 + \frac{t^3}{3!} \mathbf{A}^3 + \cdots.$$

### Example

> Find the general solution of
> $$ \mathbf{x}' = \begin{bmatrix} -1 & 1 \\ 0 & -1 \end{bmatrix} \mathbf{x}.$$

We start computing:

$$ \begin{bmatrix} -1 & 1 \\ 0 & -1 \end{bmatrix}^2 = \begin{bmatrix} 1 & -2 \\ 0 & 1 \end{bmatrix} $$

$$ \begin{bmatrix} -1 & 1 \\ 0 & -1 \end{bmatrix}^3 = \begin{bmatrix} 1 & -2 \\ 0 & 1 \end{bmatrix} \begin{bmatrix} -1 & 1 \\ 0 & -1 \end{bmatrix} = \begin{bmatrix} -1 & 3 \\ 0 & -1 \end{bmatrix} $$

$$ \begin{bmatrix} -1 & 1 \\ 0 & -1 \end{bmatrix}^4 = \begin{bmatrix} -1 & 3 \\ 0 & -1 \end{bmatrix} \begin{bmatrix} -1 & 1 \\ 0 & -1 \end{bmatrix}=  \begin{bmatrix} 1 & -4 \\ 0 & 1 \end{bmatrix} $$

Hold on here. It looks like

$$ e^{t \mathbf{A}} = \mathbf{I} + t \mathbf{A} + \frac{t^2}{2!} \mathbf{A}^2 + \frac{t^3}{3!} \mathbf{A}^3 + \cdots $$

$$ = \begin{bmatrix} 1 & 0 \\ 0 & 1 \end{bmatrix} + t \begin{bmatrix} -1 & 1 \\ 0 & -1 \end{bmatrix} + \frac{t^2}{2!} \begin{bmatrix} 1 & -2 \\ 0 & 1 \end{bmatrix} + \frac{t^3}{3!} \begin{bmatrix} -1 & 3 \\ 0 & -1 \end{bmatrix} + \cdots$$

$$ = \begin{bmatrix} 1 -t + \frac{(-t)^2}{2!} + \frac{(-t)^3}{3!}+\cdots  & t - \frac{t^2}{1!} + \frac{t^3}{2!} -  \frac{t^4}{3!} + \cdots \\ 0 & 1 -t + \frac{(-t)^2}{2!} + \frac{(-t)^3}{3!}+\cdots \end{bmatrix} $$

$$ = \begin{bmatrix} e^{-t}  & t\bigl( 1 - t + \frac{t^2}{2!} -  \frac{t^3}{3!} + \cdots \bigr) \\ 0 & e^{-t} \end{bmatrix} $$ 

$$ = \begin{bmatrix} e^{-t}  & te^{-t} \\ 0 & e^{-t} \end{bmatrix}. $$

That would mean

$$ \mathbf{x}(t) = \begin{bmatrix} e^{-t}  & te^{-t} \\ 0 & e^{-t} \end{bmatrix} \begin{bmatrix} c_1 \\ c_2 \end{bmatrix}
=c_1 e^{-t} \begin{bmatrix} 1 \\ 0 \end{bmatrix} + c_2 e^{-t} \begin{bmatrix} t \\ 1 \end{bmatrix}. $$

![mind blown](mind-blown.jpg)
