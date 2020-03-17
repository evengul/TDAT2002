function [y, y_4] = Task4c()
    y = zeros(10, 1);
    index = 1;
    for i = 0.2:0.2:2.0
        y(index) = getY(i);
        index = index + 1;
    end
    
    disp(y);    
    A = Task2(10);
    y_4 = (1/(0.2*0.2*0.2*0.2))*A*y;
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
    
    y = (f / (24 * E * I)) * x * x * (x * x - 4 * L * x + 6 * L * L);
end