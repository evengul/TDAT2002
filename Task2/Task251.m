function [] = Task251(n)
    e = ones(n, 1);
    D = spdiags(3*ones(n, 1), 0, n, n);
    L = spdiags(-ones(n, 1), 1, n, n);
    U = spdiags(-ones(n, 1), -1, n, n);
    A = L + D + U;
    
    b = ones(n, 1);
    b(1) = 2;
    b(n) = 2;
    
    s = 0;
    
    x = zeros(n, 1);
    x_correct = ones(n, 1);
    
    while(1)
       x = D\(b-(L+U)*x);
       s = s + 1;
       if max(abs(x-x_correct)) < 0.5e-6 
           break; 
       end
    end
    %for i = 1 : length(x)
        %fprintf('x_%i: %9f\n', i, x(i));
    %end
    e_f = max(abs(A*x-b));
    fprintf('Steps: %i\n', s);
    fprintf('Forwards error: %.25f\n', e_f);
end