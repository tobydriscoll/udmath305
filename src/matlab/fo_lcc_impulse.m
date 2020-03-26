
      close all
      
					dxdt = @(t,x) -5*x;
					[t1,x1] = ode45(dxdt,[0,2],1);
					[t2,x2] = ode45(dxdt,[2,5],3+x1(end));
					semilogy([t1;t2],[x1;x2])
					xlabel('t'), ylabel('x(t)')
					title('Impulse forcing')
					
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg fo_lcc_impulse.svg
      end
      
      