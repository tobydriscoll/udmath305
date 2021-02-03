restoredefaultpath
set(0,'defaultlinelinewidth',1)
set(0,'defaultaxesfontsize',6)

%plot -s 800,400 -r 160 -f png

a = 1.25;
for C = [-1 -0.67 -0.33 0 0.33 0.67 1]
    fplot(@(t) C*exp(a*t),[1,4])
    hold on
end

plot(3,20,'k.','markersize',11)
fplot(@(t) 20*exp(a*(t-3)),[1,4],'k','linew',1.5)
ylim([-60 60])
xlabel('t'), ylabel('x')
title('Picking the solution with x(3)=20')

f = @(t,x) 2*x;
t = linspace(1,5,300);
[t,x] = ode45(f,t,3);
clf
plot(t,x)
title('Constant growth rate')
xlabel('t'), ylabel('x')

semilogy(t,x)
title('Constant growth rate (log scale)')
xlabel('t'), ylabel('x')

f = @(t,x) 2*t*x;
t = linspace(0,5,300);
[t,x] = ode45(f,t,1);
clf
semilogy(t,x)
title('Growing growth rate')
xlabel('t'), ylabel('x')

f = @(t,x) x^2;
t = linspace(0,4,300);
[t,x] = ode45(f,t,0.5);
semilogy(t,x)
title('Nonlinear growth')
xlabel('t'), ylabel('x')
