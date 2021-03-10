# Stability and the phase plane

restoredefaultpath
set(0,'defaultlinelinewidth',1)
set(0,'defaultaxesfontsize',10)

%plot -s 800,400 -r 160 -f png

The homogeneous system $\mathbf{x}'=\mathbf{A}\mathbf{x}$ for a constant matrix $\mathbf{A}$ clearly has the constant function $\mathbf{x}(t)\equiv \boldsymbol{zero}$ as a solution. We call this an {term}`equilibrium` or steady-state solution. Not all equilibria are the same, however. 

Imagine holding a broom by two fingers, with the bristles pointing straight down at the floor. You will not have much difficulty keeping the broom in approximately this position for a long time, even if an annoying friend comes by and jostles you a bit. Now imagine holding it inverted, with the bristles pointing toward the ceiling. If you were able to *perfectly* balance the center of gravity of a symmetric broom above your fingers, then in principle it ought to stay there. But the broom is not perfect, and your arm and fingers can't stay perfectly still. You might keep the broom upright for a few seconds, but it will soon crash to the floor. 

Both the downward and upward positions of the broom are equilibria. The property that differentiates them is {term}`stability`. Stability refers to the response of the system to a perturbation (small change) of its state away from an equilibrium. If the system stays arbitrarily close to the equilibrium after an infinitesimal perturbation, we say the equilibrium is {term}`stable`. (What happens near equilibrium, stays near equilibrium.) Otherwise it is {term}`unstable`. 

Stability of the origin depends on the eigenvalues of $\mathbf{A}$. This is most easily summarized in the special case of a $2\times 2$ real matrix with eigenvalues $\lambda_1,\lambda_2$. The major cases to be considered are summarized in the following table, leaving out some subtle edge cases when things are zero or exactly equal. The other column of the table is to be explained next.
	
:::{list-table} Eigenvalues and stability
:header-rows: 1
:name: table-fs-stability

* - Eigenvalues
  - Stability
  - Type
* - $\lambda_1 < \lambda_2 < 0$
  - stable
  - node
* - $\lambda_1 < 0 < \lambda_2 $
  - unstable
  - saddle
* - $0 < \lambda_1 < \lambda_2 $
  - unstable
  - node
* - $\lambda = a\pm i b,\: a< 0$
  - stable
  - spiral
* - $\lambda = \pm i b$
  - stable
  - center
* - $\lambda = a\pm i b,\: a> 0$
  - unstable
  - spiral
:::

## Phase plane

In the two-dimensional case, the solutions of $\mathbf{x}'=\mathbf{A}\mathbf{x}$ can be plotted as trajectories parameterized by time in the $(x_1,x_2)$ plane, often called the 
{term}`phase plane`. Each of the cases in the [stability table](table-fs-stability) has a phase plane portrait that shares certain general characteristics that clarify the major aspects of possible solution behaviors.  

### Node

When the eigenvalues are real and have the same sign, the steady state is called a {term}`node`. If the sign is negative, all trajectories head into the steady state and it is stable; conversely, in the positive case it is unstable. 

Here is a phase plane plot for $\mathbf{A}=\twomat{-4}{-1}{-2}{-5}$, which has eigenvalues $-3$ and $-6$.

A = [-4 -1; -2 -5];
[V,D] = eig(A);
lam = diag(D);

clf
plot(0,0,'r.','markersize',18)
hold on

% plot directions
[x1,x2] = meshgrid(-1:.2:1);
v = A*[x1(:)';x2(:)'];
sz = size(x1);
quiver(x1,x2,reshape(v(1,:),sz),reshape(v(2,:),sz))

% plot eigenvectors
plot(5*[-V(1,:);V(1,:)],5*[-V(2,:);V(2,:)],'k','linew',2)

% plot trajectories
colr = get(gca,'colororder');
t = linspace(0,10,300);
for theta = 2*pi*(0:23)/24
	for j = 1:length(t)
		X = expm(t(j)*A);
		x(:,j) = X*[ cos(theta); sin(theta) ];
	end
	plot(x(1,:),x(2,:),'linew',1.5,'color',colr(1,:))
end

axis([-1.1 1.1 -1.1 1.1]), axis square
title('stable node')
xlabel('x_1')
ylabel('x_2')		

The black lines show the directions of the eigenvectors. An initial state on one of those lines stays on it forever. Other initial conditions follow a path tending to become parallel to eigenvector $\mathbf{v}_1$, since the other component decays out more quickly. The plot for $-\mathbf{A}$ would just reverse all of the arrows and show an unstable steady state. 

