A = [ 1 -1; 0 2; -3 1 ]
B = [ 2 -1 0 4; 1 1 3 2 ]

A*B

A(3,:)*B(:,1)

A = [ 1 -1; 0 2 ]        % 2x2
B = [ 2 -1; 1 1; 4 0 ]   % 3x2

A*B

A = [ 1 -1; 0 2; -3 1 ]
B = [ 2 -1 0 4; 1 1 3 2 ]
C = [ 1 -1 2; 2 2 0; 5 -2 -3; 4 -1 -1 ]

(A*B)*C - A*(B*C)    % always zero in exact artithmetic

% some random choices
A = round(10*rand(4,4))
B = round(10*rand(4,4))
C = round(10*rand(4,4))

ident1 = ( A*(B+C) ) - ( A*B + A*C )    % should be zero

ident2 = ( (A+B)*C ) - ( A*C + B*C )    % should be zero
