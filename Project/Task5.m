function [y_errors] = Task5() 
    % We want a lot of decimal places, and the possibility of large numbers
    format long;
    
    % y is the y at the end of the board with a different amount of
    % divisons n
    y = zeros(11, 2);
    % y_errors is the error for y with n divisions
    y_errors = zeros(11, 2);
    
    % We print the correct y value
    fprintf('Correct y: %.20f\n', GetYNoLoad());
    
    % For 20...10*2^11
    for k = 1:11
        % Set the n-value
        n = 10*2^k;
        
        % Get the matrix of size n. This is only used for the condition
        % number in this case
        A = Task2(n);
              
        % Do Task3 again, of size n.
        y_vector = Task3(n);
        
        % Set the x-value of the y-matrix (position, displacement)
        y(k, 1) = n;
        % Set the y-value of the y-matrix
        y(k, 2) = y_vector(n);
        
        fprintf('\n n=%i -> y=%.20f\n', n, y(k, 2));
        
        % Set the error. Correct y is defined in GetYNoLoad()
        y_errors(k, 1) = n;
        y_errors(k, 2) = abs(GetYNoLoad() - y(k, 2));
        
        fprintf('Error at n=%i: %.20f\n', n, y_errors(k, 2));
        
        if (k > 1)
           fprintf('Error compared to previous error: %.20f\n', (y_errors(k, 2) / y_errors(k - 1, 2)));
           fprintf('Condition number of this n: %.3f\n', condest(A) * eps);
        end
    end
end

