
      close all
      
			a = 6; b = 2;
			K = a/b;

			f = @(t,x) a*x - b*x^2;
			t = linspace(0,2.5,300);
			for x0 = K*[0.02 0.15 0.4 0.8 1.2 1.5]
				[t,x] = ode45(f,t,x0);
				plot(t,x), hold on
			end
			xlabel('t'), ylabel('x(t)')
			set(gca,'ygrid','on',...
			'ytick',K*(0:.25:1),'yticklabel',{'0','','0.5K','','K'})
		
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg fn_lo_solutions.svg
      end
      
      