
      close all
      
							step = @(t) double(t>0);
							dxdt = @(t,x) 0.1*x + 5*(step(t-3) - step(t-6));
							[t,x] = ode45(dxdt,[0,8],-2);
							plot(t,x)
							xlabel('t'), ylabel('x(t)')
							title('Window forcing')
						
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg fo_lcc_window.svg
      end
      
      