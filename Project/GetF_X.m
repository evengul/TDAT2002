function f = GetF_X(s, x)
    L = 2.0;
    [n, ~] = size(x);
    h = L / n;
    E = 1.3e10;
    I = 0.3*0.03^3/12;
    f = ones(n, 1) * GetConstantF;
    
    for i=1:n
        f(i) = (f(i) + s(x(i))) * (h^4/(E*I));
    end
end