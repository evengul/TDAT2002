function [] = Task6d()
    y_errors = Task6b();
    loglog(y_errors(:, 1), y_errors(:,2));
    hold on
    C = zeros(11, 1);
    for i=1:11
       C(i) = condest(Task2(10*2^i)) * eps; 
    end
    loglog(y_errors(:,1), C);

    h_squared = zeros(11,1);
    L = 2.0;
    for i = 1: 11
        h_squared(i) = L^2/(10*2^i);
    end
    loglog(y_errors(:,1), h_squared);
end