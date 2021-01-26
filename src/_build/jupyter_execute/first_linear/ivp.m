restoredefaultpath
set(0,'defaultlinelinewidth',1)
set(0,'defaultaxesfontsize',6)

%plot -s 800,400 -r 160 -f png

set(gcf,'defaultaxesfontsize',6)

a = 1.25;
for C = [-1 -0.67 -0.33 0 0.33 0.67 1]
    fplot(@(t) C*exp(a*t),[1,4])
    hold on
end

plot(2,5,'k.','markersize',14)
fplot(@(t) 5*exp(a*(t-2)),[1,4],'k','linew',2)
ylim([-100 100])
xlabel('t'), ylabel('x')

f = @(t,x) 2*x;
t = linspace(1,5,300);
[t,x] = ode45(f,t,3);
clf
plot(t,x)
title('Constant growth')
xlabel('t'), ylabel('x')

semilogy(t,x)
title('Constant growth (log scale)')
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
title('Nonlinear (feedback) growth')
xlabel('t'), ylabel('x')
