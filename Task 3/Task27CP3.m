%Ta input [1;1] og [-1;-1] for å få de to resultatene
function x = Task27CP3(x)
    format long;
    
    while(1)
       s = linsolve(DF(x), -F(x));
       % Bryter hvis det vi får ut av å regne ut et steg til er mindre enn
       % ti desimaler
       if (max(abs(s)) < 5e-9)
          break; 
       end
       x = x + s;
    end
end

function f = F(x)
    f1 = x(1)^3-x(2)^3+x(1);
    f2 = x(1)^2 + x(2)^2 - 1;
    f = [f1;f2];
end

function DF = DF(x)
    DF = [3*x(1)^2+1 -3*x(2)^2; 2*x(1) 2*x(2)];
end