clc
clear
close all

function f = shock_refraction_residual(phi, thetaC, thetaD, M2, M3, deltaA, deltaB, p2p1, p3p1)
gamma = 1.4; % cp/cv = 1.4

deltaC = deltaA - phi; % relationship given
deltaD = deltaB + phi; % relationship given

f1 = shock_residual(deltaC, thetaC, M2); % Reusing function shock_residual
f2 = shock_residual(deltaD, thetaD, M3);

p4_p2  = (2*gamma*M2^2*sin(thetaC)^2 - (gamma-1)) / (gamma+1); % Eq given for pd/pu
p4p_p3 = (2*gamma*M3^2*sin(thetaD)^2 - (gamma-1)) / (gamma+1);

f3 = p2p1*p4_p2 - p3p1*p4p_p3;

f = [f1; f2; f3];
end

f = @(x) shock_refraction_residual(phi, thetaC, thetaD, M2, M3, deltaA, deltaB, p2p1, p3p1);

