function [x, info] = bisection(f, fprime, interval, atol, maxit)

a = interval(1);
b = interval(2);

% Increment Counter
    func_count = 1; % Total calls so far
    fa = f(a);

% Initialize History Arrays
    info.history.funccount = [];
    info.history.x = [];

    for i = 1:maxit

        % Midpoint
        x = (a+b) / 2

        % Func count at midpoint
        fx = f(x);
        func_count = func_count +1;

        % Save history
        info.history.funccount(end+1, 1) = func_count;
        info.history.x(end+1, 1) = x;

        % Check if root is accurate
        if (b-a)/2 < atol
            break
        end

        % Choose correct half
        if f(a)*f(x) < 0
            b = x;
        else
            a = x;
            fa = fx; % Save fx so no reevaluate f(a)
        end
    end

end
