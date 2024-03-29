% a gentle introduction to octave/matlab

%elementary math operations
5+6; %can be executed in the command window as well
3-2;
5*8;
1/2;
x=2^6;

%logical operations
1==2 %false = 0 
1~=2 %not equal to, true = 1
1&&0
1||0
xor(1,0)

%octave variables
%naming convention is more like C
a = 3
a = 3;%semicolon suppresses the output
b = 'hi';
b
c = (3>=1);
a = pi;
disp(a)
disp(a);%doc disp or help disp for more information
disp(sprintf('2 decimals: %0.2f', a));%more like C
disp(sprintf('2 decimals: %0f', a));%more like C
disp(sprintf('6 decimals: %0.6f', a));

b=8.23
format long
a
b

format short
a
b

%vectors and matrices
A = [1 2;
    3 4;
    3 4;
    5 6];%semicolon means start new row
size(A)
[m,n] = size(A);
[m,~] = size(A);
size(A,1) % number of row
size(A,2) % number of col
A

B = [1 2;
    3 4;
    5 6];
v = [1 2 3];%row vector
B = B'




size(v)
v = [1;2;3];%(column) vector
A = [1 2;
    3 4;
    3 4;
    5 6];
length(A)
numel(A)
length(v)
numel(v)
v= 1 : 1 : 100
v= 1 : 2 : 100
v= 100 :1 
v= 1 : 100  % formate [ ini : end ]  by default increamnt 1 
v = 1:0.1:2;%  [init:inc:end ]
v= 100 : -1 : 1
v = v';%transpose operation
v = 1:10;%default increment value is 1


ones(2,3)  % 
C = 5*ones(2,3);
%equivalent to
C = [5 5 5;5 5 5];
w = ones(1,3);
w = zeros(1,2);

I = eye(4);






%load data from a file
load ex1data.txt
load ('ex1data.txt')
who I     %currently active variables
ex1data;
size(ex1data)
whos      %more detailed information
clear ex1data     %deletes a variable

a = ex1data(2,1)
A = ex1data(1:10 , :);%: = all
v = ex1data(1:10 , 1);


save population.mat v
load population.mat


save population.txt v -ascii %save as text

v = ex1data(:,1);
w = ex1data(:,2);
A = ex1data([1 3],:)

A(:,2) = [10;11];

A = [A [1;2]]%to append a new column

A = [A; [1 2]]

A(:)

A = [1 2;3 4;5 6];
B = [11 12;13 14;15 16];
C = [A B]
C = [A;B]

%computation on data
A = [1 2;3 4;5 6]
B = [11 12;13 14;15 16]
C = [1 1;2 2]

A*C
A*B
A.*B
A.^2
v = [1;2;3]
1./v
1./A
log(v)
exp(v)
abs([-1;2;-3])
-v%-1*v
%to increment the elements of v
v + ones(length(v),1)
v + 1

A'%transpose operation
a = [1 15 2 0.5]
val = max(a)
[val,ind] = max(a)
a < 3 %element wise comparison
find(a<3)
A = magic(3);%rows,columns,diagonals add up to the same thing
[r,c] = find(A>=7)
[r c]
sum(a)
prod(a)
floor(a)
ceil(a)
max(A)
max(A,[],1)
max(A,[],2)
max(max(A))
max(A(:))

A = magic(9);
sum(A,1)
sum(A,2)
sum(sum(A.*eye(9)))%to sum the diagonal elements
sum(diag(A))

flipud(eye(5))

inv(A)
pinv(A)

%plotting data


t = -0.5:0.001:0.98;
y1 = sin(2*pi*4*t);
y2 = cos(2*pi*4*t);
y3 = zeros(1,length(t)) ; % horizontal zero line
y4 = zeros(1, length(t)); % vertical zero line
y4(t == 0) = 1; 


plot(t,y1 ); 
xlabel('x');
ylabel('sin(x)');
title('my plot of sinusoidals');


