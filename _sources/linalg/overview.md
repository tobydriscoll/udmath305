# Overview

Linear algebra provides a convenient and general way to pose and analyze problems in multiple dimensions. The most tractable and universal such problems involve linear transformations. 

(definition-linear)=

````{proof:definition} Linear function
A function $L$ on domain $D$ is {term}`linear` if it satisfies both of these rules:
```{math}
L(cx) = c \cdot L(x) \quad \text{for all numbers $c$ and $x\in D$,}
```
and
```{math}
L(x+y) = L(x) + L(y) \quad \text{for all $x\in D$, $y\in D$}.
```
````

I've been deliberately vague about the domain and range of $L$ in this definition, because it can be adapted to multiple contexts.

## Glossary

```{glossary}
algebraic multiplicity
  For an eigenvalue, its multiplicity in the sense of its appearance in the factorization of the characteristic polynomial.

augmented matrix
  Result of horizontally concatenating the coefficient matrix of a linear system with the right-side vector.

basis
  Minimal set of constant vectors needed to describe the general solution of a homogeneous linear system.

charcteristic polynomial
  Polynomial of degree $n$ whose roots are the eigenvalues of an $n\times n$ matrix.

coefficient matrix
  Matrix of all coefficients multiplying unknowns in a linear algebraic system of equations.

cofactor expansion
  Definition and/or computational method for finding the determinant of a matrix through recursive size reduction.

conjugate
  Replacement of each occurence of $i$ by $-i$ in any representation of a complex number, i.e., reflection about the real axis in the complex plane.

Cramer's Rule
  Algorithm to compute the solution of a linear algebraic system using only determinant calculations.

defective
  For an eigenvalue, having geometric multiplicity less than the algebraic multiplicity; for a matrix, having one or more defective eigenvalues.

determinant
  Scalar value computed from a square matrix that is zero if and only if the matrix is singular.

eigenspace
  General solution of $(\bfA-\lambda\meye)\bfv=\bfzero$ for a given square matrix $\bfA$ and some nonzero vector $\bfv$.

eigenvalue
  Scalar value $\lambda$ satsifying $\bfA\bfv=\lambda\bfv$ for a given square matrix $\bfA$ and some nonzero vector $\bfv$.

eigenvector
  Nonzero vector $\bfv$ satsifying $\bfA\bfv=\lambda\bfv$ for a given square matrix $\bfA$ and some scalar $\lambda$.

free column
  Column of a RREF matrix that contains no leading ones.

Gaussian elimination
  Use of row operations to transform an augmented matrix to a triangular form.

geometric multiplicity
  For an eigenvalue, the number of basis vectors in its associated eigenspace.

general solution
  Representation of all possible solutions to a linear algebraic system of equations.

homogeneous
  Linear system of equations with zero right side, i.e., $\bfA\bfx=\bfzero$.

identity matrix
  Square diagonal matrix with ones on the diagonal, serving as the multiplicative identity.

imaginary part
  Component of a complex number that multiplies the imaginary unit $i$ when the number is written in standard rectangular form.

inconsistent
  Linear algebraic system of equations that has no solution.

invertible
  Matrix that has an inverse and which gives a unique solution for every linear algebraic system.

inverse
  Unique matrix that multiplies a given square invertible matrix to produce the identity matrix.

leading nonzero
  First (i.e., leftmost) nonzero element of a matrix row.

linear
  Type of function or operator that satisfies two basic properties.

linear combination
  Simultaneous multiplication of vectors by coefficients, followed by summation to a single vector.

matrix
  Array of numbers obeying certain algebraic rules.

modulus
  Extension of absolute value to complex numbers, representing the distance between values in the complex plane.

particular solution
  Any one solution of linear algebraic system, as opposed to the general solution.

pivot column
  Column of an RREF matrix that contains a leading one.

real part
  Component of a complex number that does not multiply the imaginary unit $i$ when the number is written in standard rectangular form.

row elimination
  Use of elementary operations on the rows of a matrix to transform it to a simpler one, such as its RREF equivalent.

RREF
  Matrix meeting certain requirements that expose all necessary information about solving a linear algebraic system; stands for "reduced row echelon form."

scalar
  Real or complex number, as distinguished from a vector or matrix.

scalar multiplication
  Multiplication of each element of a vector or matrix by a given number.

singular
  Matrix that does not have an inverse and for which homogeneous linear equations have infinitely many solutions.

square
  Matrix with the same number of rows as columns.

vector
   Finite collection of numbers obeying certain algebraic rules.
```