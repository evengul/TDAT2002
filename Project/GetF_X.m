%Function to return f(x) with an additional load s
function f = GetF_X(s, x)
    L = 2.0;            %L: Length of the board [m]
    [n, ~] = size(x);   %The amount of positions x we have
    h = L / n;          %The step length between each position x
    E = 1.3e10;         % E: Young's modulus of this wood [Pa=N/m^2]
    I = 0.3*0.03^3/12;  % I: Area moment of inertia around the center of mass of the beam [m*m^3]
    %Get n f values
    f = ones(n, 1) * GetConstantF;
    
    %For every value in x, add the function value s(x_i) to the constant f
    %before multiplying with h^4/(E*I)
    for i=1:n
        f(i) = (f(i) + s(x(i))) * (h^4/(E*I));
    end
end