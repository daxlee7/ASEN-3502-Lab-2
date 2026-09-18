
M = 3;
h = 1e-6

delta = deg2rad([10 20 30]);
theta = deg2rad([25 40 60]);

fprintf(' Delta    Theta       Error\n')
fprintf('----------------------------\n')

for i = 1:length(delta)
    for j = 1:length(theta)

        exact = shock_derivative(delta(i), theta(j), M);

        approx = (shock_residual(delta(i), theta(j)+h, M) - shock_residual(delta(i), theta(j), M)) / h;

        fprintf('%5.0f     %5.0f     %.3e\n', rad2deg(delta(i)), rad2deg(theta(j)), abs(exact-approx));
    end
end
