function Task041a = Task041a()
    for i = 1:14
        fprintf('x=%i\n', 10^-i);
        fprintf('Version one: %i\n', (1-sec(10^-i))/(tan(10^-i)^2));
        fprintf('Version two: %i\n', -(1/(1+sec(10^-i))));
    end
end