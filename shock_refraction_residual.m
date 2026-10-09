function f = shock_refraction_residual(phi, thetaC, thetaD, M2, M3, deltaA, deltaB, p2p1, p3p1)
gamma = 1.4;

deltaC = deltaA - phi;
deltaD = deltaB + phi; 

f1 = shock_residual(deltaC, thetaC, M2);
f2 = shock_residual(deltaD, thetaD, M3);

p4_p2  = (2*gamma*M2^2*sin(thetaC)^2 - (gamma-1)) / (gamma+1);
p4p_p3 = (2*gamma*M3^2*sin(thetaD)^2 - (gamma-1)) / (gamma+1);

f3 = p2p1*p4_p2 - p3p1*p4p_p3;

f = [f1; f2; f3];
end