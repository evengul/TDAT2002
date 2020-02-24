function G = Task211()
    a = [1 2 -1; 0 3 1; 2 -1 1];    
    b = [2; 4; 2];
    G = NaiveGauss(a, b);
end