plot(t,y4); 
xlabel('x');
ylabel('y');
title('vertical line');


% plot(x-axis , y-axis , ) 
stem(t,y1)
plot(t,y2);


figure(1);
plot(t,y1);

axis([-.5 , 0.5 , -1.5 , 0.5  ]); 
figure(4);
plot(t,y2);
axis([-.5 , 0.75 , -.5 , 1.75  ]);% x_min , x_max , y_min , y_max
grid on
figure(5);
plot(t,y3);
grid on





t = -0.5:0.001:0.98;
y1 = sin(2*pi*4*t);
y2 = cos(4*pi*8*t);
y3 = zeros(1, length(t)); % horizontal zero line
% Vertical line at x=0 from y=0 to y=1
y4_start = -1;
y4_end = 1;
x_vertical_line = 0;
figure();
plot(t, y1, 'r', t, y2, 'g');
hold on;
line([x_vertical_line, x_vertical_line], [y4_start, y4_end], 'Color', 'k', 'LineStyle', '--'); % Vertical line
line([min(t), max(t)], [0, 0], 'Color', 'k', 'LineStyle', '--'); % Horizontal zero line
xlabel('time');
ylabel('value');
legend('sine', 'cosine', 'horizontal zero', 'vertical zero');
title('Sine and Cosine Function with Zero Lines');
grid on
axis([-0.1, 0.75, -1.1, 1.1]);
hold off; % Release the hold on the plot










figure();
plot(t,y1,'r');
hold on
plot(t,y2,'g');
hold on
plot(t,y3,'b');
hold off
xlabel('time');
ylabel('value');
legend('sine','cosine','line');
title('my plot of sinusoidals');
grid on


figure();
plot(t , y1 , 'r', t , y2  ,'g', t ,y3 ,'b' ,y4 ,'b');
xlabel('time');
ylabel('value');
legend('sine','cosine','line','vertical');
title('sine and cosine function ');
grid on
axis([-0.1 , 0.75 , -1.1 , 1.1  ]);


figure();
plot(t, y1, 'r', t, y2, 'g', t, y3, 'b', t, y4, 'k'); % Use 'k' for black
xlabel('time');
ylabel('value');
legend('sine', 'cosine', 'line', 'vertical');
title('Sine and Cosine Function');
grid on
axis([-0.1, 0.75, -1.1, 1.1]);



figure()
subplot(1,3,1) % row , col , index 
plot(t,y1,'r');
subplot(1,3,2) % row , col , index 
plot(t,y2,'g');
subplot(1,3,3) % row , col , index 
plot(t,y3,'b');


figure()
subplot(3,1,1) % row , col , index 
plot(t,y1,'r');
subplot(3,1,2) % row , col , index 
plot(t,y2,'g');
subplot(3,1,3) % row , col , index 
plot(t,y3,'b');





figure()
subplot(2,2,1) % row , col , index 
plot(t,y1,'r');
xlabel('time');
ylabel('value');
title('sine function ');
subplot(2,2,3) % row , col , index 
plot(t,y2,'g');
xlabel('time');
ylabel('value');
title('cosine function ');
subplot(2,2,2) % row , col , index 
plot(t,y3,'b');
xlabel('time');
ylabel('value');
title('line function ');
subplot(2,2,4) % row , col , index 
plot(t , y1 , 'r', t , y2  ,'g', t ,y3 ,'b' );
xlabel('time');
ylabel('value');
legend('sine','cosine','line');
title('sine and cosine function ');
grid on


%functions
o = sum(19 , 6)
untitled3(4,9)


t = -0.5:0.001:0.98;
y1 = sin(2*pi*4*t);
y2 = cos(2*pi*4*t);
y3 = zeros(1, length(t));

% Generate y4 for vertical line at t = 0.5
y4 = zeros(1, length(t));
vertical_line_t = 0;
index_of_vertical_line = find(t == vertical_line_t); % Find the index corresponding to t = 0.5
y4(index_of_vertical_line) = 1; % Set the value to 1 (you can choose any other constant value if you prefer)

