---
layout: note
title: "Variation of parameters"
chapter: "Linear systems"
---
* TOC
{:toc}

*(See section 6.6.)*

You now have all you need to find the general solution of $ \mathbf{x}' = \mathbf{A} \mathbf{x}$ with constant matrix $ \mathbf{A}$, in the form of $ \mathbf{x}(t) = \mathbf{X}(t) \mathbf{c}$ for a fundamental matrix $ \mathbf{X}(t)$ (whose columns are independent solutions).

So what should we do with the nonhomogeneous problem $\mathbf{x}' = \mathbf{A} \mathbf{x} + \mathbf{g}(t)$? One answer is to follow our earlier blueprint and use undetermined coefficients. We're going to try a different trick here, called *variation of parameters*{:.def}.

Here's the trick: instead of a constant vector $\mathbf{c}$ in the general solution, make it a function $\mathbf{u}(t)$. That's it! Plug in $ \mathbf{x}(t) = \mathbf{X}(t) \mathbf{u}(t)$ and you get

$$ \mathbf{X}' \mathbf{u} + \mathbf{X} \mathbf{u}' = \mathbf{A} \mathbf{X} \mathbf{u} + \mathbf{g}.$$

By construction, $ \mathbf{X}' = \mathbf{A} \mathbf{X}$ (look at it columnwise, since each column of $\mathbf{X}$ is a solution). So the game is to solve

$$ \mathbf{X} \mathbf{u}' = \mathbf{g} $$

for $ \mathbf{u}$. Analytically,

$$ \mathbf{u}(t) = \mathbf{c} + \int \mathbf{X}^{-1}(t) \mathbf{g}(t)\, dt, $$ 

where $\mathbf{c}$ is a constant vector. Then our general solution is

$$ \mathbf{X}(t) \mathbf{u}(t) = \mathbf{X}(t) \mathbf{c} +  \mathbf{X}(t) \left[\int \mathbf{X}^{-1}(t) \mathbf{g}(t)\, dt \right]. $$ 

This has the form of a complementary solution plus particular solution. Of course, to apply this formula you get to do two of your favorite things: invert a matrix and integrate. 

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

Write out the inverse:

$$ \mathbf{X}(t)^{-1} = \frac{1}{2-1}   \begin{bmatrix} e^{t} & -e^t \\ -e^{-t} & 2e^{-t} \end{bmatrix}.$$

Now for the integral:

$$ \int \mathbf{X}^{-1}(t) \mathbf{g}(t)\, dt = \int \begin{bmatrix} e^{t} & -e^t \\ -e^{-t} & 2e^{-t} \end{bmatrix} \begin{bmatrix} \sin(t) \\ t \end{bmatrix}\, dt $$ 

$$ = \int \begin{bmatrix} e^{t}\sin(t) - te^t  \\ -e^{-t}\sin(t) + 2te^{-t} \end{bmatrix} \, dt $$ 

$$ = \begin{bmatrix} -\frac{1}{2} e^t \left(2t+\cos\left(t\right)-\sin\left(t\right)-2\right) \\ \frac{1}{2} e^{-t} \left(\cos\left(t\right)+\sin\left(t\right)-4\right) \end{bmatrix}. $$

Hence

$$ \mathbf{x}(t) = \begin{bmatrix} e^{t} & -e^t \\ -e^{-t} & 2e^{-t} \end{bmatrix} \left( \mathbf{c} + \begin{bmatrix} -\frac{1}{2} e^t \left(2t+\cos\left(t\right)-\sin\left(t\right)-2\right) \\ \frac{1}{2} e^{-t} \left(\cos\left(t\right)+\sin\left(t\right)-4\right) \end{bmatrix} \right).$$

Look bub, if you wanted something easy, you should have taken Rocks For Jocks.
