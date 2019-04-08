% Define your matrix here.
A = [ -3 3;-6 3 ];

clf

% This tries to make sensible choices for the initial conditions, based on
% the stability
lam = eig(A);
tmax = 4/max(abs(lam));
numtheta = 20;
alpha = max(real(lam));
if abs(alpha) < 1e-12
    R = 0.33;
    plot(0,0,'b.','markersize',18)
elseif alpha > 0
    R = 0.15;    
    plot(0,0,'r.','markersize',18)
else 
    R = 1;
    plot(0,0,'k.','markersize',18)
end
    
% Plot the trajectories
hold on
colr = get(gca,'colororder');
t = linspace(0,tmax,300);
x = zeros(2,length(t));
for theta = 2*pi*(0:numtheta-1)/numtheta
    x0 = R*[ cos(theta); sin(theta) ];
    for j = 1:length(t)
        x(:,j) = expm(A*t(j))*x0;
    end
    plot(x(1,:),x(2,:),'linew',1.5,'color',colr(1,:))
end

% Pretty it up
axis([-1.5 1.5 -1.5 1.5]), axis square
title(['eigenvalues ',num2str(lam(1)),',',num2str(lam(2))])
xlabel('x_1')
ylabel('x_2')
