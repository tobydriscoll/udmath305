restoredefaultpath
set(0,'defaultlinelinewidth',1)
set(0,'defaultaxesfontsize',10)

%plot -s 800,400 -r 160 -f png

c = @(t) real(exp(1i*t));
s = @(t) imag(exp(1i*t));
fplot({c,s},[0,4*pi])
xlabel('t'), ylabel('e^{it}')
title('Complex exponential')
legend('Re part','Im part')

c = @(t) real(exp(1i*t));
s = @(t) imag(exp(1i*t));
fplot(c,s,[0,2*pi])
axis equal, axis(1.05*[-1 1 -1 1])
xlabel('Re z'), ylabel('Im z')
title('Complex exponential = Unit circle')

a = 0.02;  om = 0.75;
t = linspace(0, 25, 500);
f = exp((a+1i*om)*t);

plot3(t, real(f), imag(f))
hold on
plot3(t,real(f), 0*t-1.5)
plot3(t, 0*t+2, imag(f))
plot3(0*t+30,real(f),imag(f),'k')
axis([0 30 -2  2 -2 2])
title(sprintf('a = %.2f, \\omega = %.2f',a,om))
grid on, xlabel('Time')
ylabel('Re part')
zlabel('Im part')
set(gca,'dataaspect',[6,1,1])

a = 0;  om = 1;
t = linspace(0, 25, 500);
f = exp((a+1i*om)*t);

plot3(t, real(f), imag(f))
hold on
plot3(t,real(f), 0*t-1.5)
plot3(t, 0*t+2, imag(f))
plot3(0*t+30,real(f),imag(f),'k')
axis([0 30 -2  2 -2 2])
title(sprintf('a = 0, \\omega = %.1f',a,om))
grid on, xlabel('Time')
ylabel('Re part')
zlabel('Im part')
set(gca,'dataaspect',[6,1,1])

a = -0.07;  om = 2.4;
t = linspace(0, 25, 500);
f = exp((a+1i*om)*t);

plot3(t, real(f), imag(f))
hold on
plot3(t,real(f), 0*t-1.5)
plot3(t, 0*t+2, imag(f))
plot3(0*t+30,real(f),imag(f),'k')
axis([0 30 -2 2 -2 2])
title(sprintf('a = %.2f, \\omega = %.1f',a,om))
grid on, xlabel('Time')
ylabel('Re part')
zlabel('Im part')
set(gca,'dataaspect',[6,1,1])
