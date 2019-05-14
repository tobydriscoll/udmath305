
f = @(x) x.^2.*(pi-x);  % initial condition
N = 50;
% compute the Fourier sine coeffs
for k = 1:N
    c(k) = (2/pi)*integral( @(x) f(x).*sin(k*x),0,pi);
end

%%
% check the reproduction of the initial f
clf
x = linspace(0,pi,601)';
fplot(f,[0 pi],'k','linewid',2), hold on
s = 0;
for k = 1:N
    s = s + c(k)*sin(k*x);
end  
cla,plot(x,s-f(x))

%%
cla
fplot(f,[0 pi],'k','linewid',2), hold on
title('Initial condition')
pause

% step through time
for t = 0.025:0.025:2
    s = 0;
    for k = 1:N
        s = s + c(k)*exp(-k^2*t)*sin(k*x);
    end
    h = plot(x,s,'color',[.8 .1 .1]);
    title(sprintf('t = %.3f',t))
    pause
    delete(h)
end
