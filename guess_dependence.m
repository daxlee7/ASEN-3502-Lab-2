clear; close; clc;

M = 3;
delta = deg2rad(20);
mu = asin(1/M);
interval = [mu, deg2rad(90)];
atol = 10e-6;
maxit = 1000;
theta = linspace(mu, deg2rad(90));
f  = @(theta) shock_residual(delta, theta, M);
df = @(theta) shock_derivative(delta, theta, M);
root = zeros(length(theta),1);

for i = 1:length(theta)
    guess = Newton_Raphson(f, df, [theta(i), deg2rad(90)], atol, maxit);
    if abs(guess - .6592) < 0.01
        root(i) = 1;
    elseif abs(guess - 1.4337) < 0.01
        root(i) = 2;
    else
        root(i) = 0;
    end
end


figure;
hold on;
theta_deg = rad2deg(theta);
plot(theta_deg(root == 1), root(root == 1), 'bo', 'DisplayName', 'Weak Root');
plot(theta_deg(root == 2), root(root == 2), 'r*', 'DisplayName', 'Strong Root');
plot(theta_deg(root == 0), root(root == 0), 'blackx', 'DisplayName', 'Failed / Diverged');
xlabel('Initial Guess \theta_0 (deg)');
ylabel('Root Type');
yticks([0 1 2]);
yticklabels({'Diverge', 'Weak Root', 'Strong Root'});
title('Convergence vs. Guess');
legend('Location', 'best');
grid on;