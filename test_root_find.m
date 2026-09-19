function test_root_find(Y)

f = @(x) cos(x) - x;
fprime = @(x) -sin(x) -1;
atol = 1e-6;
maxit = 1000;
interval = [0 1];

root = 0.7391;

root_test = abs(root - Y(f, fprime, interval, atol, maxit));

assert(root_test < 1e-3, 'Computed root differs by > tol')
disp('test successful');

end
    
