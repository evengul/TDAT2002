function [L, U] = LUFactorisation(a, b)
    a = [a b];
    [n, m] = size(a);
    
    L = diag(ones(n, 1));
    
    for j = 1 : n - 1
        if abs(a(j,j))<eps; error('zero pivot encountered'); end
    
        for i = j + 1 : n
           mult = a(i,j)/a(j,j);
           L(i, j) = mult;
           for k = j : m
                a(i,k) = a(i,k) - mult*a(j,k);
           end
        end
    end
    
    U = a(:,1:n);
end