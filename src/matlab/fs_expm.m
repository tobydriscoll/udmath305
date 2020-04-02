
      close all
      
A = [1 -2; 5 -3];
x0 = [-1;2];
t = linspace(0,8,400);
% Numerical solution: curves
f = @(t,x) A*x;
[t,xnum] = ode45(f,t,x0);
plot(t,xnum)
% Solution by matrix exponential: dots
xexp = zeros(length(t),2);
for j = 1:length(t)
	xexp(j,:) = expm(A*t(j))*x0;
end
hold on, plot(t,xexp,'k.')
xlabel('t'), ylabel('x_1(t), x_2(t)')
						
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg fs_expm.svg
      end
      
      