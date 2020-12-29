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

# Eigenvalues

The last stop on our whirlwind tour of linear algebra is the hardest to motivate for a little while. However, the topic is important to the differential equations we study in future chapters, in the sense of oxygen being an important part of breathing.

We are still operating with square matrices only.

(definition-linalg-eigen)=

````{proof:definition} Eigenvalue and eigenvector

Suppose $\bfA\in\cmn{n}{n}$. If there exist a scalar $\lambda$ and a nonzero vector $\bfv$ such that

```{math}
\bfA \bfv = \lambda \bfv,
```

then $\lambda$ is an {term}`eigenvalue` of $\bfA$ with associated {term}`eigenvector` $\bfv$.
````

If you think of $\bfA$ as acting on vectors, then an eigenvector is a direction in which the action of $\bfA$ is the same as a scalar; we have found a little one-dimensional oasis in which the behavior of $\bfA$ is easy to comprehend.

## Eigenspaces

An eigenvalue is a clean, well-defined target. Eigenvectors are a little slipperier. For starters, if $\bfA\bfv=\lambda\bfv$, then

```{math}
	\bfA(c\bfv) = c(\bfA\bfv)=c(\lambda\bfv)=\lambda(c\bfv).
```

Hence **every nonzero multiple of an eigenvector is also an eigenvector for the same $\lambda$**. But there can be much more ambiguity than that.

````{proof:example}

Let $\meye$ be an identity matrix. Then $\meye\bfx=\bfx$ for any vector $\bfx$, so every nonzero vector is an eigenvector!
````

Fortunately we already have the tools we need to describe a more robust target, based on the very simple reformulation

```{math}
\bfzero=\bfA\bfv-\lambda\bfv=(\bfA-\lambda\meye)\bfv.
```

(definition-linalg-eigenspace)=

````{proof:definition} Eigenspace
Let $\lambda$ be an eigenvalue of $\bfA$. The {term}`eigenspace` associated with $\lambda$ is the general solution of $(\bfA-\lambda\meye)\bfx = \bfzero$.
````

Eigenspaces, unlike eigenvectors, are unique. We have to be a bit careful, though, because we usually express such spaces using basis vectors, and those bases are not themselves unique. 

Note that if $\lambda$ is *not* an eigenvalue, then by definition the only solution of $(\bfA-\lambda\meye)\bfv=\bfzero$ is $\bfv=\bfzero$. That requires $\bfA-\lambda\meye$ to be invertible.

````{proof:theorem}
$\lambda$ is an eigenvalue of $\bfA$ if and only if $\bfA-\lambda\meye$ is singular.
````

In practice the most common way to find eigenvalues by hand is through the equivalent condition $\det(\bfA-\lambda\meye)=0$.

````{proof:example}
We look for eigenvalues of

```{math}
\bfA = \begin{bmatrix} 1 & 1 \\ 4 & 1 \end{bmatrix}.
```

Start by computing

```{math}
\left| \twomat{1}{1}{4}{1} - \twomat{\lambda}{0}{0}{\lambda} \right| = \twodet{1-\lambda}{1}{4}{1-\lambda} = (1-\lambda)^2 - 4 = \lambda^2-2\lambda-3.
```

We find eigenvalues by setting this equal to zero, which means $\lambda_1=3$ or $\lambda_2=-1$. So these are the eigenvalues.

What about the eigenspaces? First consider $\lambda_1=3$:

```{math}
\bfA-3 \meye = \twomat{-2}{1}{4}{-2} \overset{\text{RREF}}{\Longrightarrow} \twomat{1}{-1/2}{0}{0}.
```

The homogeneous solution can be expressed as $x_1=s/2$, $x_2=s$, or $s\cdot[1/2;\,1]$. So $[1/2;\,1]$ is a basis for this eigenspace. Since eigenvectors can be rescaled at will, we prefer to use $\twovec{1}{2}$ as the basis vector.


For $\lambda_2=-1$,

