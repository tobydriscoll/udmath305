
      close all
      
							A = [ 1 1 -1; 2 2 1; -1 -1 4 ]
							null(A)
						
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg la_nullspace.svg
      end
      
      