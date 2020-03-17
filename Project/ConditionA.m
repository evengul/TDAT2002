function C = ConditionA(n)
    A = Task2(n);
    A_Inf = MaxRowSum(A);
    A_inv = inv(A);
    A_inv_INF = MaxRowSum(A_inv);
    C = A_Inf * A_inv_INF;
    disp(C);
end

function s = MaxRowSum(A)
    s = -Inf;
    [n, m] = size(A);
    for rowIndex = 1:m
       rowSum = A(rowIndex, 1);
       for colIndex = 2:n
           rowSum = rowSum + A(rowIndex, colIndex);
       end
       if (rowSum > s)
          s = rowSum; 
       end
    end
end