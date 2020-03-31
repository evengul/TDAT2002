function [y_errors] = Task6b() 
    format long;
    
    %The container for the displacement y at position x
    y = zeros(11, 2);
    %The container for the displacement error of y at position x
    y_errors = zeros(11, 2);
    
    L = 2.0;        % L: Length of the board [m]
    p = 100;        % p: [kg/m]
    g = 9.81;       % g: The gravity constant [m/s^2]
    
    % We print the correct y value for a sinusoidal load, defined in the
    % function GetYSinusoidalLoad(x)
    fprintf('Correct y at x=L: %.20f\n', GetYSinusoidalLoad(L));

    %For n=20...10*2^11
    for k = 1:11
        %Define n
        n = 10*2^k;
        
        %Get the matrix A
        A = Task2(n);
        
        %Define h as the steplength when n=10*2^k
        h = L / n;
        
        %The container for the steps
        x_vector = zeros(n, 1);
        
        for i=1:n
           x_vector(i) = i * h; 
        end
        
        %The function we add to f(x), representing the sinusoidal load
        s = @(x) (-p * g * sin((pi/L) *x));
              
        %Get the f(x) for each point in x, using the function s
        b = GetF_X(s, x_vector);
        
        %Solve for displacement y
        y_vector = A\b;
        
        %Set the y matrix (position x, displacement y)
        y(k, 1) = n;
        y(k, 2) = y_vector(n);
        
        fprintf('\n n=%i -> y=%.20f\n', n, y(k, 2));
        
        %Set the y error matrix (poisition x, displacement error y)
        y_errors(k, 1) = n;
        y_errors(k, 2) = abs(GetYSinusoidalLoad(L) - y(k, 2));
        
        fprintf('Error at n=%i: %.20f\n', n, y_errors(k, 2));
        
        if (k > 1)
           fprintf('Error compared to previous error: %.20f\n', (y_errors(k, 2) / y_errors(k - 1, 2)));
           fprintf('Condition number of this n: %.3f\n', condest(A));
        end
    end
    %Plot the correct sinusoidal load at x=L against the calculated values
    plot(ones(11, 1) * GetYSSinusoidalLoad(L), y(:,2));
end