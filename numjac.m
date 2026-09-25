function J = numjac(f,x,h)

x = x(:);
n = length(x);

f0 = f(x);
m = length(f0);

J = zeros(m,n);

for j = 1:n
    xh = x;
    xh(j) = xh(j) + h;
    J(:,j) = (f(xh)-f0)/h;
end

end
