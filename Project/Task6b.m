function [y_errors] = Task6b() 
    format long;
    
    y = zeros(11, 2);
    y_errors = zeros(11, 2);
    
    L = 2.0;
    p = 100;
    g = 9.81;
    
    fprintf('Correct y at x=L: %.20f\n', GetYSSinusoidalLoad(L));

    for k = 1:11
        n = 10*2^k;
        
        A = Task2(n);
        
        h = L / n;
        
        x_vector = zeros(n, 1);
        
        for i=1:n
           x_vector(i) = i * h; 
        end
        
        s = @(x) (-p * g * sin((pi/L) *x));
              
        b = GetF_X(s, x_vector);
        
        y_vector = A\b;
        
        y(k, 1) = n;
        y(k, 2) = y_vector(n);
        
        fprintf('\n n=%i -> y=%.20f\n', n, y(k, 2));
        
        y_errors(k, 1) = n;
        y_errors(k, 2) = abs(GetYSSinusoidalLoad(L) - y(k, 2));
        
        fprintf('Error at n=%i: %.20f\n', n, y_errors(k, 2));
        
        if (k > 1)
           fprintf('Error compared to previous error: %.20f\n', (y_errors(k, 2) / y_errors(k - 1, 2)));
           fprintf('Condition number of this n: %.3f\n', condest(A));
        end
    end
    plot(ones(11, 1) * GetYSSinusoidalLoad(L), y(:,2));
end