F = @(t,x) sin(t)*x;
t = linspace(0,5,500);
[t,x] = ode45(F,t,1);
plot(t,x)
xlabel('t'), ylabel('x(t)')
title('Solution of a linear problem')
