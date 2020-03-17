function [y, y_errors, error_enlargement] = Task5()  
    format long;
    n = 20;
    y = zeros(11, 1);
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
        y_vector = A\b;
        if (i == 1)
            disp(A\b);
        end
       
        y_vector = y_vector * ((h * h * h * h) / E * I);
        
        h = L / n;
        
        for j = 1:n
           x = h * j;
           y_vector(j)= y_vector(j) +s(x);
        end
        y(i) = y_vector(n);
        y_errors(i) = abs(y(i) - correct_y_in_L());
        
        fprintf('y at n=%i:%.20f\n', n, y(i));
                
        if (i > 1)
            possible_enlargement = y_errors(i) / y_errors(i-1);
            fprintf('Error enlargement of n=%i: %.20f\n', n, possible_enlargement);
            if (possible_enlargement > error_enlargement)
                error_enlargement = possible_enlargement;
            end
        end
        
        n = n * 2;
    end
    
    plot(ones(size(y)) * correct_y_in_L, y);
    
    fprintf('Error size: \n');
end

function y = correct_y_in_L()
    L = 2.0;            %Length of board [m]
    w = 0.30;           %Width of board [m]
    d = 0.03;           %Thickness of board [m]
    I = (w*d*d*d)/12;   %Area moment of inertia [m^4]
    E = 1.3e10;         %Young's modulus of wood [Pa]
    g = 9.81;           %Gravity constant [m/s^2]
    p = 100;
    
    f = -480 * w * d * g;   %Constant f with no load on board
    y = (f / (24*E*I))*L*L*(L*L-4*L*L+6*L*L);
    y = y - ((g * p * L) / (E*I*3.14))*(L^3/pi^3*sin(pi)-L^3/6+L^3/2-L^3/pi^2);
end

function s = s(x)
    p = 100.0;
    g = 9.81;
    L=2.0;
    s = -p*g*sin((pi/L)*x);
end

