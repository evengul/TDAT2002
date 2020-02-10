
function Task121 = Task121(f, x0, TOL)
    i = 0;
    while(true)
        Task121 = f(x0);
        fprintf('Old x: %.9f, new x: %.9f\n',x0,Task121);
        if (abs(Task121-x0)) < TOL; break; end
        i = i+1;
        x0 = Task121;
        if (i > 1000 || Task121 == Inf || Task121 == NaN)
            break;
        end
    end
end