```{math}
\bfA+ \meye = \twomat{2}{1}{4}{2} \overset{\text{RREF}}{\Longrightarrow} \twomat{1}{1/2}{0}{0},
```

leading to the basis $[-1/2;\,1]$ or equivalently, $\twovec{-1}{2}$.
````

## MATLAB

MATLAB computes eigenvalues (through an entirely different process) with the `eig` command. From the preceding example, for instance,

```{code-cell}
A = [ 1 1; 4 1 ];
lambda = eig(A)
```

If you want eigenvectors as well, use an alternate form for the output:

```{code-cell}
[V,D] = eig(A)
```

In most cases, column `V(:,k)` is an eigenvector for the eigenvalue `D(k,k)`. Keep in mind that any scalar multiple of an eigenvector is equally valid.

## Eigenvectors for $2\times 2$

Most of our hand computations will be with $2\times 2$ matrices. Suppose $\lambda$ is known to be an eigenvalue of $\bfA$. Then $\bfA-\lambda\meye$ must be singular, and its RREF has at least one free column. Hence row elimination will zero out the second row entirely, and we can ignore it.

Say the first row of $\bfA-\lambda\meye$ is $[\alpha,\beta]$. If these are both zero, then $\bfA-\lambda\meye$ is a zero matrix, i.e., $\bfA$ is a multiple of the identity and all of $\complex^2$ is the eigenspace. Otherwise, the vector $[\beta;\,-\alpha]$ is in the general homogeneous solution, and we can choose it as the basis of the eigenspace.

````{proof:example}
Let's find the eigenstuff of 

```{math}
\bfA = \twomat{1}{1}{-1}{1}.
```

We start by finding eigenvalues. 

$$
\det(\bfA - \lambda \meye) = \twodet{1-\lambda}{1}{-1}{1-\lambda} = (1-\lambda)^2 + 1.
$$

The eigenvalues are therefore roots of $\lambda^2 - 2\lambda + 2$, or 

$$
\lambda = 1 \pm \sqrt{1-2} = 1 \pm i.
$$

This is our first case of a real matrix that has complex eigenvalues. We just continue as always, only using complex arithmetic.

The eigenspace for $\lambda_1=1+i$ is the homogeneous solution of 

$$
\bfA - (1+i) \meye = \twomat{-i}{1}{-1}{-i}.
$$

To find a basis we just use the first row as explained above, getting $\twovec{1}{i}$. 

Now we get a nice reward for using complex numbers. Since the matrix is real, the other eigenvalue is the conjugate of $\lambda_1$, and it turns out that the same is true of the eigenspace as well. So $\twovec{1}{-i}$ is a basis for the second eigenspace.
````

(example-linalg-defective)=

````{proof:example}
Consider $\bfA=\twomat{4}{1}{0}{4}$. The characteristic polynomial is

```{math}
\twodet{4-\lambda}{1}{0}{4-\lambda} = (4-\lambda)^2,
```

so $\lambda_1=4$ is the only eigenvalue. Since

```{math}
\bfA - 4\meye = \twomat{0}{1}{0}{0},
```

the eigenspace has basis $\twovec{1}{0}$.
````

<!-- ````{proof:example}
			
				We find the eigenvalues and eigenvectors of
				```{math}
					\begin{bmatrix} 1 & -1 \\ 5 & -3 \end{bmatrix}
				```.
				The characteristic polynomial is $\lambda^2 +2 \lambda +2$, with roots  $\lambda_{1,2} = -1 \pm 1i.$
			
			
				To find an eigenvector for $\lambda_1$, we note that the first row of $ \bfA - \lambda_1 \mathbf{I} $ is $[(2-i),-1]$. Thus a basis for this eigenspace is the single eigenvector $\twovec{1}{2-i}$.
			
			
				We get a benefit here from the complex eigenvalues: the conjugate of an eigenvector for $\lambda_1$ will be an eigenvector for $\lambda_2$. So we have $\spanset\left(\twovec{1}{2+i}\right)$ to go with $\lambda_2$.
			
		````
	 -->
   