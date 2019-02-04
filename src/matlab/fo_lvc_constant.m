
      close all
      
	    dydt = @(t,y) 2*y + 1;
	    [t,y] = ode45(dydt,[0,1],6);
	    plot(t,y)
	    xlabel('t'), ylabel('y(t)')
	    
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg fo_lvc_constant.svg
      end
      
      