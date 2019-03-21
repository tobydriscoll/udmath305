
      close all
      
            slopefield(@(t,y) 4*y-y.^2,[0 4],[0 5])
	        
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg twoD_slope3.svg
      end
      
      