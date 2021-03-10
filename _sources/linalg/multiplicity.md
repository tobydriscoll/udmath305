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

# Multiplicity

The eigenvalues of a matrix are the roots of its characteristic polynomial. Given what we know about polynomials, there are some conclusions it's worth stating clearly.

````{proof:property} Eigenvalue properties
Suppose $\bfA$ is an $n\times n$ matrix. Then

1. $\bfA$ has at least one and at most $n$ distinct complex eigenvalues, and
2. If $\bfA$ is real, then any complex eigenvalues occur in conjugate pairs, as do their associated eigenvectors.
````

In general, we can factor a characteristic polynomial $p$ to get

```{math}
p(\lambda) = (z-\lambda_1)^{m_1}(z-\lambda_2)^{m_2}\cdots(z-\lambda_k)^{m_k},
```

for positive integer exponents such that $m_1+\cdots+m_k=n$. These exponents are the multiplicities of the roots, and that idea carries to the eigenvalues as well.

(definition-linalg-algmult)=
````{proof:definition} Algebraic multiplicity
The {term}`algebraic multiplicity` of an eigenvalue is its multiplicity as a root of the characteristic polynomial.
````

## Geometric multiplicity

The following example illustrates a possibility unique to eigenvalues of algebraic multiplicity greater than 1.

(example-linalg-defective)=
::::{admonition} Example
:class: tip
Find the eigenspaces of $\bfA=\twomat{4}{1}{0}{4}$.

:::{dropdown} Solution
The characteristic polynomial is 

```{math}
\twodet{4-\lambda}{1}{0}{4-\lambda} = (4-\lambda)^2,
```

so the double root $\lambda_1=4$ is the only eigenvalue. Since

```{math}
\bfA - 4\meye = \twomat{0}{1}{0}{0},
```

the eigenspace has basis $\twovec{1}{0}$.
:::
::::

This leads us to define a second notion of multiplicity for an eigenvalue. 

(definition-linalg-geomult)=
````{proof:definition} Geometric multiplicity
The {term}`geometric multiplicity` of an eigenvalue is the number of basis vectors in its associated eigenspace.
````

Here is an important fact we won't try to prove.

````{proof:property}
The geometric multiplicity of an eigenvalue is at least one and less than or equal to its algebraic multiplicity.
````

## Defectiveness

In the [above example](example-linalg-defective) we found a lone eigenvalue $\lambda_1=4$ of algebraic multiplicity 2 whose geometric multiplicity, we now see, is 1. The identity matrix is a different sort of example.

::::{admonition} Example
:class: tip
The $2\times 2$ identity matrix $\meye$ has a lone eigenvalue $\lambda_1=1$ of algebraic multiplicity 2. The system $(\meye - \meye)\bfv=\bfzero$ has an RREF that is the zero matrix, so there are two free variables and two basis vectors. Hence the geometric multiplicity of $\lambda_1$ is also 2.
::::

The distinction between these cases is significant enough to warrant yet another definition and name.

````{proof:definition} Defectiveness
An eigenvalue $\lambda$ whose geometric multiplicity is strictly less than its algebraic multiplicity is said to be {term}`defective`. A matrix is called defective if any of its eigenvalues are defective.
````

As we will see later on, defective matrices often complicate the application of eigenvalue analysis. They are rare in the sense that a random matrix has zero probability of being defective, but they do play a role. Since multiplicities are always at least one, there is a simple and common case in which we are certain that a matrix is not defective.

````{proof:theorem} Distinct eigenvalues
If $\bfA\in\cmn{n}{n}$ has $n$ distinct eigenvalues, then $\bfA$ is not defective.
````

For $n=2$, the possibilities in the case of algebraic multiplicity equal to 2 are easy to pin down even further. 

(thm-la-2x2defective)=
````{proof:theorem} $2\times 2$ defectivenss
Any $\bfA\in\cmn{2}{2}$ that has a single repeated eigenvalue is either defective or a multiple of the identity matrix. 
````

<div style="max-width:608px"><div style="position:relative;padding-bottom:66.118421052632%"><iframe id="kaltura_player" src="https://cdnapisec.kaltura.com/p/2358381/sp/235838100/embedIframeJs/uiconf_id/43030021/partner_id/2358381?iframeembed=true&playerId=kaltura_player&entry_id=1_46jcs8ws&flashvars[streamerType]=auto&amp;flashvars[localizationCode]=en&amp;flashvars[leadWithHTML5]=true&amp;flashvars[sideBarContainer.plugin]=true&amp;flashvars[sideBarContainer.position]=left&amp;flashvars[sideBarContainer.clickToClose]=true&amp;flashvars[chapters.plugin]=true&amp;flashvars[chapters.layout]=vertical&amp;flashvars[chapters.thumbnailRotator]=false&amp;flashvars[streamSelector.plugin]=true&amp;flashvars[EmbedPlayer.SpinnerTarget]=videoHolder&amp;flashvars[dualScreen.plugin]=true&amp;flashvars[Kaltura.addCrossoriginToIframe]=true&amp;&wid=1_6jbccbm1" width="608" height="402" allowfullscreen webkitallowfullscreen mozAllowFullScreen allow="autoplay *; fullscreen *; encrypted-media *" sandbox="allow-forms allow-same-origin allow-scripts allow-top-navigation allow-pointer-lock allow-popups allow-modals allow-orientation-lock allow-popups-to-escape-sandbox allow-presentation allow-top-navigation-by-user-activation" frameborder="0" title="Kaltura Player" style="position:absolute;top:0;left:0;width:100%;height:100%"></iframe></div></div>
