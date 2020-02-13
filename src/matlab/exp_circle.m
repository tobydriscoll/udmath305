
      close all
      
				c = @(t) real(exp(1i*t));
				s = @(t) imag(exp(1i*t));
				fplot(c,s,[0,2*pi])
				axis equal, axis(1.05*[-1 1 -1 1])
				xlabel('Re'), ylabel('Im')
				title('Complex exponential = Unit circle')
			
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg exp_circle.svg
      end
      
      