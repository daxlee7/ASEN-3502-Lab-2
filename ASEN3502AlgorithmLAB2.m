clc
clear
close all

clc
clear
close all

%% Example to test functions
f      = @(x) cos(x) - x;
fprime = @(x) -sin(x) - 1;

atol  = 1e-6;
maxit = 100;

[x_secant, info_secant] = secant_method(f, [], [0, 1], atol, maxit);
[x_newton, info_newton] = newton_raphson(f, fprime, 0.5, atol, maxit);

disp(x_secant)
disp(info_secant)

disp(x_newton)
disp(info_newton)

%% Secant method
function [x, info] = secant_method(f, ~, interval, atol, maxit)
    x0 = interval(1);
    x1 = interval(2);

    info.iterations = 0;
    info.converged = false;

    for i = 1:maxit
        x = x1 - f(x1) * (x0 - x1) / (f(x0) - f(x1));
        info.iterations = i;

        if abs(x - x1) < atol
            info.converged = true;
            return;
        end

        x0 = x1;
        x1 = x;
    end
end

%% Newton-Raphson method
function [x, info] = newton_raphson(f, fprime, interval, atol, maxit)
    x0 = interval(1);

    info.iterations = 0;
    info.converged = false;

    for i = 1:maxit
        x = x0 - f(x0) / fprime(x0);
        info.iterations = i;

        if abs(x - x0) < atol
            info.converged = true;
            return;
        end

        x0 = x;
    end
end