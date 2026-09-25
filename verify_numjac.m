clc
clear
close all

f = @(x) [x(1)^2*x(2)-1;
          x(1)+x(2)^3-2];

h = 1e-6;

% Test 1
x = [1;1];

J = numjac(f,x,h);

J_true = [2*x(1)*x(2), x(1)^2;
          1, 3*x(2)^2];

disp('x = [1;1]')
disp('Numerical Jacobian:')
disp(J)
disp('True Jacobian:')
disp(J_true)

% Test 2
x = [2;1];

J = numjac(f,x,h);

J_true = [2*x(1)*x(2), x(1)^2;
          1, 3*x(2)^2];

disp('x = [2;1]')
disp('Numerical Jacobian:')
disp(J)
disp('True Jacobian:')
disp(J_true)