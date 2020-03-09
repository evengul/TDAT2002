function y = Task3(n)

    L = 2.0;            %Length of board [m]
    w = 0.30;           %Width of board [m]
    d = 0.03;           %Thickness of board [m]
    I = (w*d*d*d)/12;   %Area moment of inertia [m^4]
    E = 1.3e10;         %Young's modulus of wood [Pa]
    h = L / n;          %Length of each division [m]
    g = 9.81;           %Gravity constant [m/s^2]
    
    f = -480 * w * d * g;   %Constant f with no load on board
    
    b = ones(n, 1) * f;     %A vector of n f's
    A = Task2(n);           %A matrix for solving Ay=f
    y = A\b;                %Solving for y
    disp(y);
    y = y * ((h * h * h * h) / E * I);  %All elements are multiplied with h^4/EI
end