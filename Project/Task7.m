function [] = Task7()
    format long;
    
    %NOTE: We have already tested one time, and found
    %that the best n lies between 320 and 640, which means we test between
    %these values now.
    
    %The container for y values. 
    y = zeros(32, 2);
    %The container for condition number of A * machine epsilon
    C = zeros(32, 1);
    %The container for h^2
    h_squared = zeros(32, 1);
    
    L = 2.0;    % L: The length of the board [m]
    
    fprintf('We do not know the correct y for this function');

    %For the first run, we saw that the cross between C and h_squared is
    %between 320 and 640, which means y is between 
    %-0.14321970679757184408
    %and 
    %-0.14261582828429084091
    %We try again between 320 and 640 to find the best n.
    for k = 32:64
        %We define n between 320 and 640
        n = 10*k;
        
        %We retrieve the matrix A for size n
        A = Task2(n);
        
        %We define the condition number of A * machine epsilon
        C(k) = condest(A) * eps;
        
        %We define h
        h = L / n;
        
        %We define h^2
        h_squared(k) = h^2;
        
        %The vectors of x with this n
        x_vector = zeros(n, 1);
        
        for i=1:n
           x_vector(i) = i * h; 
        end
        %Get the values of f(x) with the function defining the jumper on
        %the board, along with the values for x.
        b = GetF_X(@s2, x_vector);
        
        %We solve for y
        y_vector = A\b;
        
        %We define the y matrix as (position x, displacement y)
        y(k, 1) = n;
        y(k, 2) = y_vector(n);
        
        fprintf('\n n=%i -> y=%.20f\n', n, y(k, 2));
        
    end
    %We plot C against h^2, and look for a point where they cross. This
    %will give the best n, and we will also find the a y that is as correct
    %as possible here.
    loglog(y(:,1), C);
    hold on
    loglog(y(:,1), h_squared);
    %This gives a cross between C and h_squared in n=420.
    %The best y value we can find is 
    %y=-0.14293208423237216409
    %The beam is displaced about 14.293208423237216409cm when a person with
    %30cm long feet weighing 50kg stands on the board.
end

%The function defining the load of the jumper
function s2 = s2(x)
    g = 9.81;   %g: The gravity constant [m/s^2]
    L = 2.0;    %L: The length of the board [m]
    %if x is at the end of the board with the jumper on
    if (x >= L - 0.3 && x <= L)
       s2 = -g * (50/0.3); 
       return;
    end
    %if x is behind the jumper. (The task said 0<=x<=L-0.3, but that would
    %give two parts of the function that included L-0.3. We chose to give a
    %value to the exact value L-0.3, instead of 0. Since this is an
    %approximation, we believe this is the best choice of action.
    if (x >= 0 && x < L -0.3)
        s2 = 0;
        return;
    end
end
