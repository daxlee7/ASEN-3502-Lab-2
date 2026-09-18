clear; close; clc;

M = 3;

mu = asin(1/M);

theta = linspace(mu, deg2rad(90));

figure;

hold on;

y = shock_residual(deg2rad(10), theta, M);
plot(theta, y, "Blue");
xlabel("Theta (rad)");
ylabel("Shock residual");
grid on;
y = shock_residual(deg2rad(20), theta, M);
plot(theta, y, "Red");
y = shock_residual(deg2rad(30), theta, M);
plot(theta, y, "Green");
y = shock_residual(deg2rad(40), theta, M);
plot(theta, y, "Yellow");

legend('10 deg','20 deg','30 deg','40 deg')