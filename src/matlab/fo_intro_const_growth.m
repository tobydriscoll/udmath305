
      close all
      
				x = @(t) exp(t);
				fplot(x,[0,4]), set(gca,'yscale','log')
				xlabel('t'), ylabel('x(t)')
				title('Exponential growth')
			
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg fo_intro_const_growth.svg
      end
      
      