function taskOne = taskOne()
    x = nest(50, ones(50), 1.00001);
    fprintf('Nest: %i\n', x);
    y = Q(1.00001);
    fprintf('Q: %i\n', y);
    fprintf('Error: %i\n', x - y);
end