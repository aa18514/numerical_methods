% Runge-Kutta fourth-order approximation for a second order ODE
function [x_next, y_next] = rukasecond(fx, fy, ti, xi, yi, h)
% ti, xi and yi - values of currently known point; x'=y
% h - time step
% fx and fy - x' and y'

% Make a 4th order prediction for the i+1 values of x and y
k1x=feval(fx,ti,xi,yi);
k1y=feval(fy,ti,xi,yi);

k2x=feval(fx,ti+h/2,xi+h*k1x/2,yi+h*k1y/2);
k2y=feval(fy,ti+h/2,xi+h*k1x/2,yi+h*k1y/2);

k3x=feval(fx,ti+h/2,xi+h*k2x/2,yi+h*k2y/2);
k3y=feval(fy,ti+h/2,xi+h*k2x/2,yi+h*k2y/2);

k4x=feval(fx,ti+h,xi+h*k3x,yi+h*k3y);
k4y=feval(fy,ti+h,xi+h*k3x,yi+h*k3y);

% Find the i+1 values for x and y basing on the average of the predictions 
x_next = xi + h/6*(k1x + 2*k2x + 2*k3x + k4x);  % evaluation for next x
y_next = yi + h/6*(k1y + 2*k2y + 2*k3y + k4y);  % evaluation for next y

