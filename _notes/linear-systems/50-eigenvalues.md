---
layout: note
title: "Eigenvalues"
chapter: "Linear systems"
---
* TOC
{:toc}

*(See sections 3.3 and A.4.)*

## The eigenvalue problem

Consideration of the linear, constant-coefficient ODE system led us to believe that, given a square matrix $ \mathbf{A}$,  if we could solve

$$ \mathbf{A} \mathbf{v} = \lambda \mathbf{v} $$

for a scalar $\lambda$ and a nonzero vector $ \mathbf{v}$, then we would have an exponential solution of $ \mathbf{x}'= \mathbf{A} \mathbf{x}$. Such a value $\lambda$ is called an *eigenvalue*{:.def}, and $ \mathbf{v}$ is an associated *eigenvector*{:.def}.

The defining eigenvalue equation is equivalent to $ \mathbf{A} \mathbf{v} = \lambda \mathbf{I} \mathbf{v}, $ or $(\mathbf{A}-\lambda \mathbf{I})  \mathbf{v} = \boldsymbol{0}.$ If $(\mathbf{A}-\lambda \mathbf{I})$ is a nonsingular matrix, then this linear system has a unique solution, which is $\mathbf{v} = \boldsymbol{0}$. So, no eigenvector exists for this value of $\lambda$. In other words,

**$\lambda$ is an eigenvalue if and only if $\mathbf{A}-\lambda \mathbf{I}$ is a singular matrix.**

Furthermore, we know that if $\mathbf{A}-\lambda \mathbf{I}$ is singular, then $(\mathbf{A}-\lambda \mathbf{I})  \mathbf{v} = \boldsymbol{0}$ has infinitely many nonzero solutions. These include all nonzero scalar multiples of any eigenvector. We call all such solutions for a fixed eigenvalue $\lambda$ the associated *eigenspace*{:.def}.

Let's bring this down to a $2\times 2$ situation.

$$ \left( \begin{bmatrix} a & b \\ c & d \end{bmatrix} - \lambda \begin{bmatrix} 1 & 0 \\ 0 & 1 \end{bmatrix} \right) 
\begin{bmatrix} v_1 \\ v_2 \end{bmatrix} = \begin{bmatrix} 0 \\ 0 \end{bmatrix}. $$ 

$$  \begin{bmatrix} a-\lambda & b \\ c & d-\lambda \end{bmatrix} 
\begin{bmatrix} v_1 \\ v_2 \end{bmatrix} = \begin{bmatrix} 0 \\ 0 \end{bmatrix}. $$ 

This matrix is singular if it has zero determinant:

$$ 0 = \det( \mathbf{A} -\lambda \mathbf{I} ) =   \begin{vmatrix} a-\lambda & b \\ c & d-\lambda \end{vmatrix} = (a-\lambda)(d-\lambda)-bc.$$

Note that this is a quadratic polynomial in $\lambda$, called the *characteristic polynomial*{:.def}. Thus, a matrix has two eigenvalues (counting multiplicity). They may be complex even if the matrix is real, but those come in conjugate pairs. 

### Example

> Find the eigenvalues and eigenspaces of
>
> $$\begin{bmatrix} 1 & 1 \\ 4 & 1 \end{bmatrix}$$.

The determinant of $ \mathbf{A} -\lambda \mathbf{I}$ is $(1-\lambda)^2-4=\lambda^2-2\lambda -3=(\lambda-3)(\lambda+1)$, so the eigenvalues are $\lambda_1=3$ and $\lambda_2=-1$.

Now, $( \mathbf{A} -3 \mathbf{I}) \mathbf{v} = \boldsymbol{0} $ looks like

$$  \begin{bmatrix} -2 & 1 \\ 4 & -2 \end{bmatrix} 
\begin{bmatrix} v_1 \\ v_2 \end{bmatrix} = \begin{bmatrix} 0 \\ 0 \end{bmatrix}. $$

There must be infinitely many solutions, so these equations must be redundant. Note that the second row is a multiple of the first---this will always happen with $2\times 2$ eigenvalue problems. So we can focus on solving only $-2v_1+v_2=0$. I.e., any vector with $v_2=2v_1$ is in the eigenspace. These are all vectors of the form $[c,2c]^T=c[1,2]^T$ for a constant $c$.

Repeating for $\lambda=\lambda_2=-1$, we have to solve $2v_1+v_2=0$, or $v_2=-2v_1$, hence any vector in the form $c[1,-2]^T$.

---

### Example

> Find the eigenvalues and eigenvectors of
>
> $$ \begin{bmatrix} 1 & -1 \\ 5 & -3 \end{bmatrix}. $$

$$ \begin{vmatrix}  1-\lambda & -1 \\ 5 & -3-\lambda \end{vmatrix} = -(1-\lambda)(3+\lambda) + 5 = \lambda^2 +2\lambda +2.$$

The roots of this polynomial are $\lambda_{1,2} = -1 \pm 1i.$

To find an eigenvector for $\lambda_1$, we use the first row of $ \mathbf{A} - \lambda_1 \mathbf{I} $ to conclude $(2-i)v_1 -v_2 = 0$, so $v_2=(2-i)v_1$. Any multiple of the vector $[1,2-i]^T$ will do.

We get a benefit from the complex eigenvalues: the second eigenvector, like the second eigenvalue, is just the conjugate of the first. So we have $[1,2+i]^T$ (and all its multiples) to go with $\lambda_2$. 


## Multiple eigenvalues

The characteristic polynomial may have a repeated root. We'll discuss what happens in that case later. 


## The $n\times n$ case

If $ \mathbf{A} $ is an $n\times n$ matrix, then $\det( \mathbf{A} - \lambda \mathbf{I} )$ can be defined and is a polynomial of degree $n$. Thus  $ \mathbf{A} $ has $n$ eigenvalues, counting algebraic multiplicity. The algebra of finding them and their associated eigenvectors gets pretty onerous, and we instead can use the MATLAB command `eig` for the job. 

