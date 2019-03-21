
      close all
      
            slopefield(@(t,y) t.^2-y,[0 2],[-4 4])
	        
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg twoD_slope4.svg
      end
      
      