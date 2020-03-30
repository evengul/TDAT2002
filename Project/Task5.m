function [y_errors] = Task5() 
    format long;
    
    y = zeros(11, 2);
    y_errors = zeros(11, 2);
    
    fprintf('Correct y: %.20f\n', GetYNoLoad());
    
    for k = 1:11
        n = 10*2^k;
        
        A = Task2(n);
              
        y_vector = Task3(n);
        
        y(k, 1) = n;
        y(k, 2) = y_vector(n);
        
        fprintf('\n n=%i -> y=%.20f\n', n, y(k, 2));
        
        y_errors(k, 1) = n;
        y_errors(k, 2) = abs(GetYNoLoad() - y(k, 2));
        
        fprintf('Error at n=%i: %.20f\n', n, y_errors(k, 2));
        
        if (k > 1)
           fprintf('Error compared to previous error: %.20f\n', (y_errors(k, 2) / y_errors(k - 1, 2)));
           fprintf('Condition number of this n: %.3f\n', condest(A));
        end
    end
end

