function [] =  Task236()
    %Version two
    TwoA = [10^-20 1; 1 2];
    Twob = [1; 4];
    disp(NaiveGauss(TwoA, Twob));
    
    %Version 3
    ThreeA = [1 2; 10^-20 1];
    Threeb = [4;1];
    disp(NaiveGauss(ThreeA, Threeb));
end