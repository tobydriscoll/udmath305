
      close all
      
						A = [ 1 1; 4 1 ];
						lambda = eig(A)

						[V,D] = eig(A)
					
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg la_eig.svg
      end
      
      