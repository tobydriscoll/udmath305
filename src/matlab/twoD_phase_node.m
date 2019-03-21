
      close all
      
A = 1;  B = 8;  C = 4;
s = roots([A B C]);

plot(0,0,'r.','markersize',18)
    
% Plot trajectories
hold on
colr = get(gca,'colororder');
t = linspace(0,10,300);
for theta = 2*pi*(0:23)/24
    c = [1 1;s(1) s(2)] \ [ cos(theta); sin(theta) ];
    y = c(1)*exp(s(1)*t) + c(2)*exp(s(2)*t);
    dydt = s(1)*c(1)*exp(s(1)*t) + s(2)*c(2)*exp(s(2)*t);
    plot(y,dydt,'linew',1.5,'color',colr(1,:))
end

axis([-1.1 1.1 -1.1 1.1]), axis square
title(['node'])
xlabel('y')
ylabel('y''')
	        
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg twoD_phase_node.svg
      end
      
      