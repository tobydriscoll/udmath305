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

```{glossary}
linear
  Type of function or operator that satisfies two basic properties.

linear combination
  Simultaneous multiplication of vectors by coefficients, followed by summation to a single vector.

matrix
   Array of numbers obeying certain algebraic rules.

vector
   Finite collection of numbers obeying certain algebraic rules.
```