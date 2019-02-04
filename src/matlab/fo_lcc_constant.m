
      close all
      
	    dydt = @(t,y) 7-3*y;
	    [t,y] = ode45(dydt,[0,5],-1);
	    plot(t,y)
	    xlabel('t'), ylabel('y(t)')
	    title('Constant forcing')
	    
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg fo_lcc_constant.svg
      end
      
      