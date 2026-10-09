function [x, info] = secant_method(f, ~, interval, atol, maxit)
    x0 = interval(1);
    x1 = interval(2);

    info.iterations = 0;
    info.converged = false;

    % Func Count
    f0 = f(x0);
    f1 = f(x1);
    func_count = 2;
    info.history.funccount = [];
    info.history.x = [];

    for i = 1:maxit
        x = x1 - f1 * (x0 - x1) / (f0 - f1);
        info.iterations = i;

        % Func Count
        fx = f(x);
        func_count = func_count + 1;
        info.history.funccount(end + 1) = func_count;
        info.history.x(end + 1) = x;

        if abs(x - x1) < atol
            info.converged = true;
            return;
        end

        x0 = x1;
        f0 = f1;
        x1 = x;
        f1 = fx;
    end
end