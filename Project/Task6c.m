function [] = Task6c()
    %Get the errors from the previous task
    y_errors = Task6b();
    %Plot the error on a chart where both axes are logarithmic
    loglog(y_errors(:, 1), y_errors(:,2));
end