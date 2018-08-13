%properties of the second order ODE we solve using numerical analysis
A = 1; B = 0; C = 0; %coefficients 
t0 = 0; tf = 10; x0 = 0; xf = 5; %boundary conditions
func=@(ta)ta; %RHS

h=0.5; %interval
N=round((tf - t0)/h); %number of samples
t=t0:h:tf; %array of t-values from t0 to tf, steps of size h

%derived equations 
a =  (A/(h^2)) - (B/(2*h));
b = (-(2*A)/h^2) + C; 
c = (A/(h^2)) + (B/(2*h));

vec=t0:h:tf;    
u0=x0; uf=xf; %boundary conditions

for i = 2: N-1  %setting up the RHS of the system of equations
vec(i) = func(t(i)); 
end
vec(1) = func(t(1)) - a*u0; 
vec(N) = func(t(N-1)) - c*uf;

y=solvetridiag(N-1,a,b,c,vec); %solve tridiagonal matrix gives
p=[u0;y;uf]; %add u0 and uf boundary conditions to solution

figure;
plot(t,p,'b*'); %plot u against t
xlabel('time/s')
ylabel('x')