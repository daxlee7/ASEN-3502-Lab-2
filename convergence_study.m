clear; clc; close all;

M = 3;  delta = deg2rad(20);
interval = [asin(1/M), deg2rad(60)];
atol = deg2rad(1e-6);

f  = @(t) shock_residual(delta, t, M);
df = @(t) shock_derivative(delta, t, M);

root = newton_raphson(f, df, interval, 1e-14, 100);

[~, b] = bisection(f, df, interval, atol, 1000);
[~, n] = newton_raphson(f, df, interval, atol, 1000);
[~, s] = secant_method(f, df, interval, atol, 1000);
[~, i] = incremental_search(f, df, interval, atol, 1000);

% Had ai help make these
figure
semilogy(b.history.funccount, abs(b.history.x - root), 'o-', n.history.funccount, abs(n.history.x - root), 's-', s.history.funccount, abs(s.history.x - root), '^-')
xlabel('Function calls'), ylabel('Error (rad)'), grid on
legend('Bisection', 'Newton-Raphson', 'Secant')
title('Convergence, weak shock (M = 3, \delta = 20°)')

figure
semilogy(i.history.funccount, abs(i.history.x - root), '.-')
xlabel('Function calls'), ylabel('Error (rad)'), grid on
title('Incremental search, weak shock')