% Plot the results
figure;
subplot(2, 2, 1);
plot(t, y1);
title('y1 = sin(2\pi4t)');

subplot(2, 2, 2);
plot(t, y2);
title('y2 = cos(2\pi4t)');

subplot(2, 2, 3);
plot(t, y3);
title('y3 = zeros(1,length(t))');

subplot(2, 2, 4);
plot(t, y4);
title('y4 - Vertical Line');

% Optional: Draw a vertical line using the 'line' function
hold on;
line([vertical_line_t, vertical_line_t], ylim, 'Color', 'r', 'LineStyle', '--');
hold off;





















%use of hold on
plot(t,y1);
hold on;
plot(t,y2,'r');
hold off
xlabel('time');
ylabel('value');
legend('sine','cosine');
title('my plot of sinusoidals');
grid on
print -dpng 'myplot.png'

close%to close the figure
close all

%numbering the figures
figure(1)
plot(t,y1);
figure(2)
plot(t,y2);

%subplot
figure(1)%1x2 grid
subplot(2,1,1),plot(t,y1),grid on;
subplot(2,1,2),plot(t,y2),grid on;

%change the axis
figure(2)
plot(t,y2),
axis([0 0.5 1 -1])%xmin xmax ymin ymax

%imagesc
A = magic(5);
imagesc(A);
imagesc(A),colorbar,colormap(gray);

%control statements
v = zeros(10,1);%initialization
for i=1:10
    v(i) = 2^i;
end

%while loop
i = 1;
while i<=5
    v(i) = 100;
    i = i + 1;
end

%usage of if and break
i = 1;
while true
    v(i) = 999;
    i = i + 1;
    if i == 6
        break;
    end
end

%if-elseif-else
v(1) = 2;
if v(1) == 1
    disp('The value is one');
elseif v(1) == 2
    disp('The value is two');
else
    disp('The value is not one or two.');
end

%function in matlab
maxVal = myMax(10,9)
%function can return multiple values as well
[maxVal,minVal] = myMaxMin(10,9);


%z transform 
syms z n;
x = [1, -1, 2, -2]; % Input sequence
X = ztrans(x, n, z); % Compute the Z-transform
X % Display the result in a readable format



%z transform 
x = [1, -1, 2, -2]; % Input sequence
N = length(x); % Length of the sequence
z = sym('z'); % Create symbolic variable
X = 0; % Initialize Z-transform
zeroth=2
for n = 0:N-1
    X = X + x(n+1)*z^(-n+zeroth); % Compute the Z-transform term by term
end
X % Display the result



% inverse Z transform
syms z n;
X = (3*z^2 + 4*z + 2)/(z^2 - 0.5*z + 0.25); % Z-transform expression
x = iztrans(X, z, n); % Compute the inverse Z-transform
x % Display the result





% fourier transform 
x = [1, 2, 3, 4]; % Input signal
X = fft(x); % Compute the Fourier Transform
X_mag = abs(X); % Magnitude spectrum
X_phase = angle(X); % Phase spectrum
% Plotting the magnitude spectrum
frequencies = (0:length(x)-1)*(1/length(x)); % Frequency axis
stem(frequencies, X_mag);
xlabel('Frequency');
ylabel('Magnitude');
title('Magnitude Spectrum');
% Plotting the phase spectrum
stem(frequencies, X_phase);
xlabel('Frequency');
ylabel('Phase');
title('Phase Spectrum');


%continuous periodic signal
% Parameters
T = 1; % Period of the signal (in seconds)
fs = 100; % Sampling frequency (in Hz)
N = fs * T; % Number of samples
t = (0:N-1) * (1/fs); % Time vector
% Generate the continuous periodic signal
f = 5; % Frequency of the signal (in Hz)
x = sin(2*pi*f*t);
% Compute the Fourier Transform
X = fft(x);
% Frequency axis
frequencies = (0:N-1) * (fs/N);
% Plotting the magnitude spectrum
X_mag = abs(X);
stem(frequencies, X_mag);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Magnitude Spectrum');





