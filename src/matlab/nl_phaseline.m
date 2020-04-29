
      close all
      
f = @(x) x - x.^3;
fplot(f,[-1.5,1.5])
set(gca,'xaxisloc','origin')
xlabel x, ylabel f(x)
hold on, ylim([-1 1]), axis equal
tt = [-1.35 -0.4 0.4 1.35];
quiver(tt,0*tt,0.15*[1 -1 1 -1],0*tt,.2,'linew',2) 
						
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg nl_phaseline.svg
      end
      
      