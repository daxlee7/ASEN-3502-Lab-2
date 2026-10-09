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