function x = Task212(n)
    [I, J] = meshgrid(1:n, 1:n);
    H = 1./(I+J-1);
    b = ones(n, 1);
    x = NaiveGauss(H, b);
end