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
  display_name: Matlab
  language: matlab
  name: matlab
---
# Integrating factor

:::{attention}
This is an optional section.
:::

There's a well-known alternate way to derive the general solution of $\opA[x]=f$. We lead with an example.

::::{admonition} Example
:class: tip
Consider $x'=4x+8t$, which we rewrite as $x'-4x=8t$. We multiply both sides of this equation by $e^{-4t}$ to get

$$
e^{-4t}x' - 4e^{-4t}x = 8te^{-4t}.
$$

The reason for doing this is that we can now apply the product rule for derivatives *in reverse* on the left side of the equation:

$$
\dd{}{t} \bigl[ e^{-4t} x(t) \bigr] = 8te^{-4t}.
$$

Now we integrate both sides to get

$$
e^{-4t} x(t) = \int 8te^{-4t}\, dt = -\frac{1}{2} (4t+1)e^{-4t} + c_1,
$$

after an integration by parts. Solving for $x$ leads to

$$
x(t) = c_1 e^{4t} - \frac{1}{2} (4t+1).
$$

This is the [same result we got before](example-firstlin-nonhomog) for this problem.
::::

Clearly the secret sauce in the example above is choosing a function to multiply the equation so that the left side is a perfect product rule. The recipe is called an {term}`integrating factor`.

````{proof:formula} Integrating factor
$$
\mu(t) = \exp \left[ \int -a(t)\, dt \right]
$$
````

The reason this recipe works is that, by the chain rule and fundamental theorem of calculus,

$$
\mu'(t) = \mu(t) \cdot \dd{}{t} \left[ \int -a(t)\, dt \right] = -a(t) \mu(t).
$$

Therefore, we transform the original problem as follows:

\begin{align*}
\mu  x' - a \mu x &= \mu f, \\ 
\mu  x' + \mu' x &= \mu f, \\ 
\dd{}{t} \bigl[ \mu(t) x(t) \bigr] &= \mu(t) f(t), \\ 
\mu(t) x(t) &= \int \mu(t) f(t)\, dt.
\end{align*}

In this setup, you must include the indefinite integration constant $c_1$ before you divide the last line by $\mu(t)$ to get the answer.

Integration by parts is not much different from applying variation of parameters. In particular, both methods lead to the same two integrals, which are the hardest part to handle. You might find that the integrating factor involves less rote memorization, but the homogeneous/particular method is what we extend and use in future chapters.
