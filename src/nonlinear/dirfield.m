function dirfield(varargin)
% DIRFIELD Plot a direction field.
%    DIRFIELD(F,TLIM,XLIM) plots arrows in the (t,x) plane that represent
%    the slope field of the ODE dydt = F(t,y). The function F must accept
%    both arguments. The vectors TLIM and XLIM define the bounds of the 
%    plot in their respective directions.
%
%    DIRFIELD(F,G,XLIM,YLIM) plots arrows in the (x,y) plane that
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
%       dirfield(@(t,y) y,[0 3],[-1 1])
%
%       dirfield(@(t,y) t^2-y,[0 2],[-1 1])
%
%       f = @(x,y) 3*x - x*y/2;
%       g = @(x,y) -y + x*y/4;
%       dirfield(f,g,[0 10],[0 12])
%
%    See also QUIVER.

% Copyright 2021 by Toby Driscoll. Free for non-commercial use. 

[f,g] = varargin{1:2};
if isnumeric(g)    % y'=f(t,y)
    xlim = g;
    ylim = varargin{3};
    denorm = (nargin > 3);
    drawfield(@(x,y) 1,f,xlim,ylim,denorm)
    xlabel t, ylabel x
    title(['Direction field for x''=', func2str(f)])

else               % x'=f(x,y), y'=g(x,y)
    [xlim,ylim] = varargin{3:4};
    denorm = (nargin > 4);
    drawfield(f,g,xlim,ylim,denorm)
    xlabel x, ylabel y
    title(['Direction field for x''=',func2str(f),', y''=', func2str(g)])
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
