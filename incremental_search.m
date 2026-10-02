function [x, info] = incremental_search(f, fprime, interval, atol, maxit)
    step = (interval(2) - interval(1)) / maxit;
    x = [];
    
    % Initialize output struct and tracking history
    info = struct();
    info.history.funccount = zeros(1, maxit);
    info.history.x = zeros(1, maxit);
    
    % Initial function evaluation
    func_counter = 0;
    a1 = interval(1);
    f_a1 = f(a1);
    func_counter = func_counter + 1;
    
    for i = 1:maxit
        a2 = a1 + step;
        f_a2 = f(a2);
        func_counter = func_counter + 1;
        
        % Check for sign change indicating a bracket containing a root
        if (f_a1 * f_a2) < 0
            x = [x; a1, a2]; 
        end
        
        % Record history
        info.history.x(i) = a2;
        info.history.funccount(i) = func_counter;
        
        % Advance search step
        a1 = a2;
        f_a1 = f_a2;
    end
end
