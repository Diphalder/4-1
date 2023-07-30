x = [1, 2, 0 , -3 ,4 , 0 , 0];
h = [0, 0 , 4 , 0 , -5 , 1, 0 ];
t = [-2 , -1 , 0 , 1 , 2 ,3 ,4 ];


%plot x(n) and h(n)
y4_start = -10;
y4_end = 10;
x_vertical_line = 0;
figure();
plot(t, x, 'r', t, h, 'g');
hold on;
line([x_vertical_line, x_vertical_line], [y4_start, y4_end], 'Color', 'k', 'LineStyle', '--'); % Vertical line
line([min(t), max(t)], [0, 0], 'Color', 'k', 'LineStyle', '--'); % Horizontal zero line
xlabel('time');
ylabel('value');
legend('sine', 'cosine', 'horizontal zero', 'vertical zero');
title('Sine and Cosine Function with Zero Lines');
grid on
hold off; % Release the hold on the plot




figure();
stem(t, x, 'r', 'Marker', 'o', 'MarkerFaceColor', 'r', 'LineStyle', 'none');
hold on;
stem(t, h, 'g', 'Marker', 'square', 'MarkerFaceColor', 'g', 'LineStyle', 'none');
line([0, 0], [-10, 10], 'Color', 'k', 'LineStyle', '--'); % Vertical line
xlabel('time (n)');
ylabel('value');
legend('x(n)', 'h(n)', 'vertical zero');
title('x(n) and h(n) as Point-wise Plots');
grid on
hold off;







index = 2
% ques Q1.A
zt(x,index)
zt(h,index)


% Q1 .B
syms z;

ztrans(x,z)
ztrans(h,z)
