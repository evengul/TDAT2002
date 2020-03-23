function [] = Task42CP3()
    P = [1960 3039585530; 
        1970 3707475887; 
        1990 5281653820; 
        2000 6079603571];
    
    actual1980 = 4434682000.00; 
    [cExp, RMSEExp] = fitExp(P);
    
    fprintf('Best fitting exponential function: y=%.9fe^(%.3fx) \n', cExp(1), cExp(2));
    fprintf('RMSE of function: %.3f\n', RMSEExp);
    line1980 = cExp(1)*exp(cExp(2)*1980);
    fprintf('y_exp(1980)=%.3f | Error: %.3f | Relative forward error:%.3f\n\n', line1980, abs(line1980 - actual1980), abs(line1980 - actual1980) / actual1980); 
end

function [cExp, RMSEExp] = fitExp(P)
    A = [1 P(1, 1); 1 P(2, 1); 1 P(3, 1); 1 P(4, 1)];
    b = [log(P(1, 2)); log(P(2,2)); log(P(3,2)); log(P(4,2))];
    [cExp, RMSEExp] = fit(A, b);
    cExp(1) = exp(cExp(1));
    disp(cExp);
    disp(RMSEExp);
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