% Define your matrix here.
A = [ -1 1;-2 -1 ];

clf

% This tries to make sensible choices for the initial conditions, based on
% the stability
lam = eig(A);
tmax = 10;
numtheta = 20;
alpha = max(real(lam));
plot(0,0,'r.','markersize',18)

if abs(alpha) < 1e-12
    R = 0.75:.5:3.25;
    theta = 0.123 + zeros(size(R));
elseif alpha > 0
    theta = 0.123 + 2*pi*(0:15-1)/15;
    R = 1.5 + 0.4*sin(theta);
else 
    theta = 0.123 + 2*pi*(0:15-1)/15;
    R = 3.2 + 0.2*sin(theta);
end
    
% Plot the trajectories
hold on
axis([-4 4 -4 4]), axis square

colr = get(gca,'colororder');
t = linspace(-tmax,tmax,501);
x = zeros(2,length(t));
for i = 1:length(theta)
    x0 = R(i)*[ cos(theta(i)); sin(theta(i)) ];
    for k = 1:length(t)
        x(:,k) = expm(A*t(k))*x0;
    end
    arrow3(x(:,250)',x(:,251)','k',.5,1)
    plot(x(1,:),x(2,:),'linew',1,'color',colr(1,:))
end

% Pretty it up
title(['eigenvalues ',num2str(lam(1)),',',num2str(lam(2))])
xlabel('x_1')
ylabel('x_2')
