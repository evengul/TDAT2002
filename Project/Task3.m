function y = Task3(n)
    z = @(x) (0);                   % We solve the problem without any additional load to the board
    b = GetF_X(z, zeros(n, 1));     % We get the f(x) function that defines the bend in the board
    A = Task2(n);                   % We get the matrix of size n
    y = A\b;                        % We solve for y, and get a vector with the displacement in all x positions on the board
end