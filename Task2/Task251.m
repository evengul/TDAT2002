function [] = Task251(n)
    e = ones(n, 1);
    m = spdiags([-e 3*e -e], -1:1, n, n);
    
    b = ones(n, 1);
    b(1) = 2;
    b(n) = 2;
    
    s = 0;
    e_b = 0;
    
    d = diag(m);
    r = m - diag(d);
    x = zeros(n, 1);
    while abs(sum(x-(ones(n, 1)))) > 5* 10^-6
       x = (b-r*x)./d; 
       s = s + 1;
       e_b = abs(max(x - ones(n, 1)));
    end
    for i = 1 : length(x)
        fprintf('x_%i: %9f\n', i, x(i));
    end
    fprintf('Steps: %i\n', s);
    fprintf('Backwards error: %9f\n', e_b);
end