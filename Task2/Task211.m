function G = Task211()
    a = [2 4 -2; -2 1 1; -1 -2 -1];    
    b = [-2; 1; -3];
    G = gauss(a, b);
    
end

function x = gauss(a, b)
    [n, m] = size(a);
    for j = 1 : n - 1
       for i = j + 1 : n
           mult = a(i,j) / a(j,j);
           for k = j : m
               a(i,k) = a(i,k) - a(j,k)*mult;
               b(j) = b(j) - a(j,k)*mult;
           end 
           
       end
    end
    
    disp([a b]);
    
    x = zeros(n, 1);    
    x(n) = b(n)/a(n,n);
    
    for i = n - 1 : -1 : 1
       x(i)=(b(i)-a(i, i+1:n)*x(i+1:n))/a(i,i);
    end
    
end