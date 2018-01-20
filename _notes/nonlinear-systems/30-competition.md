---
layout: note
title: "Competition"
chapter: "Nonlinear systems"
---
* TOC
{:toc}

*(See section 7.3.)*

Suppose two species would, on their own, experience logistic growth patterns:

$$\begin{align}
\frac{dx}{dt} &= x(r_1-\sigma_1 x), \\
\frac{dy}{dt} &= y(r_2-\sigma_2 y).
\end{align}$$

But now we throw them into an arena and let them compete for food. We expect the rates of chance encounters to be proportional to $xy$, and each encounter lessens the chance of getting food. We can express this in the model

$$\begin{align}
\frac{dx}{dt} &= x(r_1-\sigma_1 x -\alpha_1 y), \\
\frac{dy}{dt} &= y(r_2-\sigma_2 y - \alpha_2 x).
\end{align}$$

As usual, all parameters are positive. 

What effect can we expect this competition to have? For reference, we write out the Jacobian matrix:

$$ \mathbf{J} = \begin{bmatrix} r_1 -2\sigma_1 x -\alpha_1 y & -\alpha_1 x \\ -\alpha_2 y & r_2 - 2 \sigma_2 y - \alpha_2 x \end{bmatrix}.$$ 

There is a fixed point at $(0,0)$. Is it stable? 

$$ \mathbf{J}(0,0) = \begin{bmatrix} r_1 & 0 \\ 0 & r_2 \end{bmatrix}. $$

