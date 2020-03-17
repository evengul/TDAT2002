function [y_errors, error_enlargement, max_error] = Task5()  
    format long;
    n = 20;
    y_errors = zeros(11, 1);
    
    L = 2.0;            %Length of board [m]
    w = 0.30;           %Width of board [m]
    d = 0.03;           %Thickness of board [m]
    I = (w*d*d*d)/12;   %Area moment of inertia [m^4]
    E = 1.3e10;         %Young's modulus of wood [Pa]
    h = L / n;          %Length of each division [m]
    g = 9.81;           %Gravity constant [m/s^2]
    
    f = -480 * w * d * g;   %Constant f with no load on board
    
    error_enlargement = 0;
          
    for i = 1:11
        A = Task2(n);
        b = ones(n, 1) * f;     %A vector of n f's
        y = A\b;
        y = y * ((h * h * h * h) / E * I);
        y_errors(i) = abs(y(n) - correct_y_in_L());
                
        if (i > 1)
            possible_enlargement = y_errors(i) / y_errors(i-1);
            fprintf('Error enlargement of n=%i: %.9f\n', n, possible_enlargement);
            if (possible_enlargement > error_enlargement)
                error_enlargement = possible_enlargement;
            end
        end
        
        n = n * 2;
    end
    
    fprintf('Error size: \n');
       
end

function y = correct_y_in_L()
    L = 2.0;            %Length of board [m]
    w = 0.30;           %Width of board [m]
    d = 0.03;           %Thickness of board [m]
    I = (w*d*d*d)/12;   %Area moment of inertia [m^4]
    E = 1.3e10;         %Young's modulus of wood [Pa]
    g = 9.81;           %Gravity constant [m/s^2]
    
    f = -480 * w * d * g;   %Constant f with no load on board
    y = (f / (24*E*I))*L*L*(L*L-4*L*L+6*L*L);
end

