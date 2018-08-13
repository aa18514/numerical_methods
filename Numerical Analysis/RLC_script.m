% Time variables
t_start = 0;                            % input start time
t_max = 0.05;                           % stop simulation here
del_t = 1e-5;                           % step size
steps = ceil((t_max-t_start)/del_t);    % calculate noumber of steps

% Circuit parameters
C = 3.5e-6;                     % input capacitance value
L = 0.6;                        % input inductance value
R = 250;                        % input resistance value

% Input waveforms. Uncomment only the one to be simulated
freq = 500;                       % input freq of sine/square waves

%fVin = @(t) 5*heaviside(t);        % Vin Heaviside
%fVin = @(t) 5*exp(-(t^2)/3));      % Vin Impulsive Signal with Decay
fVin = @(t) 5*sin(2*pi*freq*t);     % Vin Sine input
%fVin = @(t) 5*square(2*pi*freq*t); % Vin Square input

% Decompose the given second-order ODE in a system of 2 first-order ODEs
expr_dqdt = @(t,q,I) I;                         % I = dq/dt
expr_dIdt = @(t,q,I)(feval(fVin, t)-R*I-q/C)/L; % dI/dt: includes Vin expr

% Initialize arrays
Vin = zeros(1,steps+1);         % Vin values
qc = zeros(1,steps+1);          % qc values
I = zeros(1,steps+1);           % dq/dt values
t = zeros(1,steps+1);           % time axis

% Set initial conditions
Vin(1) = feval(fVin,t_start);   % initial value of Vin
qc(1) = 500e-9;                 % initial value of qc
I(1) = 0;                       % initial value of dq/dt
t(1) = t_start;                 % initial value of time

% Simulate circuit. Iteratively find next value of qc and I using
% rukasecond
for i = 1:steps,    
    t(i+1) = t_start + i*del_t;
    Vin(i+1) = feval(fVin, t(i+1));
    [qc(i+1), I(i+1)] = 
                rukasecond(expr_dqdt, expr_dIdt,t(i),qc(i),I(i),del_t); 
end

% % Generate plots
subplot(2,2,1), plot(t,Vin);
subplot(2,2,1), grid;
subplot(2,2,1), title('Vin against time');
subplot(2,2,1), ylabel('Vin /V');
subplot(2,2,1), xlabel('time /s');

subplot(2,2,2), plot(t,R*I);
subplot(2,2,2), grid;
subplot(2,2,2), title('Vout against time');
subplot(2,2,2), ylabel('Vout /V');
subplot(2,2,2), xlabel('time /s');

subplot(2,2,3), plot(t,qc);
subplot(2,2,3), grid;
subplot(2,2,3), title('Charge qc against time');
subplot(2,2,3), ylabel('qc /C');
subplot(2,2,3), xlabel('time /s');

subplot(2,2,4), plot(t,I);
subplot(2,2,4), grid;
subplot(2,2,4), title('Current I against time');
subplot(2,2,4), ylabel('currentI /A');
subplot(2,2,4), xlabel('time /s');
