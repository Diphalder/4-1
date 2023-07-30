% Define the time range
t = -2:0.01:2;

% Define the exponential signal
n = t;
x = exp(n);

% Perform downsampling with a scaling factor of 2
scaling_factor = 2;
downsampled_t = t(1:scaling_factor:end);
downsampled_x = x(1:scaling_factor:end);

% Plot the original and downsampled signals in subplots
subplot(2, 1, 1)
plot(t, x)
title('Original Exponential Signal')
xlabel('Time')
ylabel('Amplitude')
grid on

subplot(2, 1, 2)
stem(downsampled_t, downsampled_x)
title('Downsampled Exponential Signal')
xlabel('Time')
ylabel('Amplitude')
grid on
