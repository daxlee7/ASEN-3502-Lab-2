function [x, info] = newton_sys(f, J, x0, atol, maxit)

xs = x0;
x = x0(:);
h = 1e-6;
converged = false;
iter = 0;

for i = 1:maxit
    iter = i;
    fx = f(x);
    fx = fx(:);
    if norm(fx, 2) < atol
        converged = true;
        break;
     end
    jacobian = J(f, x, h);
    [L, U] = lu_decompose(jacobian);
    step = lu_solve(L, U, -f(x));
    x = x + step;
    xs = [xs, x];
end

info.converged = converged;
info.iterations = iter;
info.final_residual = norm(f(x), 2);
info.x_final = x;

x = xs;
end
function x = lu_solve(L, U, b)

% Forward substitute for d
d = zeros(length(b), 1);
for i = 1:length(b)
    d(i) = (b(i) - L(i,1:i-1)*d(1:i-1)) / L(i,i);
end
% Back substitute for x
x = zeros(length(b), 1);
for r = length(b):-1:1
    % Find x for each row
    x(r) = ((d(r)- U(r,r+1:length(d))*x(r+1:length(d)))/U(r,r));
end

end

function [L,U] = lu_decompose(A)

% Set up L, U
L = eye(size(A));
U = zeros(size(A));

% Make Upper Triangular Matrix
for c = 1:length(A)-1
    for r = c+1:length(A)
        % Find factor between each member and the diagonal member
        f = A(r,c)/A(c,c);
        % Subtract factor * diagonal from member to make everything below
        % diagonal 0
        A(r,c:length(A)) = A(r,c:length(A)) - (f * A(c,c:length(A)));
        % Save to L
        L(r,c) = f;
    end
end
U=A;
end