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

# Defectiveness

Although we will mostly work with $2\times 2$ matrices, eigenvalues are so important that it's worth getting to know more about the general case.

## Characteristic polynomial

In the $n\times n$ case, cofactor expansion of $\det(\bfA-\lambda\meye)$ leads to the following definition.

(definition-linalg-characteristic-polynomial)=

````{proof:definition} Characteristic polynomial
Suppose $\bfA$ is $n\times n$. The {term}`characteristic polynomial` of $\bfA$ is $\det(\bfA-\lambda\bI)$. It is of degree $n$ in $\lambda$, with a leading coefficient of $(-1)^n$.
````

The roots of the characteristic polynomial are the eigenvalues of the matrix. Given what we know about roots of polynomials, there are some conclusions it's worth stating clearly.

````{proof:property} Eigenvalue properties
Suppose $\bfA$ is an $n\times n$ matrix. Then

1. $\bfA$ has at least one and at most $n$ distinct complex eigenvalues, and
2. If $\bfA$ is real, then any complex eigenvalues occur in conjugate pairs, as do their associated eigenvectors.
````

## Defective eigenvalues

We can factor a characteristic polynomial $p$ to get

```{math}
p(\lambda) = (z-\lambda_1)^{m_1}(z-\lambda_2)^{m_2}\dots(z-\lambda_k)^{m_k}
```

for nonnegative integer exponents such that $m_1+\cdots+m_k=n$. These exponents are the multiplicities of the roots, and that idea carries to the eigenvalues as well.

(definition-linalg-algmult)=

````{proof:definition} Algebraic multiplicity
The {term}`algebraic multiplicity` of an eigenvalue is its multiplicity as a root of the characteristic polynomial.
````

But eigenvalues have another significant notion of multiplicity as well.

(definition-linalg-geomult)=

````{proof:definition} Geometric multiplicity
The {term}`geometric multiplicity` of an eigenvalue is the number of basis vectors in its associated eigenspace.
````

Here is a fact we won't try to prove.

````{proof:property}
The geometric multiplicity of an eigenvalue is at least one and less than or equal to its algebraic multiplicity.
````

This fact spurs another definition.

```{index} defective eigenvalue
```

````{proof:definition} Defectiveness
An eigenvalue $\lambda$ whose geometric multiplicity is strictly less than its algebraic multiplicity is said to be {term}`defective`. A matrix is called defective if any of its eigenvalues are defective.
````

Since multiplicities are always at least one, there is a simple and common case in which we are certain that there are no defective eigenvalues.

````{proof:theorem} Distinct eigenvalues imply nondefectiveness
If $\bfA\in\cmn{n}{n}$ has $n$ distinct eigenvalues, then $\bfA$ is not defective.
````

For $n=2$, either there is a double eigenvalue or two distinct eigenvalues. Only the case with a double eigenvalue may be defective. Here are the two canonical archetypes.

````{proof:example}
If $\bfA=\twomat{c}{0}{0}{c}$, then the characteristic polynomial is $p(\lambda)=(\lambda-c)^2$. Thus $\lambda=c$ is the only eigenvalue, with algebraic multiplicity 2. All nonzero vectors are eigenvectors, so we can represent the eigenspace as a linear combination of $\twovec{1}{0}$ and $\twovec{0}{1}$. Hence the geometric multiplicity is also equal to 2, and $\bfA$ is nondefective.

````

````{proof:example}
A [previous example](example-linalg-defective) showed that the matrix $\bfA=\twomat{4}{1}{0}{4}$ has eigenvalue $\lambda=4$ with algebraic multiplicity equal to 2 and geometric multiplicity equal to 1. Hence this matrix is defective.
````

The situation for $n>2$ can be more complicated, but we will stop here and move on to dynamics.
