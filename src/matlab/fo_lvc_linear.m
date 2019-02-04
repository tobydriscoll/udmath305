
      close all
      
	    dydt = @(t,y) 2*t*y - t;
	    [t,y] = ode45(dydt,[0,2],0);
	    plot(t,y)
	    xlabel('t'), ylabel('y(t)')
	    
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg fo_lvc_linear.svg
      end
      
      