clear; close; clc;

M = 3;
delta = deg2rad(20);
mu = asin(1/M);
interval_weak = [mu, deg2rad(60)];
interval_strong = [deg2rad(80), deg2rad(90)];
atol = 10e-6;
maxit = 1000;
theta = linspace(mu, deg2rad(90));
f  = @(theta) shock_residual(delta, theta, M);
df = @(theta) shock_derivative(delta, theta, M);

[x_bisection_weak, info_bisection_weak] = bisection(f, df, interval_weak, atol, maxit)
[x_incremental_weak, info_incremental_weak] = incremental_search(f, df, interval_weak, atol, maxit)
[x_Newton_Raphson_weak, info_Newton_Raphson_weak] = Newton_Raphson(f, df, interval_weak, atol, maxit)
[x_secant_method_weak, info_secant_method_weak] = secant_method(f, df, interval_weak, atol, maxit)

[x_bisection_strong, info_bisection_strong] = bisection(f, df, interval_strong, atol, maxit)
[x_incremental_strong, info_incremental_strong] = incremental_search(f, df, interval_strong, atol, maxit)
[x_Newton_Raphson_strong, info_Newton_Raphson_strong] = Newton_Raphson(f, df, interval_strong, atol, maxit)
[x_secant_method_strong, info_secant_method_strong] = secant_method(f, df, interval_strong, atol, maxit)
