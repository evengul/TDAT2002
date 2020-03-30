function y = GetYSSinusoidalLoad(x)
    p = 100;
    g = 9.81;
    L = 2.0;
    E = 1.3e10;
    I = 0.3*0.03^3/12;
    f = GetConstantF();
    y = (f/(24*E*I))*x^2*(x^2-4*L*x+6*L^2) - (g*p*L/(E*I*pi)*((L^3/pi^3)*sin((pi/L)*x) - x^3/6 + (L*x^2)/2 - (L^2*x) / pi^2));
end