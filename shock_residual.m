function x = shock_residual(delta, theta, M)

x = ((M*M.*sin(2.*theta) - 2.*cot(theta)) ./ (2 + M*M.*(1.4 + cos(2.*theta)))) - tan(delta);

end