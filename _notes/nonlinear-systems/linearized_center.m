clf

mu = 100;
f = @(t,x) [ x(2); -x(1)-mu*(x(1)^2-1)*x(2) ];
[t,x] = ode15s(f,[0 3*mu],[2;0]);

plot(t,x)

%%
plot(x(:,1),x(:,2)), axis equal
xlabel('x_1'), ylabel('x_2')

%%
eigval = [];
for k = 1:length(t)
    J = [  0  1; -1-2*mu*x(k,1)*x(k,2)  mu*(1-x(k,1)^2) ];
    eigval(:,k) = eig(J);
end
alpha = sort(real(eigval));
plot(t,alpha,'-o')
grid on