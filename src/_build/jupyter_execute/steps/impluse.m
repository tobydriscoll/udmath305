dxdt = @(t,x) -5*x;      % ODE without the delta
[t1,x1] = ode45(dxdt,[0,2],1);
x2init = 3+x1(end);      % uses the final value for x1
[t2,x2] = ode45(dxdt,[2,5],x2init);

semilogy([t1;t2],[x1;x2])     % stack the time and solution vectors
xlabel('t'), ylabel('x(t)')
title('Impulse forcing')
