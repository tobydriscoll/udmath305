
      close all
      
					A = [ 1 -1 -1; 3 -2 0; 1 -2 -1 ]
					b = [ 2; 9; 5 ]
					AA = [ A b ]

					AA(2,1:end) = AA(2,1:end) - 3*AA(1,1:end)
					AA(3,1:end) = AA(3,1:end) - AA(1,1:end)

					AA(3,2:end) = AA(3,2:end) + AA(2,2:end)

					AA(2,3:end) = AA(2,3:end) - AA(3,3:end)
					AA(1,3:end) = AA(1,3:end) + (1/3)*AA(3,3:end)

					AA(1,2:end) = AA(1,2:end) + AA(2,2:end)
				
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg la_rowops.svg
      end
      
      