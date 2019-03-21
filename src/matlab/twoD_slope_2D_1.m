
      close all
      
            F = @(x,y) -y;   G = @(x,y) x;

            slopefieldxy(F,G,[-2 2],[-2 2])
	        
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg twoD_slope_2D_1.svg
      end
      
      