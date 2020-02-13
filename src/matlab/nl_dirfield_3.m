
      close all
      
			f = @(t,x) t-x^2;
			slopefield(f,[-2 2],[-2 2])
			
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg nl_dirfield_3.svg
      end
      
      