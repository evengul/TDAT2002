function [] = Task6c()
    y_errors = Task6b();
    loglog(y_errors(:, 1), y_errors(:,2));
end