
      close all
      
h = 8;
dydt = @(t,y) 6*y - y^2 - h;
tt = linspace(0,5,500);
for y0 = 0.8:0.65:5
    [t,y] = ode45(dydt,tt,y0);
    plot(t,y), hold on
end
xlabel('t'), ylabel('y(t)')
grid on, ylim([0 5])

      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg fo_lgs_underharvest.svg
      end
      
      