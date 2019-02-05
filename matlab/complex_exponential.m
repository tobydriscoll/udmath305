clf

t = linspace(0, 25, 500);
a = -0.08;  om = 1;
f = exp((a+1i*om)*t);

plot3(t, real(f), imag(f), 'LineWidth',2)
hold on
plot3(t,real(f), 0*t-1.5)
plot3(t, 0*t+2, imag(f))
plot3(0*t+30,real(f),imag(f),'k')
hold off
grid on
axis([0 30 -2  2 -1.5 1.5])
title(sprintf('a = %.2f, omega = %.1f',a,om))
xlabel('Time')
ylabel('Real Axis')
zlabel('Imag Axis')