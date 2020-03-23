function [] = Task41CP3()
    P = [1960 3039585530; 
        1970 3707475887; 
        1990 5281653820; 
        2000 6079603571];
    %Fra wikipedia, 
    %brukes bare for å sjekke om utregnigner er ca riktig
    actual1980 = 4434682000.00; 
    
    [cLine, RMSELine] = fitLine(P);
    fprintf('Best fitting line: y=%.3f + %.3fx\n', cLine(1), cLine(2));
    fprintf('RMSE of line: %.3f\n', RMSELine);
    line1980 = cLine(1) + cLine(2)*1980;
    fprintf('y_line(1980)=%.3f | Error: %.3f | Relative forward error:%.3f\n\n', line1980, abs(line1980 - actual1980), abs(line1980 - actual1980) / actual1980); 
    
    [cParabola, RMSEParabola] = fitParabola(P);
    fprintf('Best fitting line: y=%.3f + %.3fx + %.3fx^2\n', cParabola(1), cParabola(2), cParabola(3));
    fprintf('RMSE of line: %.3f\n', RMSEParabola);
    parabola1980 = cParabola(1) + cParabola(2)*1980 + cParabola(3)*1980^2;
    fprintf('y_parabola(1980)=%.3f | Error: %.3f | Relative forward error:%.3f\n\n', parabola1980, abs(parabola1980 - actual1980), abs(parabola1980 - actual1980) / actual1980); 
    
    fprintf('Results: The parabola is the best fit, with a low relative forward error, and almost half the RMSE.');
end

function [c, RMSELine] = fitLine(P)
    A = [1 P(1, 1); 1 P(2, 1); 1 P(3, 1); 1 P(4, 1)];
    b = [P(1, 2); P(2, 2); P(3, 2); P(4, 2)];
    c = linsolve(A'*A, A'*b);
    RMSELine = RMSE(A, b, c, 4);
end

function [c, RMSEParabola] = fitParabola(P)
    A = [1 P(1, 1) P(1, 1)^2; 1 P(2, 1) P(2, 1)^2; 1 P(3, 1) P(3, 1)^2; 1 P(4, 1) P(4, 1)^2];
    b = [P(1, 2); P(2, 2); P(3, 2); P(4, 2)];
    [c, RMSEParabola] = fit(A, b);
end

function [c, RMSE_value] = fit(A, b)
    c = linsolve(A'*A, A'*b);
    RMSE_value = RMSE(A, b, c, 4);
end

function RMSE = RMSE(A, b, c, n)
    r = b - A*c;
    SE = norm(r)^2;
    RMSE = sqrt(SE/n);
end
