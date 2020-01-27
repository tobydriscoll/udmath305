
      close all
      
				A = [ 1 -1 -1; 3 -2 0; 1 -2 -1 ]
				b = [ 2; 9; 5 ]
				x = [1; -3; 2 ]
				x(1)*A(:,1) + x(2)*A(:,2) + x(3)*A(:,3)
			
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg la_lincombination.svg
      end
      
      