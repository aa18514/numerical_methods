R = 1000;
C = 10^-7;
h = 1*10^-7;
t_f = 0.001;
qc_0 = 5*10^-7;

w = 2*pi*10000;
vin = @(t)(5*cos(w*t)); 
[t_approx,v_out_approx] = midpoint(vin,C,R,h,t_f,qc_0);
A = 5*C/(1+(R*C*w)^2);
B = qc_0 - A;
v_out_exact = (A*(cos(w*t_approx) + w*R*C*sin(w*t_approx)) + B*exp(-t_approx/(R*C)))/C
plot(t_approx,v_out_approx,'b');

hold on;

plot(t_approx,v_out_exact,'r'); 
title ('Cosine Wave w/ T = 100us & Amplitude = 5V');
xlabel ('Time (s)');
ylabel ('Vout (V)');

figure;

plot(t_approx,v_out_exact - v_out_approx);
title('Error plot');
xlabel('Time (s)');
ylabel('Error');

figure;
h = 0.000001:0.000001:0.00001
for i = 1:10
    [t_approx,v_out_approx] = midpoint(vin,C,R,h(i),t_f,qc_0);
    A = 5*C/(1+(R*C*w)^2);
    B = qc_0 - A;
    v_out_exact = (A*(cos(w*t_approx) + w*R*C*sin(w*t_approx)) + B*exp(-t_approx/(R*C)))/C;
    error(i) = max(abs(vpa(v_out_exact) - vpa(v_out_approx))); 
end
plot(log(h), log(error));
hold on;
plot(log(h), 2*log(h)+ 18,'r');%shows that it is of O(h^2), 18 is rounded y-intercept value
xlabel('Step Size = h');
ylabel('Error');
