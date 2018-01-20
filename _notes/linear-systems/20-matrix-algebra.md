---
layout: note
title: "Matrix algebra"
chapter: "Linear systems"
---
* TOC
{:toc}

## Matrix terminology

*(See section A.1.)*

An $m\times n$ matrix $ \mathbf{A} $ is a rectangular $m$-by-$n$ array of numbers called *elements* or *entries*.  The numbers $m$ and $n$ are called the *row dimension* and the *column dimension*, respectively; collectively they describe the *size* of $ \mathbf{A}$. We say $\mathbf{A}$ belongs to $\mathbb{R}^{m\times n}$ if its entries are real or $\mathbb{C}^{m\times n}$ if they are complex-valued.

A *square* matrix has equal row and column dimensions. A *row vector* has dimension $1\times n$, while a *column vector* has dimension $m \times 1$. By default, a vector is understood to be a column vector, and we use $\mathbb{R}^n$ or $\mathbb{C}^n$ to denote spaces of vectors.  An ordinary number may be called a \textbf{scalar}.

We will mainly be dealing with vectors and square matrices. Please recall that "scalar/vector" and "constant/function" are separate attributes. All 4 combinations of them are possible.

We use capital letters in bold to refer to matrices, and lowercase bold letters for vectors. The bold symbol $\boldsymbol{0}$ may refer to a vector of all zeros or to a zero matrix, depending on context; we use $0$ as the scalar zero only.

To refer to a specific element of a matrix, we use the uppercase name of the matrix \emph{without} boldface, as in $A_{24}$ to mean the $(2,4)$ element of $\mathbf{A}$. (This is not universal practice, but it is most like MATLAB.) To refer to an element of a vector, we use just one subscript, as in $x_3$. If you see a boldface character with one or more subscripts, then you know that it is a matrix or vector that belongs to a numbered collection.

We will need to refer to the individual columns of a matrix as vectors. Our convention is to use a lowercase bold version of the matrix name, with a subscript to represent the column number. Thus, $\mathbf{a}_1,\mathbf{a}_2,\ldots,\mathbf{a}_n$ are the columns of the $m\times n$ matrix $\mathbf{A}$. Conversely, whenever we define a sequence of vectors $\mathbf{v}_1,\ldots,\mathbf{v}_p$, we can implicitly consider them to be columns of a matrix $\mathbf{V}$. Sometimes we might write $\mathbf{V}=\bigl[ \mathbf{v}_j \bigr]$ to emphasize the connection.

The *diagonal* (or main diagonal) of an $n\times n$ matrix $\mathbf{A}$ refers to the entries $A_{ii}$, $i=1,\ldots,n$. The entries $A_{ij}$ where $j-i=k$ are on a *superdiagonal* if $k>0$ and a *subdiagonal* if $k<0$. The diagonals are numbered as suggested here:

$$
\begin{bmatrix}
    0 & 1 & 2 & \cdots & n-1 \\
	-1 & 0 & 1 & \cdots & n-2 \\
    \vdots & \ddots & \ddots & \ddots & \vdots \\
    -n+2 & \cdots & -1 & 0 & 1\\
    -n+1 & \cdots & -2 & -1 & 0
\end{bmatrix}.
$$

A *diagonal* matrix is one whose entries are all zero off the main diagonal.  An *upper triangular* matrix $\mathbf{U}$ has entries $U_{ij}$ with $U_{ij}=0$ if $i>j$, and a *lower triangular* matrix $\mathbf{L}$ has $L_{ij}=0$ if $i<j$.

The *transpose* of $m\times n$ matrix $\mathbf{A}$ is the matrix
$\mathbf{A}^T\in\mathbb{C}^{n\times m}$ given by

$$
\mathbf{A}^T =
\begin{bmatrix}
A_{11} & A_{21} & \cdots & A_{m1}\\
\vdots & \vdots & & \vdots\\
A_{1n} & A_{2n} & \cdots & A_{mn}
\end{bmatrix}.
$$

The *conjugate transpose* or *hermitian* of $\mathbf{A}$ is given by

$$\mathbf{A}^*=\bar{\mathbf{A}}^T,$$

where the bar denotes taking a complex conjugate. If $\mathbf{A}$ is real, then hermitian is the same as transpose. A square matrix is  *symmetric* if $\mathbf{A}^T=\mathbf{A}$ and *hermitian* if $\mathbf{A}^*=\mathbf{A}$.

## Algebra

Matrices of the same size may be added elementwise.  Multiplication by a scalar is also defined elementwise. These operations obey the familiar laws of commutativity, associativity, and distributivity. The multiplication of two matrices, on the other hand, is much less straightforward.

In order for matrices $\mathbf{A}$ and $\mathbf{B}$ to be multiplied, it is necessary that their
"inner" dimensions match---i.e., $\mathbf{A}$ is $m\times p$ and $\mathbf{B}$ is $p \times
n$. Note that even if $\mathbf{A}\mathbf{B}$ is defined, $\mathbf{B}\mathbf{A}$ may not be, unless $m=n$. In terms
of scalar components, the $(i,j)$ entry of $\mathbf{C}=\mathbf{A}\mathbf{B}$ is given by

$$C_{ij} = \sum_{k=1}^p A_{ik} B_{kj}.$$

An important identity is that when $\mathbf{A}\mathbf{B}$ is defined,

$$  (\mathbf{A}\mathbf{B})^T=\mathbf{B}^T\mathbf{A}^T. $$

The latter product is always defined in this situation.

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

In words, we say that $\mathbf{A}\mathbf{v}$ is a *linear combination* of the columns of $\mathbf{A}$. (There is a similar interpretation of multiplying $\mathbf{A}$ on the left by a row vector, but we won't need that.)

This last observation extends to more general matrix-matrix
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

But note also, for instance, that

$$
\mathbf{A} \begin{bmatrix} 2 \\ 1 \end{bmatrix} = 2 \begin{bmatrix} 1 \\ 0 \\ -3
\end{bmatrix} + 1 \begin{bmatrix} -1 \\ 2 \\ 1 \end{bmatrix}
= \begin{bmatrix} 1 \\ 2 \\ -5 \end{bmatrix},
$$

and so on.

## Identity and inverse

A very important type of matrix is the *identity matrix*, defined as a square diagonal matrix whose diagonal entries are all equal to one:

$$
\mathbf{I} = \begin{bmatrix} 1 & 0 & 0 & \cdots & 0 \\
0 & 1 & 0 & \cdots & 0 \\
& & \ddots & & \\
0 & \cdots & 0 & 1 & 0\\
0 & \cdots & 0 & 0 & 1
\end{bmatrix}.
$$

Using the definitions of multiplication, we find that $ \mathbf{I} \mathbf{A} = \mathbf{A} $ and $ \mathbf{A} \mathbf{I} = \mathbf{A} $ whenever the sizes make sense. Thus, the identity matrix plays the role of the "unit number" in multiplication.

Every nonzero scalar has a multiplicative inverse: $a\cdot (1/a)=1$. The *inverse* of a square matrix is analogous:

$$ \mathbf{A} \mathbf{A}^{-1} = \mathbf{A}^{-1} \mathbf{A} = \mathbf{I}.$$

The zero matrix has no inverse. However, there are also nonzero matrices that have no inverse. They are called *singular* or *noninvertible*. The simplest example is

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

Now, this does suggest that if the matrix inverse is unique--which it is--then the solution to the linear system is also unique. Beyond that, this answer is not very satisfying. It doesn't tell us how to find $\mathbf{A}$, or how to know whether it even exists. So more remains to be done.
