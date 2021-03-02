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

```{note}
Every nonzero multiple of an eigenvector is also an eigenvector for the same eigenvalue.
```

But there can be even more ambiguity than scalar multiples.

::::{admonition} Example
:class: tip

Let $\meye$ be an identity matrix. Then $\meye\bfx=\bfx$ for any vector $\bfx$, so every nonzero vector is an eigenvector!
::::

Fortunately we already have the tools we need to describe a more robust target, based on the very simple reformulation

```{math}
\bfzero=\bfA\bfv-\lambda\bfv=(\bfA-\lambda\meye)\bfv.
```

(definition-linalg-eigenspace)=

````{proof:definition} Eigenspace
Let $\lambda$ be an eigenvalue of $\bfA$. The {term}`eigenspace` associated with $\lambda$ is the general solution of $(\bfA-\lambda\meye)\bfx = \bfzero$.
````

Eigenspaces, unlike eigenvectors, are unique. We have to be a bit careful, though, because we usually express such spaces using basis vectors, and those bases are not themselves unique. It's also not unusual for problems and discussions to use eigenvectors and just put up with the nonuniqueness.

## Computing eigenvalues and eigenvectors

Note that if $\lambda$ is *not* an eigenvalue, then by definition the only solution of $(\bfA-\lambda\meye)\bfv=\bfzero$ is $\bfv=\bfzero$. That requires $\bfA-\lambda\meye$ to be invertible.

````{proof:theorem}
$\lambda$ is an eigenvalue of $\bfA$ if and only if $\bfA-\lambda\meye$ is singular.
````

In practice the most common way to find eigenvalues by hand is through the equivalent condition $\det(\bfA-\lambda\meye)=0$. This determinant has a particular form and name.

```{proof:definition} Characteristic polynomial of a matrix
Suppose $\bfA$ is an $n\times n$ matrix. The function $p(z) = \det(\bfA-z\meye)$ is a polynomial of degree $n$ in $z$, known as the {term}`characteristic polynomial` of $\bfA$.
```

````{proof:algorithm} Eigenvalues and eigenspaces
Given an $n\times n$ matrix $\bfA$:

