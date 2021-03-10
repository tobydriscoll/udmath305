# Variation of parameters

In the forced problem $\mathbf{x}'=\mathbf{A}\mathbf{x}+\bff(t)$, the first step is to find a homogeneous solution $\mathbf{x}_h$ in the form $\mathbf{X}(t)\mathbf{c}$ for a fundamental matrix $\mathbf{X}(t)$ and constant vector $\mathbf{c}$. To finish the problem, we have to find a particular solution of the forced equation. We can use the same technique of variation of parameters as in {ref}`../first_linear/variation_parameters`. 

We look for a solution in the form

$$
\mathbf{x}_p(t) = \mathbf{X}(t)\mathbf{k}(t)
$$

and substitute into the ODE to get

$$
\mathbf{X}'\mathbf{k} + \mathbf{X}\mathbf{k}' = \mathbf{A} (\mathbf{X}\mathbf{k}) + \mathbf{f}.
$$

Since $\mathbf{X}$ is a fundamental matrix, it satisfies $\mathbf{X}'=\mathbf{A}\mathbf{X}$. So the equation above becomes simply $\mathbf{X}\mathbf{k}' = \mathbf{f}$, or 

$$
\mathbf{k}(t) = \int [\mathbf{X}(t)]^{-1} \mathbf{f}(t)\, dt.
$$

That is,

$$
\mathbf{x}_p(t) = \mathbf{X}(t) \int [\mathbf{X}(t)]^{-1} \mathbf{f}(t)\, dt.
$$


::::{admonition} Example
:class: tip

The matrix 

:::{math}
\mathbf{A} = \twomat{1}{-1}{5}{-3}
:::

has eigenvalues $-1 \pm i$ and eigenvectors $\twovec{1}{2\mp i}$. Find a particular solution of $\mathbf{x}'=\mathbf{A}\mathbf{x}+\twovec{0}{1}$.

:::{dropdown} Solution

In the preceding section we computed

$$
e^{t \mathbf{A}} = e^{-t} \,\twomat{\cos(t)+2\sin(t)}{-\sin(t)}{5\sin(t)}{\cos(t)-2\sin(t)}.
$$

This is a fundamental matrix whose inverse is easy to get:

$$
e^{-t \mathbf{A}} = e^{t}\, \twomat{\cos(t)-2\sin(t)}{\sin(t)}{-5\sin(t)}{\cos(t)+2\sin(t)}.
$$

For the VoP formula, we need to integrate $\mathbf{X}(t)^{-1} \bfx_0$, or

$$
e^{-t \mathbf{A}} \twovec{0}{1} = \twovec{e^{t}\sin(t)}{e^{t}\cos(t)+2e^{t}\sin(t)}.
$$

Thus,

\begin{align*}
\bfx_p(t) &= e^{-t} \,\twomat{\cos(t)+2\sin(t)}{-\sin(t)}{5\sin(t)}{\cos(t)-2\sin(t)}
\twovec{\int e^{t}\sin(t)\, dt}{\int [e^{t}\cos(t)+2e^{t}\sin(t) ]\, dt}.
\end{align*}

Let's not punish ourselves with the rest of the algebra.
:::
::::

## IVP formula

It is interesting to update the IVP formulas we derived in the scalar linear case. For the general case of 

$$
\bfx' = \bfA(t)\bfx + \bff(t), \quad \bfx(0)=\bfx_0,
$$

we need any fundamental matrix $\bfX(t)$. A particular solution that is zero at $t=0$ is given by the definite integral

$$
\bfx_p(t) = \bfX(t) \int_0^t \bfX(s)^{-1} \bff(s)\, d s.
$$

Then we add homogeneous and particular solutions to get

$$
\bfx(t) = \bfX(t) \bfX(0)^{-1} \mathbf{x}_0 + \bfX(t) \int_0^t \bfX(s)^{-1} \bff(s)\, d s.
$$

For a constant coefficient matrix, the matrix exponential is the most convenient fundamental matrix. In that case,

$$
\bfx(t) = e^{t\bfA} \mathbf{x}_0 + \int_0^t  e^{(t-s)\bfA} \bff(s)\, d s.
$$

For all its complications, this yields to the same interpretation as the scalar case: a combination of the homogeneous (i.e. free) response to the initial value, plus all the contributions obtained by propagation of the forcing function at each earlier moment.
