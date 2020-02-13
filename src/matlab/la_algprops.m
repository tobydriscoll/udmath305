
      close all
      
						A = [ 1 -1; 0 2; -3 1 ]
						B = [ 2 -1 0 4; 1 1 3 2 ]

						A*B
						%B*A  % causes an error

						size(B)
						size(A)

						C = [ 1 -1 2; 2 2 0; 5 -2 -3; 4 -1 -1 ]
						size(C)

						(A*B)*C - A*(B*C)

						A = round(10*rand(4,4))
						B = round(10*rand(4,4))
						C = round(10*rand(4,4))

						( A*(B+C) ) - ( A*B + A*C )

						( (A+B)*C ) - ( A*C + B*C )
					
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg la_algprops.svg
      end
      
      