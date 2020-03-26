
      close all
      
					c = @(t) real(exp(1i*t));
					s = @(t) imag(exp(1i*t));
					fplot({c,s},[0,4*pi])
					xlabel('t'), ylabel('e^{it}')
					title('Complex exponential')
					legend('Re part','Im part')
				
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg exp_complex.svg
      end
      
      