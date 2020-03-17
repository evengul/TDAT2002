function Task4d()
    % numeriske fjerdederiverte fra oppgave 4c)
    y_4 = -0.0048;
    % Eksakt fjerdederivert
    y4 = getY_4();
    
    % Finner foroverfeilen
    disp("Foroverfeil:");
    fwdErr = getForwardError(y4, y_4);
    disp(fwdErr);
    
    % Finner relativ foroverfeil
    disp("Relativ Foroverfeil:")
    relFwdErr = getRelFwdErr(y4, y_4);
    disp(relFwdErr);
    
    % Finner feilforstørringen
    disp("Finner feilforstørringen")
    relBackErr = 2^-52;
    feilF = (relFwdErr/relBackErr);
    disp(feilF);
    
    % Finner kondisjonstallet
    disp("Kondisjonstallet");
    A = Task2(10);
    kond = condest(A);
    disp(kond);
    
end

function x = getForwardError(y1, y2)
    x = abs(y1 - y2);
end

function x = getRelFwdErr(y1, y2)
    x = abs((y1 - y2)/y1);
end



function y = getY_4()
    L = 2.0;            %Length of board [m]
    w = 0.30;           %Width of board [m]
    d = 0.03;           %Thickness of board [m]
    I = (w*d*d*d)/12;   %Area moment of inertia [m^4]
    E = 1.3e10;         %Young's modulus of wood [Pa]
    g = 9.81;           %Gravity constant [m/s^2]
    
    f = -480 * w * d * g;   %Constant f with no load on board
    y = (f/(E*I));
end
