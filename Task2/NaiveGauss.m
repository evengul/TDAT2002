function x = NaiveGauss(a, b)
    a = [a b];
    [n, m] = size(a);
    
    for j = 1 : n - 1
        if abs(a(j,j))<eps; fprintf('zero pivot encountered\n'); end
    
        for i = j + 1 : n
           mult = a(i,j)/a(j,j);
           for k = j : m
                a(i,k) = a(i,k) - mult*a(j,k);
           end
        end
    end
            
    b = a(:,m);
        
    x=zeros(n, 1);
    x(n) = b(n)/a(n,n);
    for i = n - 1:-1:1
       x(i) =(b(i)-a(i,i+1:n)*x(i+1:n))/a(i,i); 
    end
end