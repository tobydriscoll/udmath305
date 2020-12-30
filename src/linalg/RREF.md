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

```{index}
leading nonzero
```

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
1. The leading nonzero of any row is a one.
1. Every leading one is the only nonzero in its column.

The columns that have leading ones are called {term}`pivot columns`. The other columns are called {term}`free columns`.
````

```{warning}
MATLAB has a command <c>rref</c> to put a matrix in RREF. However, it's not ideal, because MATLAB uses floating point and cannot always produce exact zeros. You can instead <url href="https://www.wolframalpha.com/input/?i=rref%20%7B%7B1%2C2%2C3%7D%2C%7B4%2C5%2C6%7D%2C%7B7%2C8%2C9%7D%7D">try Wolfram Alpha</url> for finding the RREF.
```

## Solution from the RREF

The RREF of an augmented matrix represents a linear system that we can solve by inspection:

1. Ignore all zero rows.
2. If a leading one occurs in the last column, the system is inconsistent.
3. Otherwise, each variable associated with a free column is assigned to a free parameter (e.g., $s$, $t$, etc.).
4. Use the pivot columns to solve for their corresponding variables in terms of the free parameters.

TODO: More examples
