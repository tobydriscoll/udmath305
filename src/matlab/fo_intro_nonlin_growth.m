
      close all
      
				x = @(t) 1./(1-t);
				fplot(x,[0,1]), set(gca,'yscale','log')
				xlabel('t'), ylabel('x(t)')
				title('Nonlinear growth')
			
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg fo_intro_nonlin_growth.svg
      end
      
      