function df = shock_derivative(delta, theta, M)
    
    gamma = 1.4;

    % Functions
    N = M^2 * sin(2*theta) - 2*cot(theta);
    D = 2 + M^2 * (gamma + cos(2*theta));

    % Derivatives
    dN = 2*M^2 * cos(2*theta) + 2 * (csc(theta))^2;
    dD = -2*M^2 * sin(2*theta);

    % Quotient Rule
    df = (dN .* D - N .* dD) ./ (D.^2);
end
