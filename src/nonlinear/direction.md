---
jupytext:
  cell_metadata_filter: -all
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.12
    jupytext_version: 1.8.2
kernelspec:
  display_name: Matlab
  language: matlab
  name: matlab
---

```{code-cell}
---
tags: ["hide-cell"]
---
% nothing
```

# Direction fields

An autonomous system in two dimensions has the particular form 

\begin{align*}
	\dd{x_1}{t} & = f_1(x_1,x_2), \\
	\dd{x_2}{t} & = f_2(x_1,x_2). \\
\end{align*}

For such a system we can use a simple visualization to suggest solution behavior. For instance, here is a direction field for the linear ODE system

\begin{align*}
\dd{x}{t} & = -y,\\
\dd{y}{t} & = x.
\end{align*}

We will use a custom function `slopefield.m`. 

::::{toggle}
:::{code-block} matlab
function slopefield(varargin)
% SLOPEFIELD Plot a slope field (aka direction field).
%    SLOPEFIELD(F,TLIM,YLIM) plots arrows in the (t,y) plane that represent
%    the slope field of the ODE dydt = F(t,y). The function F must accept
%    both arguments. The vectors TLIM and
%    YLIM define the bounds of the plot in their respective directions.
%
%    SLOPEFIELD(F,G,XLIM,YLIM) plots arrows in the (x,y) plane that
%    represent the slope field of the ODE system 
% 
%       dx/dt = f(x,y),  dy/dt = g(x,y). 
%
%    Functions F and G must accept (x,y) as arguments. The vectors XLIM and
%    YLIM define the bounds of the plot in their respective directions.
%
%    If an additional input argument is present at the end, the direction
%    vectors are all normalized to have unit length, so speed information
%    is taken out of the picture. This might be better when some arrows
%    would otherwise get too small.
%
%    Examples:
%
%       slopefield(@(t,y) y,[0 3],[-1 1])
%
%       slopefield(@(t,y) t^2-y,[0 2],[-1 1])
%
%       f = @(x,y) 3*x - x*y/2;
%       g = @(x,y) -y + x*y/4;
%       slopefield(f,g,[0 10],[0 12])
%
%    See also QUIVER.

% Copyright 2019 by Toby Driscoll. Free for non-commerical use. 

[f,g] = varargin{1:2};
if isnumeric(g)    % y'=f(t,y)
    xlim = g;
    ylim = varargin{3};
    denorm = (nargin > 3);
    drawfield(@(x,y) 1,f,xlim,ylim,denorm)
    xlabel t, ylabel y
    title(['Slope field for y''=', func2str(f)])

else               % x'=f(x,y), y'=g(x,y)
    [xlim,ylim] = varargin{3:4};
    denorm = (nargin > 4);
    drawfield(f,g,xlim,ylim,denorm)
    xlabel x, ylabel y
    title(['Slope field for x''=',func2str(f),', y''=', func2str(g)])
end
end

function drawfield(dxdt,dydt,xlim,ylim,denorm)

% Set up grid in (x,y) plane 
x = linspace(xlim(1),xlim(2),25);
y = linspace(ylim(1),ylim(2),25);
[X,Y] = meshgrid(x,y);

% This is safer than assuming the user vectorizes the inputs.
U = zeros(size(X));  V = U;
for i = 1:numel(X)
    U(i) = dxdt(X(i),Y(i));  V(i) = dydt(X(i),Y(i));
end

if denorm 
    U = U./sqrt(U.^2+V.^2);  V = V./sqrt(U.^2+V.^2);
end

% Make the plot and pretty it up
quiver(X,Y,U,V)
axis tight

end
:::
::::

```{code-cell}
F = @(x,y) -y;   G = @(x,y) x;

slopefield(F,G,[-2 2],[-2 2])
```

Here is a slope field in the first quadrant for the nonlinear system

\begin{align*}
\dd{x}{t} & = 3x - \frac{1}{2} x y,\\
\dd{y}{t} & = \frac{1}{4} x y - y.
\end{align*}

```{code-cell}
F = @(x,y) 3.*x-x.*y/2;
G = @(x,y) -y + x.*y/4;

slopefield(F,G,[0 10],[0 12])
```

## Nonautonomous scalar problems

We can use a simple trick to create direction fields for the nonautonomous scalar problem 

$$
x'=f(t,x)
$$ 

as well. Introducing the variables $u_1=t$ and $u_2=x$, we have 

\begin{align*}
\dd{u_1}{t} & = 1, \\
\dd{u_2}{t} & = f(u_1,u_2),
\end{align*}

which has the form of a two-dimensional autonomous system. 

Here is a direction field for $x'=t-x^2$. Note that the arrows are horizontal along the sideways parabola $t=x^2$. 

```{code-cell}
f = @(t,x) t-x^2;
slopefield(f,[-2 2],[-2 2])
```

Direction fields are useful to get an overall sense of how a small system or scalar problem behaves.