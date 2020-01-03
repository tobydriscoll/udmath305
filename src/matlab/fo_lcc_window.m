
      close all
      
          step = @(t) double(t>0);
          dydt = @(t,y) y + 5*(step(t-3) - step(t-6));
          [t,y] = ode45(dydt,[0,8],1);
          plot(t,y)
          xlabel('t'), ylabel('y(t)')
          title('Window forcing')
          
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg fo_lcc_window.svg
      end
      
      