%fourier trnasform the aperiodic signal
% Parameters
fs = 1000; % Sampling frequency (in Hz)
duration = 1; % Duration of the signal (in seconds)
t = 0:(1/fs):duration-(1/fs); % Time vector
% Generate the aperiodic signal
x = 2*sin(2*pi*10*t) + 3*cos(2*pi*30*t) + randn(size(t));
% Compute the Fourier Transform
X = fft(x);
% Frequency axis
frequencies = (0:length(X)-1) * (fs/length(X));
% Plotting the magnitude spectrum
X_mag = abs(X);
stem(frequencies, X_mag);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Magnitude Spectrum');




%plot a signal 
x = [0, 0, 4, 0, -5, 1, 0];
idx = 2;
st = -idx;
n = length(x);
ed = n - idx-1;
time=[];
for t = st:ed
    time=[time,t];
    i = t+idx+1;
end
figure();
stem(time,x)
grid on;




%shift signal x(n) to x(n-k) , here [shift<=k]
shift=2;
x = [10, 9, 4, 0, -5, 1, 6];
newx =[];
idx = 2;
st = -idx;
n = length(x);
ed = n - idx-1;
time=st: 1: ed ;
idx = idx + shift ;
st = -idx;
n = length(x);
ed = n - idx-1;
newt=[];
for t = st:ed
    newt=[newt,t];
    i = t+idx+1;
    newx=[newx, x(i)];
end
figure()
subplot(1,2,1)
stem(time,x)
grid on;
subplot(1,2,2)
stem(newt,newx)
grid on;
disp(time)
disp(x)
disp(newt)
disp(newx)



%inverse the signal 
x = [10, 9, 4, -5, 1, 6 , 19 ,28];
newx =[];
idx = 2;
st = -idx;
n = length(x);
ed = n - idx-1;
temp = st;
st=-ed;
ed=-temp;
disp(st)
disp(ed)
time=[];
for t = st:ed
    time=[time,t];
    i =-t+idx+1;
    newx=[newx, x(i)];
end
figure();
stem(time,newx)
grid on;
disp(time)
disp(newx)



% shift a sine wave 
shift = 0.05;
st = -0.5;
ed = 1.9;
t = st:0.01:ed;
y = sin(2*pi*1*t);
newt = t + shift;
newy = y;
y4_start = -1;
y4_end = 1;
x_vertical_line = 0;
figure();
plot(t, y, 'r', newt, newy, 'g');
hold on;
line([x_vertical_line, x_vertical_line], [y4_start, y4_end], 'Color', 'k', 'LineStyle', '--'); % Vertical line
line([min(t), max(t)], [0, 0], 'Color', 'k', 'LineStyle', '--'); % Horizontal zero line
xlabel('time');
ylabel('value');
legend('sine', 'shifted sine', 'horizontal zero', 'vertical zero');
title('Sine and Shifted Sine Function with Zero Lines');
grid on
hold off;








x = [1, 2, 3, 4];
idx=2;
h = [-2, 1, 5];
idh=1;
y = conv5(x,idx, h,idh);
disp(y);







%my convolution
x = [2, 3, 0,-4];
idx=1;
h = [1, 0, 2];
idh=0;
len_x = length(x);
len_h = length(h);
stx = -idx;
edx = len_x - idx-1;
sth = -idh;
edh = len_h - idh-1;
sty = 0 ;
if stx < 0 
     sty = stx ;
end
if sth < 0 
     sty = sty + sth ;
end
edy = 0 ;
if edx > 0
      edy = edx ;
end
if edh > 0 
     edy = edy + edh ;
end
time = sty : 1 : edy ;
len_y = edy-sty+1;
newh = zeros(1, len_y);
y= zeros(1, len_y);
index = sth- sty;
for i = 1 : len_h
    newh(index+i)=h(i);
