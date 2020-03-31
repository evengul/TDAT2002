function y = GetYNoLoad()
    %We get the constant f value
    f = GetConstantF();
    E = 1.3e10;                 % E: Young's modulus of this wood [Pa=N/m^2]
    I = 0.3*0.03^3/12;          % I: Area moment of inertia around the center of mass of the beam [m*m^3]
    L = 2.0;                    % L: The length of the beam [m]
    y = (f / (24*E*I))*3*L^4;   % y: The constant displacement of the beam in x=L with no additional load on the beam
end