
      close all
      
						A = magic(3)
						b = [ 1; 6; -2 ]

						x = A\b
						b - A*x
					
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg la_linsolve.svg
      end
      
      