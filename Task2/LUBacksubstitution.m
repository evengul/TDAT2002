function x = LUBacksubstitution(L, U, b)
    
    [n, ~] = size(L);
    c = zeros(n, 1);
    %Lc=b
    c(1) = b(1);
    for i = 2 : n
        c(i) = b(i) - L(i, 1:i-1)*c(1:i-1);
    end
        
    
    %Uc=x
    x = zeros(n, 1);
    x(n) = c(n)/U(n,n);
    for i = n - 1 : -1 : 1
        x(i) = (c(i)-U(i, i+1:n)*x(i+1:n))/U(i,i);
    end
   
    
end