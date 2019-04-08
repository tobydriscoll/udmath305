
      close all
      
            F = @(x,y) 3.*x-x.*y/2;
            G = @(x,y) -y + x.*y/4;

            slopefield(F,G,[0 10],[0 12])
	        
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg twoD_slope_2D_2.svg
      end
      
      