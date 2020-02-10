function Task045 = Task045()
    a = 3344556600;
    b = 1.2222222;
    c = sqrt(a^2+b^2);
    fprintf('Hypotenuse: %i. c - a: %i\n', c, c - a);
    x = (((a^2+b^2)^0.5-a)*((a^2+b^2)^0.5)+a)/((a^2+b^2)^0.5 + a);
    fprintf('Answer: %i\n', x);
end