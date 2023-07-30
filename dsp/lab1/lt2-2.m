f = 6;            
t = 0:1/100:1;
x = cos(2*pi*f*t + pi/6) + i*sin(2*pi*f*t + pi/6);
figure;
plot(t, real(x), 'b', t, imag(x), 'r' );
xlabel('time (s)');
ylabel('amplitude');
title('complex sinusoidal signal');
legend('real Part', 'imaginary Part');
