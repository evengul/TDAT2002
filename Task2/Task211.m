function G = Task211()
    a = [2 4 -2; -2 1 1; -1 -2 -1];    
    b = [-2; 1; -3];
    G = NaiveGauss(a, b);
end