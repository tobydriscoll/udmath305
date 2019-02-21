
      close all
      
          dydt = @(t,y) (4*t^2 - 2*y)/t;
          [t,y] = ode45(dydt,[1,3],2);
          plot(t,y)
          xlabel('t'), ylabel('y(t)')
          
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg fo_lvc_sing.svg
      end
      
      