end
%disp(time)
for i= stx :edx
    shift =i;
    sfth = zeros(1, len_y);
    for j = 1 : len_y
        if 1<=j+i && j+i<=len_y
            sfth(j+i) = newh(j) ;
        end
    end
    k= i-stx+1 ;
    %disp(sfth)
    %disp(sfth.*x(k))
    y = sfth.*x(k) +y ;
end
disp(time)
disp(y)
figure();
stem(time,y);
grid on;








% use my raw code conv5 function 
x =[ 2,-1 , 3, 7 , 1 , 2, -3];
idx = 4;
h =[ 5, -2 , 1 , 4 , -2 , 2, -1 ,1 ];
idh = 3;
[Y, time]  = conv5(x,idx, h,idh);
figure();
stem(time,Y);






% use my raw code conv5 function 
%index starts from 0
x =[ 1, 1, 1, 1 ];
idx = 1;
h =[ 1,2 ,3,4 ];
idh = 2;
[Y, time]  = conv5(x,idx, h,idh);
figure();
stem(time,Y);


conv(x,h)







clear;
x=[ 2     -1     1     3     -2     1     2    0];
subplot(2,2,1)
stem(x,'b','filled');
grid on;
axis([0 9 -3 4 ]);
title({'Sequence X(n): ';num2str(x)});
xlabel('Sample Number (n)')
ylabel('Value');
y=fft(x,8);
real_y=real(y);
imag_y=imag(y);
subplot(2,2,2)
stem(real_y,'o','filled');
grid on;
axis([0 9 min(real_y)-1 max(real_y)+1]);
title({'Real part of 8-point DFT:';num2str(round(real_y*10)/10)});
xlabel('Sample Number (n)')
ylabel('Value of Real part');
plot3=subplot(2,2,3)
stem(imag_y,'o','filled');
plot3.XTickMode='auto';
grid on;
axis([0 9 min(imag_y)-1 max(imag_y)+1]);
title('hooola')
title({'Imaginary part of 8-point DFT of Sequence X(n) ';
num2str(round(imag_y*10)/10)});
xlabel('Sample Number (n)')
ylabel('Value of Imaginary part ');
inverse_y=ifft(y,8);
plot4=subplot(2,2,4)
stem(inverse_y,'o','filled');
grid on;
axis([0 9 min(inverse_y)-1 max(inverse_y)+1]);
title({'IInvesre of 8-point DFT:';num2str(round(inverse_y*10)/10)});
xlabel('Sample Number (n)')
ylabel('Value  ');
print('DFT_sequence','-dpng');








% Define the time domain
t = linspace(0, 2*pi, 1000);
% Define a signal (example: a Gaussian pulse)
signal = exp(-0.5 * ((t - pi).^2) / 0.2);
% Perform the Fourier transform
signal_fft = fft(signal);
% Calculate the frequency axis
Fs = 1 / (t(2) - t(1)); % Sampling frequency
frequencies = Fs * (-0.5:1/length(t):0.5 - 1/length(t));
% Plot the magnitude of the Fourier transform
figure;
plot(frequencies, abs(fftshift(signal_fft)));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Fourier Transform');
grid on;












%%%%%%%%%%%%%%%%%%%%%%%%fourier signal%%%%%%%%%%%%%%%%%
% Define the time domain
t = linspace(0, 2*pi, 1000);
% Define the periodic signal (example: a square wave)
f = square(t);
% Number of harmonics to consider
N = 10;
% Initialize the Fourier series sum
FS = zeros(size(t));
% Calculate the Fourier series
for n = 1:N
    % Calculate the nth coefficient
    an = (2/pi) * trapz(t, f .* cos(n*t)); % numerical integration
    bn = (2/pi) * trapz(t, f .* sin(n*t));    
    % Add the nth term to the series
    FS = FS + an * cos(n*t) + bn * sin(n*t);
