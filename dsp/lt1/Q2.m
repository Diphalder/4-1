%a

% Define the time range
t = -2:0.01:2;

% Define the exponential signal
n = t;
x = exp(n);

% Plot the exponential signal using stem
stem(t, x)
title('Exponential Signal: e^n')
xlabel('Time')
ylabel('Amplitude')
grid on
