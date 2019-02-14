%% Exponential Growth
f = @(t,y) y;
t = linspace(0,3,500);
y0=1;
[t,y]=ode45(f,t,y0);
plot(t,y)

%%
plot(t,y-exp(t)) %error graph
xlabel('t')
ylabel('error')


%% Exponential Decay
f = @(t,y) -y;
t = linspace(0,3,500);
y0=1;
[t,y]=ode45(f,t,y0);
plot(t,y)

%% Superexponential
f = @(t,y) 2*t*y;
t = linspace(0,3,500);
y0=1;
[t,y]=ode45(f,t,y0);
plot(t,y)

%% Semi-log scale
f = @(t,y) y;
t = linspace(0,3,500);
y0=1;
[t,ye]=ode45(f,t,y0);

f = @(t,y) 2*t*y;
t = linspace(0,3,500);
y0=1;
[t,ys]=ode45(f,t,y0);

semilogy(t,[ye ys])
legend('exp','superexp','location','northwest')

%% Blowup Equation
f = @(t,y) y^2;
t = linspace(0,3,500);
y0=1;
[t,y]=ode45(f,t,y0);
plot(t,y) 

