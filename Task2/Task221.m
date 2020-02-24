function [L, U] = Task221()
    a = [1 2 -1; 0 3 1; 2 -1 1];    
    b = [2; 4; 2];
    [L, U] = LUFactorisation(a, b);
    
end