1. Find the characteristic polynomial $p$ of $\bfA$.
2. Let $\lambda_1,\ldots,\lambda_k$ be the distinct roots of $p$. These are the eigenvalues. (If $k<n$, it's because one or more roots has multiplicity greater than 1.)
3. For each $\lambda_j$, find the general solution of $(\bfA-\lambda_j\meye)\bfv=\bfzero$. This is the eigenspace associated with $\lambda_j$.
````

::::{admonition} Example
:class: tip
Find the eigenvalues and eigenspaces of

```{math}
\bfA = \begin{bmatrix} 1 & 1 \\ 4 & 1 \end{bmatrix}.
```

:::{dropdown} Solution
Start by computing the characteristic polynomial:

```{math}
\det \left(\twomat{1}{1}{4}{1} - \twomat{\lambda}{0}{0}{\lambda} \right) = \twodet{1-\lambda}{1}{4}{1-\lambda} = (1-\lambda)^2 - 4 = \lambda^2-2\lambda-3.
```

We find eigenvalues by finding its roots, in this case $\lambda_1=3$ and $\lambda_2=-1$. 

For $\lambda_1=3$,

```{math}
\bfA-3 \meye = \twomat{-2}{1}{4}{-2} \quad \overset{\text{RREF}}{\Longrightarrow} \quad \twomat{1}{-1/2}{0}{0}.
```

The homogeneous solution can be expressed as $x_1=s/2$, $x_2=s$, or $\bfx=s\cdot[1/2;\,1]$. So $[1/2;\,1]$ is a basis for this eigenspace. Since eigenvectors can be rescaled at will, we prefer to use $\twovec{1}{2}$ as the basis vector.

For $\lambda_2=-1$,

```{math}
\bfA+ \meye = \twomat{2}{1}{4}{2} \quad \overset{\text{RREF}}{\Longrightarrow} \quad \twomat{1}{1/2}{0}{0},
```

leading to the eigenspace basis $[-1/2;\,1]$ or equivalently, $\twovec{-1}{2}$.
:::
::::

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

In most cases, column `V(:,k)` is an eigenvector for the eigenvalue `D(k,k)`. (For eigenvalues of multiplicity greater than 1, the interpretation can be more complicated.) Keep in mind that any scalar multiple of an eigenvector is equally valid.

## Eigenvectors for $2\times 2$

Finding the exact roots of a cubic polynomial is not an easy matter unless the polynomial is special. Thus most of our hand computations will be with $2\times 2$ matrices. Suppose $\lambda$ is known to be an eigenvalue of $\bfA$. Then $\bfA-\lambda\meye$ must be singular, and its RREF has at least one free column. Hence row elimination will zero out the second row entirely, and we can ignore it. That allows us to deduce the following.

```{proof:algorithm} Eigenvectors for $2\times 2$
1. Let $\lambda$ be an eigenvalue of $\bfA$.
2. Let the first row of $\bfA-\lambda\meye$ be designated by $[\alpha,\beta]$. 
    - If $\alpha=\beta=0$, then $\bfA-\lambda\meye$ is a zero matrix and all of $\complex^2$ is the eigenspace of $\lambda$.
    - Otherwise, the vector $[\beta;\,-\alpha]$ is a basis of the eigenspace of $\lambda$.
```

::::{admonition} Example
:class: tip
Find the eigenstuff of 

```{math}
\bfA = \twomat{1}{1}{-1}{1}.
```
:::{dropdown} Solution
We start by finding eigenvalues. 

$$
\det(\bfA - \lambda \meye) = \twodet{1-\lambda}{1}{-1}{1-\lambda} = (1-\lambda)^2 + 1.
$$

The eigenvalues are therefore roots of $\lambda^2 - 2\lambda + 2$, or 

$$
\lambda = 1 \pm \sqrt{1-2} = 1 \pm i.
$$

This is our first case of a real matrix that has complex eigenvalues. We continue as always, only using complex arithmetic.

The eigenspace for $\lambda_1=1+i$ is the homogeneous solution of 

$$
\bfA - (1+i) \meye = \twomat{-i}{1}{-1}{-i}.
$$

To find a basis we just use the first row as explained above, getting $\twovec{1}{i}$. 

Now we get a nice reward for using complex numbers. Since the matrix is real, the other eigenvalue is the conjugate of $\lambda_1$, and it turns out that the same is true of the eigenspace as well. So $\twovec{1}{-i}$ is a basis for the second eigenspace.
:::
::::

   <div style="max-width:608px"><div style="position:relative;padding-bottom:66.118421052632%"><iframe id="kaltura_player" src="https://cdnapisec.kaltura.com/p/2358381/sp/235838100/embedIframeJs/uiconf_id/43030021/partner_id/2358381?iframeembed=true&playerId=kaltura_player&entry_id=1_2wzgw5dv&flashvars[streamerType]=auto&amp;flashvars[localizationCode]=en&amp;flashvars[leadWithHTML5]=true&amp;flashvars[sideBarContainer.plugin]=true&amp;flashvars[sideBarContainer.position]=left&amp;flashvars[sideBarContainer.clickToClose]=true&amp;flashvars[chapters.plugin]=true&amp;flashvars[chapters.layout]=vertical&amp;flashvars[chapters.thumbnailRotator]=false&amp;flashvars[streamSelector.plugin]=true&amp;flashvars[EmbedPlayer.SpinnerTarget]=videoHolder&amp;flashvars[dualScreen.plugin]=true&amp;flashvars[Kaltura.addCrossoriginToIframe]=true&amp;&wid=1_e9ee2yk9" width="608" height="402" allowfullscreen webkitallowfullscreen mozAllowFullScreen allow="autoplay *; fullscreen *; encrypted-media *" sandbox="allow-forms allow-same-origin allow-scripts allow-top-navigation allow-pointer-lock allow-popups allow-modals allow-orientation-lock allow-popups-to-escape-sandbox allow-presentation allow-top-navigation-by-user-activation" frameborder="0" title="Kaltura Player" style="position:absolute;top:0;left:0;width:100%;height:100%"></iframe></div></div>
   