end
% Plot the original signal and the Fourier series approximation
figure;
plot(t, f, 'b', t, FS, 'r');
legend('Original Signal', 'Fourier Series');
xlabel('Time');
ylabel('Amplitude');
title('Fourier Series Approximation');
grid on;



%%%%%%%%%%%%%%%% fourier transform%%%%%%%%%%%%%%%
% Define the time domain
t = linspace(0, 2*pi, 100);
% Define a signal (example: a Gaussian pulse)
signal = exp(-0.5 * ((t - pi).^2) / 0.2);
%singal=sin(t);
% Perform the Fourier transform
signal_fft = fftshift(fft(signal));
% Calculate the frequency axis
Fs = 1 / (t(2) - t(1)); % Sampling frequency
frequencies = Fs * (-0.5:1/length(t):0.5 - 1/length(t));
% Plot the magnitude and phase of the Fourier transform
figure;
subplot(2, 1, 1);
plot(frequencies, abs(signal_fft));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Magnitude of Fourier Transform');
grid on;
subplot(2, 1, 2);
plot(frequencies, angle(signal_fft));
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');
title('Phase of Fourier Transform');
grid on;






%%%%%%%%%%%%%%periodic signal fourier series%%%%%%%%%%%%%%%%
x=[1,1, 0, 0];
N=size(x,2);
for k=0:N-1
    c=0;
    for p=0:N-1
        %c = c+x(p+1)*exp(complex(0,-2*pi*p*k/N));
        theta=-2*pi*k*p/N;
        c = c+x(p+1)*(cos(theta)+1i*sin(theta));
    end
    c=c/N;
    disp(c)
end
%%%%%%%%%%%%another way%%%%%%%  DFT %%%%%%%%%
%x = [1, 1, 0, 0];
t = linspace(0, 2*pi, 1000);
x=sin(t);
x=[2,3,2,1,0,1];
N = length(x);
fourierS=[];
for k = 0:N-1
    ck = 0;
    for p = 0:N-1
        ck = ck+x(p+1)*exp(-2i*pi*p*k/N);
    end
    ck = ck / N;
    %disp(['c', num2str(k), ' = ', num2str(ck)]);
    fourierS=[fourierS,ck];
end
%plot mahnitude
figure;
subplot(2, 1, 1);
plot(abs(fourierS));
xlabel('Frequency (k)');
ylabel('Magnitude');
title('Magnitude of Fourier Coefficients');
% Plot phase
subplot(2, 1, 2);
plot(angle(fourierS));
xlabel('Frequency (k)');
ylabel('Phase (radians)');
title('Phase of Fourier Coefficients');
% Create a scatter plot in the complex plane
figure;
scatter(real(fourierS), imag(fourierS), 'o');
xlabel('Real Part');
ylabel('Imaginary Part');
title('Complex Plane Plot of Fourier Coefficients');
grid on;

% inverse fourier
X =[];
for k = 0:N-1
    ck = 0;
    for p = 0:N-1
        ck = ck+fourierS(p+1)*exp(-2i*pi*p*k/N);
    end
    ck = ck / N;
    %disp(['c', num2str(k), ' = ', num2str(ck)]);
    X=[X,ck];
end
figure;
stem(X);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%







%%%%%%%%%%%%%%%%%%fourier transform of sine wave %%%%%%%%%%%%%%%%
amplitude = 1;         % Amplitude of the sine wave
frequency = 5;         % Frequency of the sine wave in Hz
duration = 1;          % Duration of the signal in seconds
sampling_frequency = 1000;  % Sampling frequency in Hz
t = 0:1/sampling_frequency:duration;
sine_wave = amplitude * sin(2 * pi * frequency * t);
sine_wave_fft = fft(sine_wave);
N = length(sine_wave);
frequencies = (0:N-1) * (sampling_frequency / N);
figure;
subplot(2, 1, 1);
plot(frequencies, abs(sine_wave_fft));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Magnitude of Fourier Transform');
grid on;
% Plot the phase of the Fourier transform
subplot(2, 1, 2);
plot(frequencies, angle(sine_wave_fft));
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');
title('Phase of Fourier Transform');
grid on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





