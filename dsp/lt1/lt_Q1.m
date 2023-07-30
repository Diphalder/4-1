% input signals
x = [-8, 6, 1, 0, 4 , 0 , 0];
h = [0, 0 ,-3, 9, 0, 1, 7];
t = [ -2 , -1 , 0 , 1 , 2 ,3 ,4];


add = x + h;
sub = x - h;
mul = x .* h;
K = 1.4;
scalingK = K * x;


figure;
% Plot original signals
subplot(2, 2, 1);
plot(t,x);
title('Signal x(n)');
xlabel('time');
ylabel('value');
grid on
subplot(2, 2, 2);
stem(t,x);
title('Signal x(n)');
xlabel('time');
ylabel('value');
grid on
subplot(2, 2, 3);
plot(t,h);
title('Signal h(n)');
xlabel('time');
ylabel('value');
grid on
subplot(2, 2, 4);
stem(t,h);
title('Signal h(n)');
xlabel('time');
ylabel('value');
grid on


figure;

% a 
% addition 
subplot(2, 1, 1);
plot(t,add);
title('Add Result(plot)');
xlabel('time');
ylabel('value');
grid on
subplot(2, 1, 2);
stem(t,add);
title('Add Result(stem)');
xlabel('time');
ylabel('value');
grid on
figure;

%b
% subtraction
subplot(2, 1, 1);
plot(t,sub);
title('Sub Result (plot)');
xlabel('time');
ylabel('value');
grid on
subplot(2, 1, 2);
stem(t,sub);
title('Sub Result(stem)');
xlabel('time');
ylabel('value');
grid on
figure;

%c
% multiplication
subplot(2, 1, 1);
plot(t,mul);
title('Mul Result (plot)');
xlabel('time');
ylabel('value');
grid on
subplot(2, 1, 2);
stem(t,mul);
title('Multiplication Result(stem)');
xlabel('time');
ylabel('value');
grid on


figure;

%d
%scaled signal
subplot(2, 1, 1);
plot(t,scalingK);
title('Scaled Signal: (plot)');
xlabel('time');
ylabel('value');
grid on
subplot(2, 1, 2);
stem(t,scalingK);
title('Scaled Signal:(stem)');
xlabel('time');
ylabel('value');
grid on


