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

# Vectors and matrices

The objects most of interest to us for now are *vectors* and *matrices*.

````{proof:definition} Vector
A {term}`vector` is a finite collection of numbers called its elements. The set of all vectors with $n$ real-valued elements is denoted $\real^n$. If the elements are complex numbers, we use the name $\complex^n$. 
````

```{warning}
Complex numbers are coming. They play an essential role in understanding dynamics.
```

I use boldfaced lowercase letters to represent vectors, and a subscript to refer to an individual element within one. For instance, $x_3$ is the third element of a vector $\bfx$.

There is one more big definition to get out of the way before we really dive in.

````{proof:definition} Matrix
A {term}`matrix` is an $m\times n$ array of numbers called its elements. The set of all $m\times n$ matrices with real elements is denoted $\rmn{m}{n}$, and with complex elements it's $\cmn{m}{n}$. 
````

I use boldfaced uppercase letters to represent vectors, and a pair of subscripts to refer to an individual element within one. For instance, $A_{23}$ is the element in row 2, column 3 of the matrix $\bfA$.

```{note}
Matrix subscripts are always in the order row first, column second. (This is the opposite of Excel, which is just one of myriad reasons that Excel is evil.)
```

As you might suspect, there's a lot more to vectors and matrices than these innocent definitions let on. The consequences of making algebraic rules that bind vectors and matrices to describe linear functions will comprise our brief tour of linear algebra.

## MATLAB

MATLAB stands for "matrix laboratory," and it's a natural place to compute with vectors and matrices. One caution, though: it operates with numbers of finite precision, like a calculator, rather than with exact expressions like Mathematica. Hence things that are supposed to be equal might only be approximately so.

To construct small vectors and matrices, put elements inside square brackets. Spaces separate columns, and semicolons separate rows.

```{code-cell}
x = [ 1 2 3 4 ]
y = [10; 20; 30]
A = [ 1 2 3; -4 -5 -6; pi sqrt(2) exp(1) ]
```

:::{admonition} Mathematical constants
:class: note
The constant $\pi$ is defined automatically as `pi`. The constant `e` is not defined, and expressions like $e^{-2}$ causes an error if you have not previously defined `e`. Instead, use the exponential function `exp`; note that $e=\exp(1)$.
:::

As you can see from this output, MATLAB allows two kinds of vector: a row vector, which has a single row, and a column vector, which has a single column. The distinction doesn't always matter, but when it does, it really does. We are going to make a blanket assumption that serves well most of the time.

```{note}
All vectors are assumed to have a column shape.
```

We can get the dimensions of a vector using `size`. 

```{code-cell}
sizes = [ size(x); size(y); size(A) ]
```

You can see from the above that we can concatenate vectors and matrices inside square brackets. Also:

```{note}
MATLAB makes no distinction between a column vector in $\real^n$ and an $n\times 1$ matrix in $\rmn{n}{1}$.
```

To access individual elements in a vector or matrix, use parentheses. The `end` keyword always stands for the last element in its dimension.

```{code-cell}
x_2 = x(2)
A_31 = A(3,1)
y_last = y(end)
```

The parenthetical syntax also works for assigning values within a vector or matrix.

```{code-cell}
A(2,1) = 1i     % the imaginary unit
```

Note how complex numbers are automatically supported.

<div style="max-width:608px"><div style="position:relative;padding-bottom:66.118421052632%"><iframe id="kaltura_player" src="https://cdnapisec.kaltura.com/p/2358381/sp/235838100/embedIframeJs/uiconf_id/43030021/partner_id/2358381?iframeembed=true&playerId=kaltura_player&entry_id=1_oxt8jaok&flashvars[streamerType]=auto&amp;flashvars[localizationCode]=en&amp;flashvars[leadWithHTML5]=true&amp;flashvars[sideBarContainer.plugin]=true&amp;flashvars[sideBarContainer.position]=left&amp;flashvars[sideBarContainer.clickToClose]=true&amp;flashvars[chapters.plugin]=true&amp;flashvars[chapters.layout]=vertical&amp;flashvars[chapters.thumbnailRotator]=false&amp;flashvars[streamSelector.plugin]=true&amp;flashvars[EmbedPlayer.SpinnerTarget]=videoHolder&amp;flashvars[dualScreen.plugin]=true&amp;flashvars[Kaltura.addCrossoriginToIframe]=true&amp;&wid=1_71et1kf0" width="608" height="402" allowfullscreen webkitallowfullscreen mozAllowFullScreen allow="autoplay *; fullscreen *; encrypted-media *" sandbox="allow-forms allow-same-origin allow-scripts allow-top-navigation allow-pointer-lock allow-popups allow-modals allow-orientation-lock allow-popups-to-escape-sandbox allow-presentation allow-top-navigation-by-user-activation" frameborder="0" title="Kaltura Player" style="position:absolute;top:0;left:0;width:100%;height:100%"></iframe></div></div>
