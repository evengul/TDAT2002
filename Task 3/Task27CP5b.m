%Newtons metode til å finne:
%To punkter tre kuler har til felles
%[ 1 2 3] kan finnes ved å ha P=[0 0 0]
%[1.888 2.444 2.111] kan finnes ved å ha P=[1 1 1]
function P = Task27CP5b(P)
    C = [1 -2 0; -2 2 -1; 4 -2 3;];
    R = [5;5;5];
    
    while(1)
       A = Dr(C, P);
       s = -(A'*A)\(A'*r(C, R, P));
       P = P + s';
       if (max(abs(s)) < .5e-6)
           break;
       end
    end
    
end

function S = S(C, P)
    S = sqrt(sum((C - P).^2, 2));
end

function r = r(C, R, P)
    r = S(C, P) - R;
end

function Dr = Dr(C, P)
    Dr = (P-C)./S(C, P);
end