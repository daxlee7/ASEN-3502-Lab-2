function [x, info] = bisection(f, fprime, interval, atol, maxit)

a = interval(1);
b = interval(2);

    for i = 1:maxit

        % Midpoint
        x = (a+b) / 2

        % Check if root is accurate
        if (b-a)/2 < atol
            break
        end

        % Choose correct half
        if f(a)*f(x) < 0
            b = x;
        else
            a = x;
        end
    end

info = struct();

end
