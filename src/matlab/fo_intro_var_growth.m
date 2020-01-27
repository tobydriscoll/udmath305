
      close all
      
				x = @(t) exp(t.^2);
				fplot(x,[0,4]), set(gca,'yscale','log')
				xlabel('t'), ylabel('x(t)')
				title('Variable growth')
			
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg fo_intro_var_growth.svg
      end
      
      