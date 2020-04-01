function Task4d()
    % Numeric fourth derivative from task 4c
    [y, y_4] = Task4c();
    % Exact fourth derivative
    y4 = getY_4();
    
    % Forward error
    disp("Forward error:");
    fwdErr = getForwardError(y4, y_4);
    disp(fwdErr);
    
    % Relative forward error
    disp("Relative forward error:")
    relFwdErr = getRelFwdErr(y4, y_4);
    disp(relFwdErr);
    
    % Error enlargement
    disp("Error enlargement")
    relBackErr = 2^-52;
    feilF = (relFwdErr/relBackErr);
    disp(feilF);
    
    % Condition number
    disp("Condition number");
    A = Task2(10);
    kond = condest(A);
    disp(kond);
end

%Calculates the forward error between two values
function x = getForwardError(y1, y2)
    x = abs(y1 - y2);
end

%Calculates the relative forward error between two values
function x = getRelFwdErr(y1, y2)
    x = abs((y1 - y2)/y1);
end

%Calculates the exact fourth derivative of y 
function y = getY_4()
    w = 0.30;           %Width of board [m]
    d = 0.03;           %Thickness of board [m]
    I = (w*d*d*d)/12;   %Area moment of inertia [m^4]
    E = 1.3e10;         %Young's modulus of wood [Pa]
    
    f = GetConstantF();
    y = (f/(E*I));
end
