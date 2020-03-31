function [y, y_4] = Task4c()
    % Container for y at position x
    y = zeros(10, 1);
    index = 1;
    %For i =0.2 to 2.0 with step=0.2
    h = 0.2;    %h: step length between each position x [m]
    L = 2.0;    %L: Length of board [m]
    for i = h:h:L
        %Get and store the y value at this position
        y(index) = getY(i);
        index = index + 1;
    end
    
    disp(y);    
    %Get the matrix A at n=10
    A = Task2(10);
    %Calculate the fourth derivative of y
    y_4 = (1/(h^4))*A*y;
    disp(y_4);
end

function y = getY(x)
    L = 2.0;            %Length of board [m]
    w = 0.30;           %Width of board [m]
    d = 0.03;           %Thickness of board [m]
    I = (w*d*d*d)/12;   %Area moment of inertia [m^4]
    E = 1.3e10;         %Young's modulus of wood [Pa]
    g = 9.81;           %Gravity constant [m/s^2]
    
    f = -480 * w * d * g;   %Constant f with no load on board
    
    %Exact displacement y at position x
    y = (f / (24 * E * I)) * x * x * (x * x - 4 * L * x + 6 * L * L);
end