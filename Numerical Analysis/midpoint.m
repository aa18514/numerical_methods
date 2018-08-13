function [t, vout] = midpoint(vin, C, R, h, tf, q0)
    ti = 0;                             
    N = round((tf - ti)/h);             % Number of steps
    vout=zeros(1, N); t=zeros(1, N);    % Array allocations

    t(1) = ti; vout(1) = q0/C;          % Initial 'component' states
    func = @(t, vout) (feval(vin, t) - vout) / (R * C);  % Circuit description
        
    for j = 1:N-1
        k1 = h * feval(func, t(j), vout(j));                        % Preparing
        k2 = h * feval(func, t(j) + 0.5 * h, vout(j) + 0.5 * k1);   % variables
        vout(j + 1) = k2 + vout(j);     % Generating output
        t(j + 1) = t(j) + h;            % Incrementing t by the step size
    end
    