
      close all
      
A = 1;  B = 6;  C = -3;
s = sort(roots([A B C]),'descend');

plot(0,0,'r.','markersize',18)
    
% Plot trajectories
hold on
colr = get(gca,'colororder');
t = linspace(0,15,300)';
for theta = 2*pi*(0:23)/24
    c = [1 1;s(1) s(2)] \ [ cos(theta); sin(theta) ];
    y = c(1)*exp(s(1)*t) + c(2)*exp(s(2)*t);
    dydt = s(1)*c(1)*exp(s(1)*t) + s(2)*c(2)*exp(s(2)*t);
    plot(y,dydt,'linew',1.5,'color',colr(1,:))
end
y = 2*exp(s(2)*t); dydt = 2*s(2)*exp(s(2)*t);
plot([y -y],[dydt -dydt],'k','linew',1.5)
y = 2*exp(-s(1)*t); dydt = 2*s(1)*exp(-s(1)*t);
plot([y -y],[dydt -dydt],'k','linew',1.5)

axis([-1.5 1.5 -1.5 1.5]), axis square
title('saddle')
xlabel('y')
ylabel('y''')
	        
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg twoD_phase_saddle.svg
      end
      
      