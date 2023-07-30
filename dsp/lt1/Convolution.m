function cs = Convolution(s1, s2)

    cs = conv(s1,s2);
    
    % signal-1
    subplot(3, 1, 1);
    stem(s1);
    title('Signal-1');
    xlabel('time');
    ylabel('value');
    grid on
    
    % signal 2
    subplot(3, 1, 2);
    stem(s2);
    title('Signal-2');
    xlabel('time');
    ylabel('value');
    grid on
    
    % convolved signal
    subplot(3, 1, 3);
    stem(cs);
    title('Convolved Signal');
    xlabel('time');
    ylabel('value');
    grid on
end
