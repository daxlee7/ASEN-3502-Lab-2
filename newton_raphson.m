function [x, info] = newton_raphson(f, fprime, interval, atol, maxit)
    x0 = interval(1);

    % Func Count
    func_count = 0; % 0 calls
    info.history.funccount = []; % Initialize
    info.history.x = [];

    info.iterations = 0;
    info.converged = false;

    for i = 1:maxit

        % Func Count
        fx = f(x0);
        dfx = fprime(x0);
        func_count = func_count + 2;

        x = x0 - f(x0) / fprime(x0);
        info.iterations = i;

        % Update history
        info.history.funccount(end + 1) = func_count;
        info.history.x(end + 1) = x;

        if abs(x - x0) < atol
            info.converged = true;
            return;
        end

        x0 = x;
    end
end