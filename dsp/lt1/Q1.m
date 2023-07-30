t = -2:0.01:2;

x1 = exp(t);
subplot(3, 2, 1);
plot(t, x1);
title('Exponential Signal');


x2 = t.*(t>=0);
subplot(3, 2, 2);
plot(t, x2);
title('Unit Ramp');


x3 = (t==0);
subplot(3, 2, 3);
plot(t, x3);
title('Unit Sample');


x4 = (t>=0);
subplot(3, 2, 4);
plot(t, x4);
title('Unit Step');

T = 0.125;  % Time period
phase = 0;  % Phase in degrees
f = 1/T;   % Frequency

x5 = sin(2*pi*f*t + deg2rad(phase));
subplot(3, 2, 5);
plot(t, x5);
title('Sinusoidal (Sine) Signal');

x6 = cos(2*pi*f*t + deg2rad(phase));
subplot(3, 2, 6);
plot(t, x6);
title('Sinusoidal (Cosine) Signal');