### Saddle

When the eigenvalues are real and of different signs, the steady state is called a 
{term}`saddle`. A saddle point is always unstable. The part of the solution along the negative eigenvector decays away, but the contribution from the positive eigenvector grows with time. 

Here is a phase plane plot for $\mathbf{A}=\twomat{-2}{-3}{-6}{-5}$, which has eigenvalues $1$ and $-8$.

A = [-2 -3; -6 -5];
[V,D] = eig(A);
lam = diag(D);

clf
plot(0,0,'r.','markersize',18)
hold on

% plot directions
[x1,x2] = meshgrid(-1:.2:1);
v = A*[x1(:)';x2(:)'];
sz = size(x1);
quiver(x1,x2,reshape(v(1,:),sz),reshape(v(2,:),sz))

% plot eigenvectors
plot(5*[-V(1,:);V(1,:)],5*[-V(2,:);V(2,:)],'k','linew',2)

% plot trajectories
colr = get(gca,'colororder');
t = linspace(0,10,300);
for theta = 2*pi*(0:23)/24
	for j = 1:length(t)
		X = expm(t(j)*A);
		x(:,j) = X*[ cos(theta); sin(theta) ];
	end
	plot(x(1,:),x(2,:),'linew',1.5,'color',colr(1,:))
end

axis([-1.1 1.1 -1.1 1.1]), axis square
title('saddle')
xlabel('x_1')
ylabel('x_2')

An initial condition exactly on the stable black line (eigenvector) will approach the origin, but anything else ends up shooting away more or less in the direction of the unstable eigenvector.  

### Spiral

When the eigenvalues are complex conjugates with nonzero real part, the steady state is called a {term}`spiral`. If the eigenvalues are $a \pm i b$, then all solutions contain $e^{at}e^{\pm i b t}$, or equivalently, $e^{at}\cos{b t}$ and $e^{at}\sin{b t}$. The real part causes growth and instability if $a> 0$, or decay and stability if $a < 0$. The imaginary part determines the angular speed of the spiral. 

Here is a phase plane plot for $\mathbf{A}=\twomat{1}{-2}{4}{-3}$, which has eigenvalues $-1\pm 2i$.

A = [1 -2; 4 -3];
[V,D] = eig(A);
lam = diag(D);

clf
plot(0,0,'r.','markersize',18)
hold on

% plot directions
[x1,x2] = meshgrid(-1:.2:1);
v = A*[x1(:)';x2(:)'];
sz = size(x1);
quiver(x1,x2,reshape(v(1,:),sz),reshape(v(2,:),sz))

% plot trajectories
colr = get(gca,'colororder');
t = linspace(0,7,300);
for theta = 2*pi*(0:6)/7
	for j = 1:length(t)
		X = expm(t(j)*A);
		x(:,j) = X*[ cos(theta); sin(theta) ];
	end
	plot(x(1,:),x(2,:),'linew',1.5,'color',colr(1,:))
end

axis([-1.2 1.2 -1.2 1.2]), axis square
title('stable spiral')
xlabel('x_1')
ylabel('x_2')

The eigenvectors are complex and don't show up on the plot; there are no purely linear trajectories as in the other cases.

### Center

The special case of imaginary eigenvalues, $\lambda=\pm i b$, is called a {term}`center`. You can think of the trajectories as spirals that are perfectly neutral — that is, circles or ellipses. These equilibria are often associated with conservation principles, such as conservation of energy. 

Here is a phase plane plot for $\mathbf{A}=\twomat{0}{-1}{4}{0}$, which has eigenvalues $\pm 2i$.

A = [0 -1; 4 0];
[V,D] = eig(A);
lam = diag(D);

clf
plot(0,0,'r.','markersize',18)
hold on

% plot directions
[x1,x2] = meshgrid(-1:.2:1);
v = A*[x1(:)';x2(:)'];
sz = size(x1);
quiver(x1,x2,reshape(v(1,:),sz),reshape(v(2,:),sz))

% plot trajectories
colr = get(gca,'colororder');
t = linspace(0,7,300);
for r = 0.15:0.1:0.55
	for j = 1:length(t)
		X = expm(t(j)*A);
		x(:,j) = X*[r; 0];
	end
	plot(x(1,:),x(2,:),'linew',1.5,'color',colr(1,:))
end

axis([-1.2 1.2 -1.2 1.2]), axis square
title('center')
xlabel('x_1')
ylabel('x_2')