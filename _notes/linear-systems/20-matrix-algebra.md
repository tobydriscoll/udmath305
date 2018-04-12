---
layout: note
title: "Matrix algebra"
chapter: "Linear systems"
---
* TOC
{:toc}

## Matrix terminology

*(See section A.1.)*

An $m\times n$ matrix $ \mathbf{A} $ is a rectangular $m$-by-$n$ array of numbers called *elements*{:.def} or *entries*{:.def}.  The numbers $m$ and $n$ are called the *row dimension*{:.def} and the *column dimension*{:.def}, respectively; collectively they describe the *size*{:.def} of $ \mathbf{A}$. We say $\mathbf{A}$ belongs to $\mathbb{R}^{m\times n}$ if its entries are real or $\mathbb{C}^{m\times n}$ if they are complex-valued.

A *square*{:.def} matrix has equal row and column dimensions. A *row vector*{:.def} has dimension $1\times n$, while a *column vector*{:.def} has dimension $m \times 1$. By default, a vector is understood to be a column vector, and we use $\mathbb{R}^n$ or $\mathbb{C}^n$ to denote spaces of vectors.  An ordinary number may be called a *scalar*{:.def}.

We will mainly be dealing with scalars, vectors and square matrices. Please recall that "scalar/vector" and "constant/function" are separate attributes. All 4 combinations of them are possible.

We use capital letters in bold to refer to matrices, and lowercase bold letters for vectors. The bold symbol $\boldsymbol{0}$ may refer to a vector of all zeros or to a zero matrix, depending on context; we use $0$ as the scalar zero only.

To refer to a specific element of a matrix, we use the uppercase name of the matrix *without* boldface, as in $A_{24}$ to mean the $(2,4)$ element of $\mathbf{A}$. (This is not universal practice, but it is most like MATLAB.) To refer to an element of a vector, we use just one subscript, as in $x_3$. If you see a boldface character with one or more subscripts, then you know that it is a matrix or vector that belongs to a numbered collection.

We sometimes find it useful to refer to the individual columns of a matrix as vectors. Our convention is to use a lowercase bold version of the matrix name, with a subscript to represent the column number. Thus, $\mathbf{a}_1,\mathbf{a}_2,\ldots,\mathbf{a}_n$ are the columns of the $m\times n$ matrix $\mathbf{A}$.



## Algebra

Matrices of the same size may be added elementwise.  Multiplication by a scalar is also defined elementwise. These operations obey the familiar laws of commutativity, associativity, and distributivity. The multiplication of two matrices, on the other hand, is much less straightforward.

In order for matrices $\mathbf{A}$ and $\mathbf{B}$ to be multiplied, it is necessary that their
"inner" dimensions match---i.e., $\mathbf{A}$ is $m\times p$ and $\mathbf{B}$ is $p \times
n$. Note that even if $\mathbf{A}\mathbf{B}$ is defined, $\mathbf{B}\mathbf{A}$ may not be, unless $m=n$. In terms
of scalar components, the $(i,j)$ entry of $\mathbf{C}=\mathbf{A}\mathbf{B}$ is given by

$$C_{ij} = \sum_{k=1}^p A_{ik} B_{kj}.$$

Note that $\mathbf{A}\mathbf{B}= \mathbf{B}\mathbf{A}$ is **not** true in general, even when both products are defined. That is, matrix multiplication is not
  commutative. It is, however, associative: $\mathbf{A}\mathbf{B}\mathbf{C}=(\mathbf{A}\mathbf{B})\mathbf{C}=\mathbf{A}(\mathbf{B}\mathbf{C})$. 

It is worth reinterpreting these products at a vector level.
If $\mathbf{A}$ has dimensions $m\times n$, it can be multiplied on the right
by an $n \times 1$ column vector $\mathbf{v}$ to produce an $m \times 1$ column
vector $\mathbf{A}\mathbf{v}$, which satisfies

$$
\mathbf{A} \mathbf{v} =
\begin{bmatrix}
\displaystyle \sum_k A_{1k}v_k \\[2mm]
\displaystyle \sum_k A_{2k}v_k \\
\vdots\\
\displaystyle \sum_k A_{mk}v_k
\end{bmatrix}
= v_1
\begin{bmatrix}
A_{11}\\A_{21}\\\vdots\\A_{m1}
\end{bmatrix} +
v_2
\begin{bmatrix}
A_{12}\\A_{22}\\\vdots\\A_{m2}
\end{bmatrix} +
\cdots + v_n
\begin{bmatrix}
A_{1n}\\A_{2n}\\\vdots\\A_{mn}
\end{bmatrix} = v_1 \mathbf{a}_1 + \cdots + v_n \mathbf{a}_n.
$$

