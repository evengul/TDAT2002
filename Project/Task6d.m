function [] = Task6d()
    %Get the errors from task 6b
    y_errors = Task6b();
    %Plot the error on a chart where both axes are logarithmic
    loglog(y_errors(:, 1), y_errors(:,2));
    %Freeze the scale of the plot
    hold on
    %Define all condition values for matrix A * machine epsilon
    C = zeros(11, 1);
    for i=1:11
       C(i) = condest(Task2(10*2^i)) * eps; 
    end
    %Plot the condition value in the same coordinate system as y_errors
    loglog(y_errors(:,1), C);

    %Define h^2 for all n as (L/n)^2
    h_squared = zeros(11,1);
    L = 2.0;
    for i = 1: 11
        h_squared(i) = L^2/(10*2^i);
    end
    loglog(y_errors(:,1), h_squared);
    %Plot h^2 in the same coordinate system as C and y_errors
end