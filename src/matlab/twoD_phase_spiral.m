
      close all
      
A = 1;  B = .6;  C = 3;
s = roots([A B C]);

plot(0,0,'r.','markersize',18)
    
% Plot trajectories
hold on
colr = get(gca,'colororder');
t = linspace(0,15,1000)';
for phi = 2*pi*(0:5)/6
    y = real(exp(s(1)*t-1i*phi));
    dydt = real(s(1)*exp(s(1)*t-1i*phi));
    plot(y,dydt,'linew',1.5,'color',colr(1,:)), hold on
end
axis([-1.5 1.5 -1.5 1.5]), axis square
title('spiral')
xlabel('y')
ylabel('y''')
	        
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg twoD_phase_spiral.svg
      end
      
      