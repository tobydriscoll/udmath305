---
layout: note
title: "Linearization"
chapter: "Nonlinear systems"
---
* TOC
{:toc}

*(See section 7.2.)*

Here comes one of the most important moments in the course: **when faced with a nonlinear problem, our first response is to try to linearize it**.


Suppose $\mathbf{x}' = \mathbf{f}(\mathbf{x})$ has a fixed point $ \mathbf{z}$. For concreteness we start with two dimensions. Then if we look at points close by to $ \mathbf{z}$, we have

$$\begin{align}
f(z_1+s_1,z_2+s_2) &= f(z_1,z_2) + s_1 \frac{\partial f}{\partial x}(z_1,z_2) + s_2 \frac{\partial f}{\partial y}(z_1,z_2 ) + HOT, \\
g(z_1+s_1,z_2+s_2)  &= g(z_1,z_2) + s_1 \frac{\partial g}{\partial x}(z_1,z_2) + s_2 \frac{\partial g}{\partial y}(z_1,z_2 ) + HOT.
\end{align}$$

Here "HOT" stands for "higher-order terms," meaning products of $s_1$ and $s_2$. If we keep $s_1$ and $s_2$ small, then these terms may be ignored, and we have

$$\begin{align}
\begin{bmatrix} f(z_1+s_1,z_2+s_2)  \\ g(z_1+s_1,z_2+s_2) \end{bmatrix} \approx
\begin{bmatrix} \frac{\partial f}{\partial x} & \frac{\partial f}{\partial y} \\ \frac{\partial g}{\partial x} & \frac{\partial g}{\partial y} \end{bmatrix}
\begin{bmatrix} s_1 \\ s_2 \end{bmatrix}.
\end{align}$$

The matrix above is called a *Jacobian matrix*. We've suppressed the fact that it should be evaluated at the fixed point, and is therefore constant. 

Now let's define $u_1(t)=x(t)-z_1$, $u_2(t)=y(t)-z_2$. Clearly $u_i'=x_i'$, and

$$\begin{align}
\begin{bmatrix} u_1'(t)   \\ u_2'(t) \end{bmatrix} =
\begin{bmatrix} f(z_1+u_1,z_2+u_2)  \\ g(z_1+u_1,z_2+u_2) \end{bmatrix} \approx 
\begin{bmatrix} \frac{\partial f}{\partial x} & \frac{\partial f}{\partial y} \\ \frac{\partial g}{\partial x} & \frac{\partial g}{\partial y} \end{bmatrix}
\begin{bmatrix} u_1 \\ u_2 \end{bmatrix} = \mathbf{J} \mathbf{u}.
\end{align}$$

We have a homogeneous linear system that governs perturbations to the fixed point. So long as we are "close enough" to the fixed point, the eigenvalues and eigenvectors of $\mathbf{J}$ reveal what is essentially going on.

### Example

> Linearize
> $$ \begin{align}  \frac{dx}{dt} &= 3x-xy/2, \\ \frac{dy}{dt} &= -y+xy/4. \end{align}$$
> at the fixed point $(4,6)$, and describe the character of the fixed point.

We compute (using subscripts for partial derivative notation) the Jacobian matrix,

$$ \mathbf{J}(x,y) = \begin{bmatrix} f_x & f_y  \\ g_x & g_y \end{bmatrix} = \begin{bmatrix} 3-y/2 & -x/2 \\ y/4 & -1+x/4 \end{bmatrix}.$$ 

We evaluate it at the fixed point to get a constant matrix,

$$ \mathbf{J}(4,6) =  \begin{bmatrix} 0 & -2 \\ 3/2 & 0 \end{bmatrix}.$$

The eigenvalues are readily found to be $\pm i\sqrt{3}$, which makes this fixed point a center. This becomes apparent if we zoom in on the slope field:

~~~matlab
f = @(x,y) 3.*x-x.*y/2;
g = @(x,y) -y + x.*y/4;

slopefieldxy(f,g,4+[-.2 .2],6+[-.2 .2])
hold on
plot(4,6,'r*')
axis equal
~~~

---

## Jacobian matrix

It may be easier to use the vector notation than the scalars. If $\mathbf{x}' = \mathbf{f}(\mathbf{x})$, then the $(i,j)$ entry of the Jacobian matrix is

$$\frac{\partial f_i}{\partial x_j}.$$

This works in any number of dimensions. Note that $\mathbf{J}$ is always a square matrix, and (like any good derivative) it depends on $ \mathbf{x}$. You have to evaluate it at the fixed point in order to get a constant matrix.

### Example

> Find and characterize the fixed points of 
> $$ \begin{align}  x_1' &= (4+x_1)(x_2-x_1), \\ x_2' &= (10-x_1)(x_1+x_2). \end{align}$$

From the first component we get $x_1=-4$ or $x_1=x_2$. Plugging into the second component, we get $(-4,4)$, $(10,10)$, and $(0,0)$ as the only possibilities. Now

$$ \mathbf{J} = \begin{bmatrix} x_2 -2x_1 -4 & 4+x_1 \\ -2x_1 -x_2 + 10 & 10-x_1 \end{bmatrix}.$$

* At $(0,0)$: 

$$ \mathbf{J} = \begin{bmatrix}  -4 & 4\\ 10 & 10 \end{bmatrix}.$$ 

The eigenvalues are $-6.4340$ and $12.4340$, so this is a saddle. 

* At $(10,10)$: 

$$ \mathbf{J} = \begin{bmatrix}  -14 & 14\\ -20 & 0 \end{bmatrix}.$$ 

The eigenvalues are $-7 \pm 15.1987i$, so this is a spiral sink.

* At $(-4,4)$: 

$$ \mathbf{J} = \begin{bmatrix}  8 & 0 \\ 14 & 14 \end{bmatrix}.$$ 

The eigenvalues are 8 and 14, so this is a nodal source.

~~~matlab
f = @(x,y) (4+x).*(y-x);
g = @(x,y) (10-x).*(y+x);

figure
slopefieldxy(f,g,[-7 13],[-2 12])
hold on
plot([0 10 -4],[0 10 4],'r*')
axis equal

figure
slopefieldxy(f,g,0+[-.2 .2],0+[-.2 .2])
hold on
plot(0,0,'r*')
axis equal

figure
slopefieldxy(f,g,10+[-.1 .1],10+[-.1 .1])
hold on
plot(10,10,'r*')
axis equal

figure
slopefieldxy(f,g,-4+[-.1 .1],4+[-.1 .1])
hold on
plot(-4,4,'r*')
axis equal

%%
figure
slopefieldxy(f,g,[-10 20],[-5 25])
hold on
plot([0 10 -4],[0 10 4],'r*')
axis equal

N = chebop(@(t,x,y) [diff(x)-f(x,y); diff(y)-g(x,y)],[0 0.5],[],[]);
[X,Y] = ndgrid(-5:4:15,-5:4:15);
for i = 1:numel(X)
    N.lbc = [ X(i); Y(i) ] + 0.5*randn(2,1);
    [x,y] = N\0; 
    arrowplot(x,y,'color','b')
    axis([-10 16 -4 20]), drawnow
end
~~~





