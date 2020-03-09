function y = Task5()
    i = 1;
    n = 0;
    z = 0;
    y = zeros(11, 1);
    while n <= pow2(10, 11)
       disp(n);
       n =  pow2(10, i);
       A = Task2(n);
       z = Task3(n);
       y(i) = sum(z);
       i = i + 1;
    end
    c2 = y(11) / y(10);
    fprintf("c2: %f", c2);
end

