---
layout: note
title: "Variation of parameters"
chapter: "Linear systems"
---
* TOC
{:toc}

*(See section 6.6.)*

You now have all you need to find the general solution of $ \mathbf{x}' = \mathbf{A} \mathbf{x}$ with constant matrix $ \mathbf{A}$, in the form of $ \mathbf{x}(t) = \mathbf{X}(t) \mathbf{c}$ for a fundamental matrix $ \mathbf{X}(t)$ (whose columns are independent solutions).

So what should we do with the nonhomogeneous problem $\mathbf{x}' = \mathbf{A} \mathbf{x} + \mathbf{g}(t)$? One answer is to follow our earlier blueprint and use undetermined coefficients. We're going to try a different technique here, called *variation of parameters*{:.def}.

As we have done before, we start with the general solution of the related homogeneous equation $ \mathbf{x}' = \mathbf{A} \mathbf{x}$,

$$ \mathbf{x}(t) = c_1\mathbf{x_1}(t)+ c_2\mathbf{x_2}(t) = \mathbf{X}(t) \mathbf{c}, $$

where $\mathbf{X}$ is a fundamental matrix. Here's the trick: replace the constant vector $\mathbf{c}$ in with a function of $t$, $\mathbf{u}(t)$. That's it! Plug in $ \mathbf{x}(t) = \mathbf{X}(t) \mathbf{u}(t)$ and you get

$$ \mathbf{X}' \mathbf{u} + \mathbf{X} \mathbf{u}' = \mathbf{A} \mathbf{X} \mathbf{u} + \mathbf{g}.$$

Have a look at the $\mathbf{X}'$ term. It's defined elementwise, or columnwise if we want to interpret it that way. So

$$ \mathbf{X}' = \frac{d}{dt} \begin{bmatrix} \mathbf{x}_1 & \mathbf{x}_2 \end{bmatrix} = \begin{bmatrix} \mathbf{x}_1' & \mathbf{x}_2' \end{bmatrix} = \begin{bmatrix} \mathbf{A} \mathbf{x}_1 & \mathbf{A} \mathbf{x}_2 \end{bmatrix} = \mathbf{A} \mathbf{X}.$$

Thus, two of the terms above cancel out, leaving just 

$$ \mathbf{X} \mathbf{u}' = \mathbf{g}, $$

which we can consider a defining property for $ \mathbf{u}$. While this superficially looks like another ODE, in fact the only unknown here is $\mathbf{u}$, and it appears only as $\mathbf{u}'$. So we can solve for it, and then integrate to get $\mathbf{u}$. Analytically, of course,

$$ \mathbf{u}' = \mathbf{X}^{-1} \mathbf{g}, $$

though in practice we might prefer to find $\mathbf{u}'$ by elimination. Completing the formulas, we get 

$$ \mathbf{u}(t) = \mathbf{c} + \int \mathbf{X}^{-1}(t) \mathbf{g}(t)\, dt, $$ 

where $\mathbf{c}$ is a constant vector, and then the general solution

$$ \mathbf{x}(t) = \mathbf{X}(t) \mathbf{u}(t) = \mathbf{X}(t) \mathbf{c} +  \mathbf{X}(t) \left[\int \mathbf{X}^{-1}(t) \mathbf{g}(t)\, dt \right]. $$ 

This has the form of a complementary solution plus particular solution. 

### Example

*(See Example 1 of section 6.6.)*

> Find the general solution of
> $$ \mathbf{x}' = \begin{bmatrix} -3 & 4 \\ -2 & 3 \end{bmatrix} + \begin{bmatrix} \sin(t) \\ t \end{bmatrix}. $$

A spoonful of MATLAB helps the eigenvalues go down.

~~~matlab
>> [V,D] = eig([-3 4;-2 3])
V =
   -0.8944   -0.7071
   -0.4472   -0.7071
D =
    -1     0
     0     1
>> V(:,1)/V(2,1)
ans =
     2
     1
>> V(:,2)/V(1,2)
ans =
     1
     1
~~~

So a fundamental matrix is

$$ \mathbf{X}(t) = \begin{bmatrix} 2 e^{-t} & e^t \\ e^{-t} & e^t \end{bmatrix}$$ 

In the $2\times 2$ case, we may as well write out the inverse:

$$ \mathbf{X}(t)^{-1} = \frac{1}{2-1}   \begin{bmatrix} e^{t} & -e^t \\ -e^{-t} & 2e^{-t} \end{bmatrix}.$$

Now for the integral:

$$ \int \mathbf{X}^{-1}(t) \mathbf{g}(t)\, dt = \int \begin{bmatrix} e^{t} & -e^t \\ -e^{-t} & 2e^{-t} \end{bmatrix} \begin{bmatrix} \sin(t) \\ t \end{bmatrix}\, dt $$ 

$$ = \int \begin{bmatrix} e^{t}\sin(t) - te^t  \\ -e^{-t}\sin(t) + 2te^{-t} \end{bmatrix} \, dt $$ 

$$ = \begin{bmatrix} -\frac{1}{2} e^t \left(2t+\cos\left(t\right)-\sin\left(t\right)-2\right) \\ \frac{1}{2} e^{-t} \left(\cos\left(t\right)+\sin\left(t\right)-4\right) \end{bmatrix}. $$

Hence

$$ \mathbf{x}(t) = \begin{bmatrix} 2 e^{-t} & e^t \\ e^{-t} & e^t \end{bmatrix} \left( \mathbf{c} + \begin{bmatrix} -\frac{1}{2} e^t \left(2t+\cos\left(t\right)-\sin\left(t\right)-2\right) \\ \frac{1}{2} e^{-t} \left(\cos\left(t\right)+\sin\left(t\right)-4\right) \end{bmatrix} \right).$$

Look bub, if you wanted something easy, you should have taken Rocks For Jocks.

## Matrix exponential

With $\mathbf{x}'=\mathbf{A}\mathbf{x}$ and a constant matrix $ \mathbf{A}$, we can express the fundamental matrix in terms of a matrix exponential:

$$ \mathbf{X}(t) = e^{t \mathbf{A}}.$$

The matrix exponential function shares some key properties of the scalar function. In particular,

$$ e^{t \mathbf{A}} e^{s \mathbf{A}} = e^{(t+s) \mathbf{A}}.$$

Because $e^\boldsymbol{0} = \mathbf{I}$, this also means that

$$ \bigl( e^{t \mathbf{A}} \bigr)^{-1} = e^{-t \mathbf{A}}.$$

Thus the VOP formula is equivalent to

$$ \mathbf{x}(t) = \mathbf{X}(t) \mathbf{c} +  \mathbf{X}(t) \left[\int \mathbf{X}^{-1}(t) \mathbf{g}(t)\, dt \right]
= e^{t \mathbf{A}} \mathbf{c} + e^{t \mathbf{A}} \int e^{-t \mathbf{A}} \mathbf{g}(t) \, dt.$$

If we switch to a definite integral and the initial-value problem, we get

$$ \mathbf{x}(t) = e^{t \mathbf{A}} \mathbf{x}(0) +  \int_0^t e^{(t-s) \mathbf{A}} \mathbf{g}(s) \, ds.$$

This formula has an interesting interpretation. The first term is the result of free (unforced) evolution of the initial condition. The integral adds up all contributions from earlier times $s<t$. These take the form of an evolution for time $t-s$ of the forcing at instant $s$.

We had a similar conclusion from Laplace transforms, where we could interpret the generic forcing function as a continuous series of impulses driving the evolution. In fact, the last integral above has the form of a convolution!

Where linearity is concerned, there are no coincidences. 