%%%%%  x(t) = cos(2π100t) + cos(2π500t)   %%%%%%%%%%%%%%%%%%%%
N=250;
ts=.0002;
t=[0:N-1]*ts;
x=cos(2*pi*100*t)+cos(2*pi*500*t);
%x=sin(2*pi*100*t);
figure;
plot(t,x)
grid on;
k=0;
for f=0:1000
    k=k+1;
    X(k)=trapz(t,x.*exp(-j*2*pi*f*t));
end
f=0:1000;
figure;
size(X)
size(f)
plot(f, abs(X))
grid on;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N=250;
ts=.0002;
deltaf=1/(N*ts);
t=[0:N-1]*ts;
x=cos(2*pi*100*t)+cos(2*pi*500*t) + 8*sin(2*pi*900*t);
%x=sin(2*pi*900*t);
Xf=fft(x);
f=[0:N-1]*deltaf;
figure;
plot(f,abs(Xf))
figure;
Xf_shift=fftshift(Xf);
plot([-N/2:N/2-1]*deltaf, abs(Xf_shift))


N=250;
ts=.00125;
deltaf=1/(N*ts);
t=[0:N-1]*ts;
x=cos(2*pi*100*t)+cos(2*pi*500*t);
Xf=fft(x);
Xf_shift=fftshift(Xf);
figure;
plot([-N/2:N/2-1]*deltaf, abs(Xf_shift))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%% Fourier Series of a Sine Wave: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameters of the sine wave
amplitude = 1;         % Amplitude of the sine wave
frequency = 5;         % Frequency of the sine wave in Hz
duration = 1;          % Duration of the signal in seconds
sampling_frequency = 1000;  % Sampling frequency in Hz

% Create a time vector
t = 0:1/sampling_frequency:duration;

% Generate the sine wave signal
sine_wave = amplitude * sin(2 * pi * frequency * t);

% Calculate the Fourier series coefficients
N = length(sine_wave);
T = 1 / sampling_frequency;
frequencies = (0:N-1) / (N * T);
fourier_series_coeffs = fft(sine_wave) / N;

% Plot the original sine wave and its Fourier series
figure;
subplot(2, 1, 1);
plot(t, sine_wave);
xlabel('Time (s)');
ylabel('Amplitude');
title('Original Sine Wave');

subplot(2, 1, 2);
stem(frequencies, abs(fourier_series_coeffs));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Magnitude of Fourier Series Coefficients');
grid on;
%%%%%%%%%%%%%%%%  Fourier Transform of a Sine Wave: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Parameters of the sine wave
amplitude = 1;         % Amplitude of the sine wave
frequency = 5;         % Frequency of the sine wave in Hz
duration = 1;          % Duration of the signal in seconds
sampling_frequency = 1000;  % Sampling frequency in Hz

% Create a time vector
t = 0:1/sampling_frequency:duration;

% Generate the sine wave signal
sine_wave = amplitude * sin(2 * pi * frequency * t);

% Perform the Fourier transform
sine_wave_fft = fft(sine_wave);

% Calculate the frequency axis
N = length(sine_wave);
frequencies = (0:N-1) * (sampling_frequency / N);

% Plot the magnitude and phase of the Fourier transform
figure;
subplot(2, 1, 1);
plot(frequencies, abs(sine_wave_fft));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Magnitude of Fourier Transform');
grid on;

subplot(2, 1, 2);
plot(frequencies, angle(sine_wave_fft));
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');
title('Phase of Fourier Transform');
grid on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



t = linspace(-8, 8, 1000);
x=cos(2*pi*t/3)+cos(2*pi*t/5);
Y = fft(x);
X = ifft(Y);
figure;
plot(t, x);
title('Sine wave');
figure;
subplot(2, 1, 1);
plot(abs(Y))
title('Fourier transform');
subplot(2, 1, 2);
plot(X);
title('Inverse Fourier transform');
figure;
plot(real(Y), imag(Y));
grid on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%% DTFT (apperiodic) fourier transform %%%%%%%%%%%%%%%%%%%%%%%%%

