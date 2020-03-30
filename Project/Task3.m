function y = Task3(n)
        
    z = @(x) (0);       % What we add to f to get f(x)
        
    b = GetF_X(z, zeros(n, 1));     %A vector of n f's
    A = Task2(n);           %A matrix for solving Ay=f
    y = A\b;                %Solving for y
end