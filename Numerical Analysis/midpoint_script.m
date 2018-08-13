% Initial setup
R = 10^3;
C = 100 * 10^(-9);
q0 = 500 * 10 ^(-9);
tf = 1 * 10 ^ (-3);
h = 10^(-5);


% Heaviside
figure;
stepsignal = @(t) (2.5);
[t, vout] = midpoint(stepsignal, C, R, h, tf, q0);
plot(t, vout);
ylim([0.0, 5.0])
grid;
xlabel('Time (s)')
ylabel('Vout (V)')
title('Response to step signal with Vin = 2.5V');

% Exponentials
figure;
tau = 100 * 10 ^ (-6);
decaysignal = @ (t) (2.5 * exp(-(( t ^ 2)/tau^2)));
[t, vout] = midpoint(decaysignal, C, R, h, tf, q0);
plot(t, vout);
hold on;

decaysignal = @ (t) (2.5 * exp((-t)/tau));
[t, vout] = midpoint(decaysignal, C, R, h, tf, q0);
plot(t, vout);

grid;
xlabel('Time (s)');
ylabel('Vout (V)');
legend('Vin = exp(-t^2/\tau)', 'Vin = exp(-t/\tau)');
title('Exponential decay signals');

% Sinusoids
tf = 1 * 10 ^ (-3);
figure;
sinein = @ (t) (sin(t * 2 * pi * 100000) * 5);
[t, vout] = midpoint(sinein, C, R, h / 50, tf, q0);
plot(t, vout);
hold on;

sinein = @ (t) (sin(t * 2 * pi * 10000) * 5);
[t, vout] = midpoint(sinein, C, R, h / 50, tf, q0);
plot(t, vout);
hold on;

sinein = @ (t) (sin(t * 2 * pi * 2000) * 5);
[t, vout] = midpoint(sinein, C, R, h, tf, q0);
plot(t, vout);

sinein = @ (t) (sin(t * 2 * pi * 1000) * 5);
[t, vout] = midpoint(sinein, C, R, h, tf, q0);
plot(t, vout);

grid;
xlabel('Time (s)');
ylabel('Vout (V)');
legend('T = 10 \mus', 'T = 100 \mus', 'T = 500 \mus', 'T = 1000 \mus');
title('Response to sinusoidal');

%Square waves
tf = 1.5 * 10 ^ (-3);
figure;
squarein = @ (t) (square(t * 2 * pi * 100000) * 5);
[t, vout] = midpoint(squarein, C, R, h / 50, tf, q0);
plot(t, vout);
hold on;

squarein = @ (t) (square(t * 2 * pi * 10000) * 5);
[t, vout] = midpoint(squarein, C, R, h / 50, tf, q0);
plot(t, vout);
hold on;

squarein = @ (t) (square(t * 2 * pi * 2000) * 5);
[t, vout] = midpoint(squarein, C, R, h, tf, q0);
plot(t, vout);

squarein = @ (t) (square(t * 2 * pi * 1000) * 5);
[t, vout] = midpoint(squarein, C, R, h, tf, q0);
plot(t, vout);

grid;
xlabel('Time (s)');
ylabel('Vout (V)');
ylim([-5.5, 5.5])
legend('T = 10 \mus', 'T = 100 \mus', 'T = 500 \mus', 'T = 1000 \mus');
title('Response to square wave');

%Sawtooth waves
tf = 1.5 * 10 ^ (-3);
figure;
sawin = @ (t) (sawtooth(t * 2 * pi * 100000) * 5);
[t, vout] = midpoint(sawin, C, R, h / 50, tf, q0);
plot(t, vout);
hold on;

sawin = @ (t) (sawtooth(t * 2 * pi * 10000) * 5);
[t, vout] = midpoint(sawin, C, R, h / 50, tf, q0);
plot(t, vout);
hold on;

sawin = @ (t) (sawtooth(t * 2 * pi * 2000) * 5);
[t, vout] = midpoint(sawin, C, R, h, tf, q0);
plot(t, vout);

sawin = @ (t) (sawtooth(t * 2 * pi * 1000) * 5);
[t, vout] = midpoint(sawin, C, R, h, tf, q0);
plot(t, vout);

grid;
xlabel('Time (s)');
ylabel('Vout (V)');
legend('T = 10 \mus', 'T = 100 \mus', 'T = 500 \mus', 'T = 1000 \mus');
title('Response to sawtooth wave');
