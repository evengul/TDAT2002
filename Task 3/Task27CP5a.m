%Newtons metode til å finne:
%To punkter tre kuler har til felles
%[1/3, 1/3, 1/3] kan finnes ved å ha P=[0 0 0]
%[1 1 1] kan finnes ved å ha P=[1 1 1]
function P = Task27CP5a(P)
    C = [1 1 0; 1 0 1; 0 1 1;];
    R = [1;1;1];
    
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