function [] = Task222()
    Aa = [3 1 2; 6 3 4;3 1 5];
    ba = [0; 1; 3;];
    
    Ab = [4 2 0; 4 4 2; 2 2 3];
    bb = [2; 4; 6];
   
    
    [La, Ua] = LUFactorisation(Aa, ba);
    [Lb, Ub] = LUFactorisation(Ab, bb);
    
    a = LUBacksubstitution(La, Ua, ba);
    b = LUBacksubstitution(Lb, Ub, bb);
    
    fprintf('a) \n');
    disp(a);
    fprintf('b) \n');
    disp(b);
end