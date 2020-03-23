%Beste midtpunkt mellom de tre sirklene er (0.410623, 0.055501)
function x = Task45CP1()
    x = [0;0];
    while(1)
        A = Dr(x);
        r = [r1(x); r2(x); r3(x)];
        s = linsolve(A'*A, -A'*r);
        if (abs(max(s)) < 5e-10)
            break;
        end
        x = x + s;
    end
end

function r1 = r1(x)
    r1 = sqrt(x(1)^2+(x(2)-1)^2)-1;
end

function r2 = r2(x)
    r2 = sqrt((x(1)-1)^2 + (x(2)-1)^2) -1;
end

function r3 = r3(x)
    r3 = sqrt(x(1)^2+(x(2)+1)^2) - 1;
end

function Dr = Dr(x)
    Dr1 = [(x(1) / sqrt(x(1)^2+(x(2)-1)^2)), ((x(2)-1) / sqrt(x(1)^2+(x(2)-1)^2))];
    Dr2 = [(x(1)-1) / sqrt((x(1)-1)^2 + (x(2)-1)^2), (x(2)-1) / sqrt((x(1)-1)^2+(x(2)-1)^2)];
    Dr3 = [x(1) / sqrt(x(1)^2+(x(2)+1)^2), (x(2)+1) / sqrt(x(1)^2 + (x(2)+1)^2)];
    Dr = [Dr1; Dr2; Dr3];      
end