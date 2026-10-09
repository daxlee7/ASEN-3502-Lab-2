clear; clc;

M1 = 3;
gamma = 1.4;
deltaA = deg2rad(15);
deltaB = deg2rad(10);
mu = asin(1/M1);

fA = @(theta) shock_residual(deltaA, theta, M1);
fB = @(theta) shock_residual(deltaB, theta, M1);

thetaA = bisection(fA, [], [mu, deg2rad(35)], 1e-6, 1000);
thetaB = bisection(fB, [], [mu, deg2rad(30)], 1e-6, 1000);

% Equation (2)
p2p1 = (2*gamma*M1^2*sin(thetaA)^2 - (gamma-1)) / (gamma+1);
p3p1 = (2*gamma*M1^2*sin(thetaB)^2 - (gamma-1)) / (gamma+1);

% Equation (3)
M2 = sqrt(((gamma-1)*M1^2*sin(thetaA)^2 + 2) / (2*gamma*M1^2*sin(thetaA)^2 - (gamma-1))) / sin(thetaA - deltaA);
M3 = sqrt(((gamma-1)*M1^2*sin(thetaB)^2 + 2) / (2*gamma*M1^2*sin(thetaB)^2 - (gamma-1))) / sin(thetaB - deltaB);

fprintf('thetaA = %.4f deg\n', rad2deg(thetaA));
fprintf('thetaB = %.4f deg\n', rad2deg(thetaB));
fprintf('M2 = %.4f\n', M2);
fprintf('M3 = %.4f\n', M3);
fprintf('p2/p1 = %.4f\n', p2p1);
fprintf('p3/p1 = %.4f\n', p3p1);

% 2.6 answers

f = @(x) shock_refraction_residual(x(1), x(2), x(3), M2, M3, deltaA, deltaB, p2p1, p3p1);
J = @(f, x, h) numjac(f, x, h);

x0 = [0; deg2rad(40); deg2rad(35)];   % [phi; thetaC; thetaD]
[xs, info] = newton_sys(f, J, x0, 1e-6, 100);

x = xs(:, end);
phi = x(1);  thetaC = x(2);  thetaD = x(3);
p4p1 = p2p1 * (2*gamma*M2^2*sin(thetaC)^2 - (gamma-1)) / (gamma+1);

fprintf('phi    = %.4f deg\n', rad2deg(phi));
fprintf('thetaC = %.4f deg\n', rad2deg(thetaC));
fprintf('thetaD = %.4f deg\n', rad2deg(thetaD));
fprintf('p4/p1  = %.4f\n', p4p1);

% 2.7 3 initial guesses

guesses = [0 40 35; 0 80 80; 0 40 80; 0 80 35];   % degrees, one row per guess [phi thetaC thetaD]

for k = 1:size(guesses, 1)
    [xs, info] = newton_sys(f, J, deg2rad(guesses(k,:))', 1e-6, 100);
    fprintf('guess %d: converged=%d, iters=%d, [phi thetaC thetaD] = %s deg\n', k, info.converged, info.iterations, mat2str(rad2deg(xs(:,end))', 5));
end