Both eigenvalues are positive, so the origin is a source. (If it were a sink, we'd expect a lot of extinctions.)

There are two fixed points where only one species lives: $(r_1/\sigma_1,0)$ and $(0,r_2/\sigma_2)$. 

$$ \mathbf{J}(r_1/\sigma_1,0) = \begin{bmatrix} -r_1 & -\alpha_1 r_1/\sigma_1 \\ 0 & r_2 - \alpha_2 r_1/\sigma_1\end{bmatrix}. $$

Here's a good thing to know: **the eigenvalues of a triangular matrix are the diagonal entries.** (This is true for all matrix sizes.) So we definitely have one negative eigenvalue. If $r_2 < \alpha_2 r_1/\sigma_1$, then the other eigenvalue is negative, too, and this becomes a sink that attracts solutions. Otherwise, it's a saddle and we are not likely to see this solution in practice.

We can play a similar game with the other single-species fixed point and get a sink if $r_1 < \alpha_1 r_2/\sigma_2$, and a saddle otherwise.

## Coexistence

![coexist](coexist.jpg)

The really interesting case is when the species can coexist:

$$\begin{align}
r_1 &= \sigma_1 x  +\alpha_1 y, \\
r_2 &= \sigma_2 y + \alpha_2 x.
\end{align}$$

This is a linear system that is readily solved for the fixed point $(x_0,y_0)$.

$$ \begin{bmatrix} x_0  \\ y_0 \end{bmatrix} = \frac{1}{\sigma_1\sigma_2 - \alpha_1\alpha_2} \begin{bmatrix} \sigma_2 & -\alpha_1 \\ -\alpha_2 & \sigma_1 \end{bmatrix} 
\begin{bmatrix} r_1  \\ r_2 \end{bmatrix} =  \frac{1}{\sigma_1\sigma_2 - \alpha_1\alpha_2} \begin{bmatrix} r_1\sigma_2-r_2\alpha_1  \\ r_2\sigma_1 - r_1\alpha_2\end{bmatrix}.$$

We want positive populations, so we are interested in when $(x_0,y_0)$ is in the first quadrant. There are two cases to consider:

* If $\alpha_1\alpha_2 < \sigma_1 \sigma_2$, then we need $ r_1\sigma_2-r_2\alpha_1>0$ and $ r_2\sigma_1 - r_1\alpha_2>0$. These are exactly the conditions we have above that make the one-species solutions be saddle points.
* If $\alpha_1\alpha_2 > \sigma_1 \sigma_2$, then the opposite conditions must hold, and the one-species solutions must be sinks. 

Conversely, if exactly one of the one-species solutions is a sink, then there is no fixed point inside the first quadrant. We should expect the stable one-species solution to attract everything.

Supposing that $(x_0,y_0)$ does exist, we need to consider its stability. Fortunately, the Jacobian simplifies a bit:

$$ \mathbf{J}(x_0,y_0) = \begin{bmatrix} -\sigma_1 x_0 & -\alpha_1 x_0 \\ -\alpha_2 y_0  & -\sigma_2y_0  \end{bmatrix}. $$

Here's another couple of nifty facts:

* The product of the eigenvalues equals the determinant of the matrix.
* The sum of the eigenvalues equals the *trace* of the matrix (sum of its diagonal entries).

Assuming $(x_0,y_0)$ is in the first quadrant, we can say that $\lambda_1+\lambda_2=-(\sigma_1x_0+\sigma_2y_0)<0$, so at least one eigenvalue has negative real part. Also  $\lambda_1\lambda_2 = x_0y_0(\sigma_1\sigma_2 - \alpha_1\alpha_2)$. As above, the sign of $\sigma_1\sigma_2 - \alpha_1\alpha_2$  is crucial.

* If $\alpha_1\alpha_2 < \sigma_1 \sigma_2$ (so the one-species points are saddles), then $\lambda_1\lambda_2$ is positive, so both eigenvalues must have negative real part--a sink.
*  If $\alpha_1\alpha_2 > \sigma_1 \sigma_2$ (so the one-species points are sinks), then $\lambda_1\lambda_2<0$, so the eigenvalues are real and of different signs--a saddle.

### Case study 1

Different 1-species point types, no positive coexistence. I call this result "natural selection."

~~~matlab
r = [1 0.2];
sigma = [0.4 0.6];
alpha = [0.1 0.1];

f = @(x,y) x.*(r(1)-sigma(1)*x-alpha(1)*y);
g = @(x,y) y.*(r(2)-sigma(2)*y-alpha(2)*x);

% three fixed points
xwin = r(1)/sigma(1)
ywin = r(2)/sigma(2)
coex = [ sigma(1) alpha(1); alpha(2) sigma(2) ] \ r(:)

clf
slopefieldxy(f,g,[0 3],[0 1])
hold on
plot(xwin,0,'r*')
plot(0,ywin,'r*')
axis equal

%%
J = @(x,y) [ r(1)-2*sigma(1)*x-alpha(1)*y  -alpha(1)*x; 
    -alpha(2)*y  r(2) - 2*sigma(2)*y - alpha(2)*x ];

xwin_eig = eig(J(xwin,0))
ywin_eig = eig(J(0,ywin))

%%

N = chebop(@(t,x,y) [diff(x)-f(x,y); diff(y)-g(x,y)],[0 16],[],[]);
[X,Y] = ndgrid(0.3:.5:6,0.2:0.5:4);
for i = 1:numel(X)
    N.lbc = [ X(i); Y(i) ];
    [x,y] = N\0; 
    arrowplot(x,y,'color','b')
    axis([0 6 0 4]), drawnow
end
~~~


### Case study 2

Saddles at the 1-species points, sink at coexistence. This demonstrates inevitable coexistence.

~~~matlab
r = [0.2 0.4];
sigma = [0.2 0.6];
alpha = [0.1 0.1];

f = @(x,y) x.*(r(1)-sigma(1)*x-alpha(1)*y);
g = @(x,y) y.*(r(2)-sigma(2)*y-alpha(2)*x);

% three fixed points
xwin = r(1)/sigma(1)
ywin = r(2)/sigma(2)
coex = [ sigma(1) alpha(1); alpha(2) sigma(2) ] \ r(:)

clf
slopefieldxy(f,g,[0 1],[0 1])
hold on
plot(coex(1),coex(2),'r*')
plot(xwin,0,'r*')
plot(0,ywin,'r*')
axis equal

%%
J = @(x,y) [ r(1)-2*sigma(1)*x-alpha(1)*y  -alpha(1)*x; 
    -alpha(2)*y  r(2) - 2*sigma(2)*y - alpha(2)*x ];

xwin_eig = eig(J(xwin,0))
ywin_eig = eig(J(0,ywin))
coex_eig = eig(J(coex(1),coex(2)))

%%

N = chebop(@(t,x,y) [diff(x)-f(x,y); diff(y)-g(x,y)],[0 6],[],[]);
[X,Y] = ndgrid(0.1:0.2:1,0.1:0.2:1);
for i = 1:numel(X)
    N.lbc = [ X(i); Y(i) ];
    [x,y] = N\0; 
    arrowplot(x,y,'color','b')
    axis([0 1 0 1]), drawnow
end
~~~

### Case study 3

Sinks at the 1-species points, saddle at coexistence. I call this "winner takes all." 

~~~matlab
r = [0.2 0.4];
sigma = [0.04 0.1];
alpha = [0.1 0.1];

f = @(x,y) x.*(r(1)-sigma(1)*x-alpha(1)*y);
g = @(x,y) y.*(r(2)-sigma(2)*y-alpha(2)*x);

% three fixed points
xwin = r(1)/sigma(1)
ywin = r(2)/sigma(2)
coex = [ sigma(1) alpha(1); alpha(2) sigma(2) ] \ r(:)

clf
slopefieldxy(f,g,[0 6],[0 5])
hold on
plot(coex(1),coex(2),'r*')
plot(xwin,0,'r*')
plot(0,ywin,'r*')
axis equal

%%
J = @(x,y) [ r(1)-2*sigma(1)*x-alpha(1)*y  -alpha(1)*x; 
    -alpha(2)*y  r(2) - 2*sigma(2)*y - alpha(2)*x ];

xwin_eig = eig(J(xwin,0))
ywin_eig = eig(J(0,ywin))
coex_eig = eig(J(coex(1),coex(2)))

%%

N = chebop(@(t,x,y) [diff(x)-f(x,y); diff(y)-g(x,y)],[0 16],[],[]);
[X,Y] = ndgrid(0.3:.5:6,0.2:0.5:4);
for i = 1:numel(X)
    N.lbc = [ X(i); Y(i) ];
    [x,y] = N\0; 
    arrowplot(x,y,'color','b')
    axis([0 6 0 4]), drawnow
end
~~~

