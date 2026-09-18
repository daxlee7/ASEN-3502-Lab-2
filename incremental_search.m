function [x, info] = incremental_search(f, fprime, interval, atol, maxit)

step = (interval(2) - interval(1))/maxit;

x = [];

A = [interval(1), 0];

for i = 1:maxit

    A(2) = A(1) + step;

    if((f(A(2)) * f(A(1))) < 0)
        x(end+1:end+2,1) = [A(1); A(2)];
    end

    A(1) = A(2);
end

info = struct();

end