
      close all
      
	    y = @(t) exp(t);
	    fplot(y,[0,4])
	    xlabel('t'), ylabel('y(t)')
	    title('Exponential growth')
	  
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg fo_intro_const_growth.svg
      end
      
      