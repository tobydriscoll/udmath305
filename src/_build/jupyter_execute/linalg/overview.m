x = [ 1 2 3 4 ]
y = [10; 20; 30]
A = [ 1 2 3; -4 -5 -6; pi sqrt(2) exp(1) ]

sizes = [ size(x); size(y); size(A) ]

x_2 = x(2)
A_31 = A(3,1)
y_last = y(end)

A(2,1) = 1i     % the imaginary unit
