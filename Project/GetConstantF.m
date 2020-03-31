function f = GetConstantF()
    %The constant f value is defined by -480 * width of the beam (0.3m) * height
    %of the beam (0.03m) * gravity constant (9.81m/s^2)
    f = -480 * 0.30 * 0.03 * 9.81;
end