x=[2,3,2,1,0,1,2,3,2,1,0,1,2,3,2,1,0,1,2,3,2,1,0,1,2,3,2,1,0,1];
lw = -5 ;
hi = length(x)+lw-1;
fourier=[];
w = -pi : 1/1000 : pi;
for k=1:length(w)
    ft=0;
    for n=lw : hi
        idx= n-lw+1 ;
        ft=ft+x(idx)*exp(-1i*w(k)*n);
    end
    fourier=[fourier,ft];
end
figure;
scatter(real(fourier),imag(fourier));
title("scattered plot of fourier components")
figure;
subplot(2,1,1);
plot(w,abs(fourier))
title("magnitude of fourier transform")
subplot(2,1,2);
plot(w,angle(fourier))
title("phase of fourier transform")

%inverse fourier transform

X=[];
for n=lw : hi
     idx= n-lw+1 ;
     c=(1/(2*pi))*trapz(w,fourier.*exp(1i*w*n))  
    X=[X,c];
end
figure;
stem(X);




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x=[2,3,2,1,0,1,2,3,2,1,0,1,2,3,2,1,0,1,2,3,2,1,0,1,2,3,2,1,0,1];
Y=fft(x)
X=ifft(Y)
%plot mahnitude
figure;
subplot(2, 1, 1);
plot(abs(Y));
xlabel('Frequency (k)');
ylabel('Magnitude');
title('Magnitude of Fourier Coefficients');
% Plot phase
subplot(2, 1, 2);
plot(angle(Y));
xlabel('Frequency (k)');
ylabel('Phase (radians)');
title('Phase of Fourier Coefficients');


%%%%%%%%%%%%%%%%%%%%DTFT (apperiodic) fourier transform  and inverse %%%%%%%%%%%%%%%%%%%%%%
t=-pi:1/100:pi;
x=sin(t);
lw = -50 ;
hi = length(x)+lw-1;
fourier=[];
w = -pi : 1/1000 : pi;
for k=1:length(w)
    ft=0;
    for n=lw : hi
        idx= n-lw+1 ;
        ft=ft+x(idx)*exp(-1i*w(k)*n);
    end
    fourier=[fourier,ft];
end
figure;
scatter(real(fourier),imag(fourier));
title("scattered plot of fourier components")
figure;
subplot(2,1,1);
plot(w,abs(fourier))
title("magnitude of fourier transform")
subplot(2,1,2);
plot(w,angle(fourier))
title("phase of fourier transform")
%inverse fourier transform
X=[];
for n=lw : hi
     idx= n-lw+1 ;
     c=(1/(2*pi))*trapz(w,fourier.*exp(1i*w*n));
    X=[X,c];
end
figure;
stem(t,X);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%% coninous peridic fourier series  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T=2*pi;
t=-pi:1/1000:pi;
x=sin(t);
%x= square(t);
lw=-25;
N=50;
hi=N+lw-1;
K=lw:hi;
ft=[];
for k=lw:hi
    f=(1/T)*trapz(t,x.*exp(-2i*pi*k*t/T));
    ft=[ft,f];
end
figure;
scatter(real(ft),imag(ft));
title("scattered plot of fourier components")
figure;
subplot(2,1,1);
plot(K,abs(ft))
title("magnitude of fourier transform")
subplot(2,1,2);
plot(K,angle(ft))
title("phase of fourier transform")
%inverse
X=[];
for p=1:length(t)
    c=0;
    for k=lw:hi
        idx=k-lw+1;
        c=c+ft(idx)*exp(2i*pi*k*t(p)/T);
    end
    X=[X,c];
end
figure;
plot(t,X,'b',t,x,'r')
grid on;
legend("used fourier","original signal")

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






