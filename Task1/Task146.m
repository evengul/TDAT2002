function Task146(decimalDigits, x0)
    maxError = 0.5*10^-(decimalDigits);
    r=x0;
    i=0;
    fprintf('r0=1\n');
    while(not(Df(r)==0))
       newr = newton(r);
       i = i + 1;
       fprintf('r%i = %f\n', i, newr);
       if(abs(newr-r)<maxError)
          break; 
       end
       r = newr;
    end
end

function y = f(r)
    y = (10/3)*pi*r^2 + (2/3)*pi*r^3 - 60;
end

function y = Df(r)
    y = (20/3)*pi*r + 2*pi*r^2;
end

function newr = newton(oldr)
    newr = oldr - (f(oldr)/Df(oldr));
end