In words, we say that $\mathbf{A}\mathbf{v}$ is a *linear combination*{:.def} of the columns of $\mathbf{A}$.

We can extend this interpretation to more general matrix-matrix
multiplications. One can show that (here again $\mathbf{A}$ is $m\times p$ and $\mathbf{B}$ is
$p\times n$)

$$\mathbf{A}\mathbf{B} =
\mathbf{A} \begin{bmatrix}
\mathbf{b}_1 & \mathbf{b}_2 & \cdots & \mathbf{b}_n
\end{bmatrix}
= \begin{bmatrix}
\mathbf{A}\mathbf{b}_1 & \mathbf{A}\mathbf{b}_2 & \cdots & A\mathbf{b}_n
\end{bmatrix}.
$$

In words, a matrix-matrix product is a horizontal concatenation of matrix-vector products involving the columns of the right-hand matrix.  All of our representations of matrix multiplication are equivalent, so whichever one is most convenient at any moment can be used.

### Example

Let

$$\mathbf{A} = \begin{bmatrix}
1 & -1 \\ 0 & 2 \\ -3 & 1
\end{bmatrix}, \qquad
\mathbf{B} = \begin{bmatrix}
2 & -1 & 0 & 4 \\ 1 & 1 & 3 & 2
\end{bmatrix}.
$$

Then we get

$$
\begin{align*}
\mathbf{A}\mathbf{B} &= \begin{bmatrix}
(1)(2) + (-1)(1) & (1)(-1) + (-1)(1) & (1)(0) + (-1)(3) & (1)(4)
+ (-1)(2) \\
(0)(2) + (2)(1) & (0)(-1) + (2)(1) & (0)(0) + (2)(3) & (0)(4)
+ (2)(2) \\
(-3)(2) + (1)(1) & (-3)(-1) + (1)(1) & (-3)(0) + (1)(3) & (-3)(4)
+ (1)(2)
\end{bmatrix} \\
&= \begin{bmatrix}
1 & -2 & -3 & 2 \\ 2 & 2 & 6 & 4 \\ -5 & 4 & 3 & -10
\end{bmatrix}.
\end{align*}
$$

Note also, for instance, that

$$
\mathbf{A} \begin{bmatrix} 2 \\ 1 \end{bmatrix} = 2 \begin{bmatrix} 1 \\ 0 \\ -3
\end{bmatrix} + 1 \begin{bmatrix} -1 \\ 2 \\ 1 \end{bmatrix}
= \begin{bmatrix} 1 \\ 2 \\ -5 \end{bmatrix},
$$

and so on.

## Why?

It's not necessary to understand where the rules of matrix multiplication come from, but it might put you at ease to know why they aren't completely arbitrary.

The most immediate connection is to the linear system of equations

$$
\begin{align}
a_{11}x_1 + a_{12}x_2 + \cdots + a_{1n}x_n &= b_1, \\
a_{21}x_1 + a_{22}x_2 + \cdots + a_{2n}x_n &= b_2, \\
& \vdots \\
a_{n1}x_1 + a_{n2}x_2 + \cdots + a_{nn}x_n &= b_n.
\end{align}
$$

The rules of matrix-vector multiplication ensure that this system can be stated simply as $ \mathbf{A} \mathbf{x} = \mathbf{b}.$ Note that $A_{ij}$ is the influence of the $j$th variable on the $i$th equation.

Another explanation is the connection with linear combination. We got used to doing things like $y=c_1\cos(t) + c_2\sin(t)$ for a general solution to an ODE. Now imagine that a function such as $\cos(t)$ is really an infinite "vector" whose values are "indexed" by the continuous variable $t$. Since a matrix-vector product is a linear combination of the columns of the matrix, it's not crazy to see $ \mathbf{A} \mathbf{x} = x_1 \mathbf{a}_1 + \cdots + x_n \mathbf{a}_n$ as a finite-dimensional version of something like

$$ y =
\begin{bmatrix}
\cos(t) & \sin(t)
\end{bmatrix}
\begin{bmatrix}
c_1 \\ c_2
\end{bmatrix}.
$$


## Structured matrices

From now on, **assume $\mathbf{A}$ is a square matrix**. Aside from vectors, we won't have much use for rectangular matrices. 

