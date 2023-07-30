function y = convdip(x , idx, h , idh)
    % Length of the input signals
    len_x = length(x);
    len_h = length(h);
    
    % Length of the output signal after convolution
    len_y = len_x + len_h - 1;
    
    % Zero-padding the input signals
    x_padded = [x, zeros(1, len_y - len_x)];
    h_padded = [h, zeros(1, len_y - len_h)];
    
    % Perform the convolution
    y = zeros(1, len_y);
    for n = 1:len_y
        y(n) = 0;
        for k = 1:len_h
            if n-k+1 > 0 && n-k+1 <= len_x
                y(n) = y(n) + x_padded(n-k+1) * h_padded(k);
            end
        end
    end
endfunction [outputArg1,outputArg2] = untitled3(inputArg1,inputArg2)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
outputArg1 = inputArg1;
outputArg2 = inputArg2;
end