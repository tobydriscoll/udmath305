---
jupytext:
  cell_metadata_filter: -all
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: '0.12'
    jupytext_version: 1.5.1
kernelspec:
  display_name: MATLAB
  language: matlab
  name: matlab
---
# RREF

It's time to get more formal and precise about row elimination. We separate it into downward and upward phases.  In what follows we use the term {term}`leading nonzero` to mean the first (i.e., leftmost) entry of a row that is not zero.

(definition-linalg-phase1)=

````{proof:algorithm}  Row elimination downward phase
1. Set $i=1$.
2. Find the leftmost leading nonzero in rows $i$ and below. The column of this leading nonzero is known as the {term}`pivot column`. If no such column exists, stop.
3. As necessary, swap rows and/or multiply a row by a constant to put a 1 in the pivot column of row $i$.
4. Add multiples of row $i$ to the rows below it in order to put zeros into the pivot column.
5. Increment $i$ and return to step 2.
````

At the end of the downward phase, the augmented matrix has a pretty simple form. However, it's not the cleanest form to work with theoretically, so we continue.

(definition-linalg-phase2)=

````{proof:algorithm} Row elimination upward phase
1. Set $i=m$ (the number of equations).
2. Use multiples of row $i$ to put zeros above the leading 1 in that row.
3. Decrement $i$. If $i> 1$, return to step 2.
````

At the end of the upward phase, the matrix is in a form that we define formally here.

```{index}
RREF (row reduced echelon form)
```

```{index}
pivot column
```

```{index}
free column
```

(definition-linalg-RREF)=

````{proof:definition} RREF

A matrix is in {term}`RREF` (reduced row echelon form) if it meets all of these requirements:

1. Any rows of all zeros appear below all nonzero rows.
2. The leading nonzero of any row is a one.
3. Every leading 1 that is lower than another leading 1 is also to the right of it.
4. Every leading 1 is the only nonzero in its column.

The columns that have leading ones are called {term}`pivot columns`. The other columns are called {term}`free columns`.
````

Here is an example, using MATLAB to do the row operations for us. The linear system is characterized by

$$
\bfA = \begin{bmatrix}
2 & 0 & 4 & 3 \\ -2 & 0 & 2 & -13 \\ -4 & 5 & -7 & -10 \\ 1 & 15 & 2 & -4.5
\end{bmatrix}, \qquad 
\bfb = \begin{bmatrix}
4\\40\\9\\29
\end{bmatrix}.
$$

```{code-cell}
A = [
     2    0    4    3 
    -2    0    2  -13
    -4    5   -7  -10 
     1   15    2   -4.5
    ];
b = [ 4; 40; 9; 29 ];

S = [A, b]
```

We start at the top, working downward and rightward. In the first row, the leading nonzero occurs in column 1, which is the pivot column for this row. We normalize this row so that the leading nonzero is a 1.

```{code-cell}
S(1,:) = S(1,:)/S(1,1)
```

Now multiples of row 1 are added to the rows below it in order to put zeros in the first column.

```{code-cell}
S(2,:) = S(2,:) - S(2,1)*S(1,:);
S(3,:) = S(3,:) - S(3,1)*S(1,:);
S(4,:) = S(4,:) - S(4,1)*S(1,:)
```

Looking at rows 2 to 4, we see that the leftmost nonzero occurs in column 2. Since row 2 has a zero there, we swap rows 2 and 3 to bring a nonzero up.

```{code-cell}
S(2:3,:) = S([3 2],:)
```

Now we normalize row 2 so that the leading nonzero is a 1.

```{code-cell}
S(2,:) = S(2,:)/S(2,2)
```

Multiples of row 2 are now used to put zeros below it in the pivot column.

```{code-cell}
S(3,:) = S(3,:) - S(3,2)*S(2,:);
S(4,:) = S(4,:) - S(4,2)*S(2,:)
```

Rows 3 and 4 have a pivot in column 3, and we only need to normalize row 3 to make it 1. Then we subtract a multiple of row 3 from row 4 to put a zero beneath it.

```{code-cell}
S(3,:) = S(3,:)/S(3,3);
S(4,:) = S(4,:) - S(4,3)*S(3,:)
```

We complete the downward phase by normalizing row 4 to get a leading 1.

```{code-cell}
S(4,:) = S(4,:)/S(4,4)
```

Now we turn around for the upward phase. The leading 1 in row 4 needs to have zeros above it. We accomplish that by subtracting multiples of row 4 from the others.

```{code-cell}
S(3,:) = S(3,:) - S(3,4)*S(4,:);
S(2,:) = S(2,:) - S(2,4)*S(4,:);
S(1,:) = S(1,:) - S(1,4)*S(4,:)
```

We move up to row 3 and use multiples of it to put zeros above its leading 1.

