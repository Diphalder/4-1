% Define the time range
t = -2:0.01:2;

% Define the exponential signal
n = t;
x = exp(n);

% Shift the signal by 0.5 to the left
x_shifted_left = exp(n - 0.5);

% Shift the signal by 0.5 to the right
x_shifted_right = exp(n + 0.5);

% Plot the original exponential signal using plot
subplot(3, 1, 1)
plot(t, x)
title('Original Exponential Signal')
xlabel('Time')
ylabel('Amplitude')
grid on

% Plot the shifted exponential signal (left) using stem
subplot(3, 1, 2)
stem(t, x_shifted_left)
title('Shifted Exponential Signal (Left)')
xlabel('Time')
ylabel('Amplitude')
grid on

% Plot the shifted exponential signal (right) using stem
subplot(3, 1, 3)
stem(t, x_shifted_right)
title('Shifted Exponential Signal (Right)')
xlabel('Time')
ylabel('Amplitude')
grid on

