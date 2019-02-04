
      close all
      
	    y = @(t) 1./(1-t);
	    fplot(y,[0,1])
	    xlabel('t'), ylabel('y(t)')
	    title('Nonlinear growth')
	  
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg fo_intro_nonlin_growth.svg
      end
      
      