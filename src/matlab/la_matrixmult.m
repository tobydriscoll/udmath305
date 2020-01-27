
      close all
      
					A = [ 1 -1; 0 2; -3 1 ]
					B = [ 2 -1 0 4; 1 1 3 2 ]

					A*B

					A(3,:)*B(:,1)
				
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg la_matrixmult.svg
      end
      
      