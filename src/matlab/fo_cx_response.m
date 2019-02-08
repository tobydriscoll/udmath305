
      close all
      
	    f = @(t) 2*sin(t)-2*cos(t);
      dydt = @(t,y) -y + f(t);
      t = linspace(0,30,500);
      [t,y] = ode45(dydt,t,0);

      plot(t,[f(t),y]), grid on
      xlabel('t'), ylabel('y(t)')
      legend('forcing','solution')
          
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg fo_cx_response.svg
      end
      
      