%% 40-chebivp.m -- an executable m-file for solving an initial-value problem
% Automatically created in CHEBGUI by user driscoll.
% Created on January 11, 2018 at 10:14.

%% Problem description.
% Solving
%   u'' + pi^2*u = 1,
% for t in [0, 20], subject to
%   u(0) = 0,
%   u'(0) = 0.

%% Problem set-up.
% Define the domain.
dom = [0, 20];

% Assign the differential equation to a chebop on that domain.
N = chebop(@(t,u) diff(u,2)+pi.^2.*u-1, dom);

% Set up the rhs of the differential equation so that N(u) = rhs.
rhs = 0;

% Assign boundary conditions to the chebop.
N.lbc = @(u) [u; diff(u)];

%% Setup preferences for solving the problem.
% Create a CHEBOPPREF object for passing preferences.
% (See 'help cheboppref' for more possible options.)
options = cheboppref();

% Specify the IVP solver to use. Possible options are:
%   Time-stepping solvers:
%     'ode113' (default), 'ode15s' or 'ode45'.
%   Global methods:
%     'values' or 'coefficients'.
options.ivpSolver = 'ode113';

%% Solve!
% Call solveivp() to solve the problem.
% (With the default options, this is equivalent to u = N\rhs.)
u = solveivp(N, rhs, options);

%% Plot the solution.
figure
plot(u, 'LineWidth', 2)
title('IVP solution'), xlabel('t'), ylabel('u')