The *diagonal*{:.def} (or main diagonal) of an $n\times n$ matrix $\mathbf{A}$ refers to the entries $A_{ii}$, $i=1,\ldots,n$.

![Diagonally]({{ site.baseurl }}/assets/images/diagon.jpg)
{:.meme}

A *diagonal matrix*{:.def} is one whose entries are all zero off the main diagonal.  An *upper triangular*{:.def} matrix $\mathbf{U}$ has entries $U_{ij}$ with $U_{ij}=0$ if $i>j$, and a *lower triangular*{:.def} matrix $\mathbf{L}$ has $L_{ij}=0$ if $i<j$.


## Identity and inverse


![Identity]({{ site.baseurl }}/assets/images/identity.jpg)
{:.meme}

A very important matrix is the *identity matrix*{:.def}, defined as a square diagonal matrix whose diagonal entries are all equal to one:

$$
\mathbf{I} = \begin{bmatrix} 1 & 0 & 0 & \cdots & 0 \\
0 & 1 & 0 & \cdots & 0 \\
& & \ddots & & \\
0 & \cdots & 0 & 1 & 0\\
0 & \cdots & 0 & 0 & 1
\end{bmatrix}.
$$

Using the definitions of multiplication, we find that $ \mathbf{I} \mathbf{A} = \mathbf{A} $ and $ \mathbf{A} \mathbf{I} = \mathbf{A} $ whenever the sizes make sense. Thus, the identity matrix plays the role of the "unit number" in multiplication.

Every nonzero scalar has a multiplicative inverse: $a\cdot (1/a)=1$. The *inverse*{:.def} of a square matrix is analogous:

$$ \mathbf{A} \mathbf{A}^{-1} = \mathbf{A}^{-1} \mathbf{A} = \mathbf{I}.$$

The zero matrix has no inverse. However, there are also nonzero matrices that have no inverse. They are called *singular*{:.def}. The simplest example is

$$
\begin{bmatrix} 0 & 1 \\0 & 0 \end{bmatrix}.
$$

(Try to find an inverse for it!) The inverse of a nonsingular matrix is unique. 

If $ \mathbf{A} $ is $2\times 2$, finding its inverse is easy:

$$
\begin{bmatrix} a & b \\ c & d \end{bmatrix}^{-1} =
\frac{1}{ad-bc} \begin{bmatrix} d & -b \\ -c & a \end{bmatrix}.
$$

As that equation implies, the matrix is nonsingular if and only if $ad-bc\neq 0$. (More on that later.)

## Linear algebraic systems

*(See section A.2)*

Using matrix-vector multiplication, expressing a linear system of algebraic equations is dead simple:

$$ \mathbf{A} \mathbf{x} = \mathbf{b}. $$

Here $\mathbf{A}$ is an $n\times n$ matrix and $\mathbf{b}$ is an $n\times 1$ vector, both considered known. The goal is to solve for $ \mathbf{x} $, an $n$-vector of unknowns.

### Example

In the system

$$\begin{align}
3x_1 - x_3 &= 1\\
x_1+x_2+x_3 &= 0 \\
-x_1-2x_2+x_3 &= -2,
\end{align}$$

we have

$$ \mathbf{A} = \begin{bmatrix} 3 & 0 & -1 \\ 1 & 1 & 1 \\ -1 & -2 & 1 \end{bmatrix}, \quad
\mathbf{b} = \begin{bmatrix} 1 \\ 0 \\ -2 \end{bmatrix}.$$

---

In one sense, the solution of $ \mathbf{A} \mathbf{x} = \mathbf{b} $ is easy. Suppose $ \mathbf{A} $ is nonsingular. Then

$$ \mathbf{A}^{-1} (\mathbf{A} \mathbf{x}) = \mathbf{A}^{-1} \mathbf{b} $$

$$  (\mathbf{A}^{-1} \mathbf{A}) \mathbf{x} = \mathbf{A}^{-1} \mathbf{b} $$ 

$$  \mathbf{I}  \mathbf{x} = \mathbf{A}^{-1} \mathbf{b} $$ 

$$  \mathbf{x} = \mathbf{A}^{-1} \mathbf{b}. $$ 

Now, this does suggest that if the matrix inverse is unique--which it is--then the solution to the linear system is also unique. But this answer is purely theoretical. It doesn't tell us how to find $\mathbf{x}$, or how to know whether it even exists. So more remains to be done.
