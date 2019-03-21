
      close all
      
            slopefield(@(t,y) y,[0 3],[-1 1])
	        
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg twoD_slope1.svg
      end
      
      