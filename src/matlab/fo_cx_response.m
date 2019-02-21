
      close all
      
q = @(t) 2*sin(t)-2*cos(t);
fplot(q,[0 15],'k','linew',3)
hold on
dydt = @(t,y) -y + q(t);
t = linspace(0,15,500);
for y0 = -2:.5:2
  [t,y] = ode45(dydt,t,y0);
  plot(t,y)
end
grid on
xlabel('t'), ylabel('y(t)')
          
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg fo_cx_response.svg
      end
      
      