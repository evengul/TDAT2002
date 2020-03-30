function [] = Task6cd()
    y_errors = Task6b();
    L = 2.0;
    hold on
    %loglog(y_errors(:,1), y_errors(:,2));
    A = zeros(11, 1);
    for i = 1:11
       A(i) = condest(Task2(y_errors(i, 1))) * eps;
    end
    loglog(y_errors(:,1), A);
    loglog(y_errors(:,1), L^2/y_errors(:,1).^2);
    hold off
    fprintf('Line 1:\n ');
    disp(y_errors);
    fprintf('Line 2: \n');
    disp([y_errors(:,1), A]);
    fprintf('Line 3: \n');
    disp([y_errors(:,1), L^2./y_errors(:,1).^2]);
end

