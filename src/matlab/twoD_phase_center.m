
      close all
      
A = 1;  B = 0;  C = 2;
s = roots([A B C]);

plot(0,0,'r.','markersize',18)
    
% Plot trajectories
hold on
colr = get(gca,'colororder');
t = linspace(0,15,1000)';
for R = .2:.2:1
    y = R*real(exp(s(1)*t));
    dydt = R*real(s(1)*exp(s(1)*t));
    plot(y,dydt,'linew',1.5,'color',colr(1,:)), hold on
end
axis([-1.5 1.5 -1.5 1.5]), axis square
title('center')
xlabel('y')
ylabel('y''')
	        
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg twoD_phase_center.svg
      end
      
      