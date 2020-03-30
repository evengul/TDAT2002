function y = GetYNoLoad()
    f = GetConstantF();
    E = 1.3e10;
    I = 0.3*0.03^3/12;
    L = 2.0;
    y = (f / (24*E*I))*3*L^4;
end