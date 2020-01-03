
      close all
      
            dydt = @(t,y) -5*y;
            [t1,y1] = ode45(dydt,[0,2],1);
            [t2,y2] = ode45(dydt,[2,6],3+y1(end));
            semilogy([t1;t2],[y1;y2])
            xlabel('t'), ylabel('y(t)')
            title('Impulse forcing (semi-log)')
            
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg fo_lcc_impulse_2.svg
      end
      
      