```{code-cell}
S(2,:) = S(2,:) - S(2,3)*S(3,:);
S(1,:) = S(1,:) - S(1,3)*S(3,:)
```

The last move is to use a multiple of row 2 to put a zero above its leading 1. As it has played out in this example, this line of code changes nothing because the position was already zero.

```{code-cell}
S(1,:) = S(1,:) - S(1,2)*S(2,:);
```

This matrix is in RREF. We interpret it as the trivial linear system

\begin{align*}
x_1 &= -3,\\ x_2 &= 1,\\ x_3 &= 4, \\ x_4 &= -2.
\end{align*}

```{warning}
MATLAB has a command `rref` to put a matrix in RREF. However, it's not ideal, because MATLAB uses floating point and cannot always produce exact zeros. You can instead [try Wolfram Alpha]("https://www.wolframalpha.com/input/?i=rref%20%7B%7B1%2C2%2C3%7D%2C%7B4%2C5%2C6%7D%2C%7B7%2C8%2C9%7D%7D") for finding the exact RREF.
```

## Solution from the RREF

The RREF of an augmented matrix represents a linear system that we can solve by inspection:

1. Ignore all zero rows.
2. If a leading one occurs in the last column, the system is inconsistent.
3. Otherwise, each variable associated with a free column is assigned to a free parameter (e.g., $s$, $t$, etc.).
4. Use the pivot columns to solve for their corresponding variables in terms of the free parameters.

::::{admonition} Example
:class: tip
A linear system has an augmented matrix equivalent to the RREF

$$
\begin{bmatrix}
0 & 1 & -3 & 0 & 2 \\
0 & 0 & 0  & 1 & -4 \\
0 & 0 & 0  & 0 & 0  \\
0 & 0 & 0  & 0 & 0  
\end{bmatrix}.
$$

Find all solutions to the linear system.

:::{dropdown} Solution
The last two rows have no information and can be ignored. Columns 2 and 4 are pivot columns. We give variables from the other columns arbitrary values, $x_1=s$ and $x_3=t$. The pivot variables are solved in terms of these to get $x_2=2+3t$ and $x_4=-4$. All solutions are expressed as the vector

$$
\bfx = \begin{bmatrix}
s \\ 2+3t \\ t \\ -4
\end{bmatrix}, \qquad s,t\in \real.
$$
:::
::::

::::{admonition} Example
:class: tip
A linear system has an augmented matrix equivalent to the RREF

$$
\begin{bmatrix}
1 & 0 & -4 & 0 & 0 \\
0 & 1 & 1  & 0 & 0 \\
0 & 0 & 0  & 1 & 0  \\
0 & 0 & 0  & 0 & 1
\end{bmatrix}.
$$

Find all solutions to the linear system.

:::{dropdown} Solution
Look at the last row of the system. It expresses the equation $0=1$, which is impossible to satisfy. Thus the system is inconsistent.
:::
::::

There are only three possible outcomes for a linear system, all deducible from the RREF of the augmented matrix:

1. There is a leading 1 in the last column, in which case there are no solutions.
2. There are fewer pivot columns than variables, in which case there are infinitely many solutions.
3. There is a unique solution.

<div style="max-width:608px"><div style="position:relative;padding-bottom:66.118421052632%"><iframe id="kaltura_player" src="https://cdnapisec.kaltura.com/p/2358381/sp/235838100/embedIframeJs/uiconf_id/43030021/partner_id/2358381?iframeembed=true&playerId=kaltura_player&entry_id=1_s77dhjjx&flashvars[streamerType]=auto&amp;flashvars[localizationCode]=en&amp;flashvars[leadWithHTML5]=true&amp;flashvars[sideBarContainer.plugin]=true&amp;flashvars[sideBarContainer.position]=left&amp;flashvars[sideBarContainer.clickToClose]=true&amp;flashvars[chapters.plugin]=true&amp;flashvars[chapters.layout]=vertical&amp;flashvars[chapters.thumbnailRotator]=false&amp;flashvars[streamSelector.plugin]=true&amp;flashvars[EmbedPlayer.SpinnerTarget]=videoHolder&amp;flashvars[dualScreen.plugin]=true&amp;flashvars[Kaltura.addCrossoriginToIframe]=true&amp;&wid=1_7n8e1h1a" width="608" height="402" allowfullscreen webkitallowfullscreen mozAllowFullScreen allow="autoplay *; fullscreen *; encrypted-media *" sandbox="allow-forms allow-same-origin allow-scripts allow-top-navigation allow-pointer-lock allow-popups allow-modals allow-orientation-lock allow-popups-to-escape-sandbox allow-presentation allow-top-navigation-by-user-activation" frameborder="0" title="Kaltura Player" style="position:absolute;top:0;left:0;width:100%;height:100%"></iframe></div></div>
