clear; clc;

f = @(x) [x(1)^2 + x(2)^2 - 1;
          x(1) - x(2)];

J = @(f,x,h) numjac(f, x, h);

x0 = [1;1];

[x, info] = newton_sys(f,J,x0,1e-6,100);

x_true = [1/sqrt(2); 1/sqrt(2)];

assert(norm(x(:,end)-x_true) < 1e-6)

disp(x)