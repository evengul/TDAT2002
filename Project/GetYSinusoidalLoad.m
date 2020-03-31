function y = GetYSinusoidalLoad(x)
    p = 100;                % p: [kg/m]
    g = 9.81;               % g: The gravity constant [m/s^2]
    L = 2.0;                % L: The length of the board [m]
    E = 1.3e10;             % E: The Young's modulus of the wood of the board [Pa]
    I = 0.3*0.03^3/12;      % I: The area moment of the inertia around the center of the beam [m*m^3]
    f = GetConstantF();     % f: The constant f value
    %y: The function representing the exact value of the displacement of y
    %at a position x, when the load is sinusoidal.
    y = (f/(24*E*I))*x^2*(x^2-4*L*x+6*L^2) - (g*p*L/(E*I*pi)*((L^3/pi^3)*sin((pi/L)*x) - x^3/6 + (L*x^2)/2 - (L^2*x) / pi^2));
end