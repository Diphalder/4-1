function cs = myconv(s1, s2)
    l1 = length(s1);
    l2 = length(s2);

    cslen = l1 + l2 - 1;
    
    padded_signal1 = [s1, zeros(1, cslen - l1)];
    padded_signal2 = [s2, zeros(1, cslen - l2)];
    
    fft_signal1 = fft(padded_signal1);
    fft_signal2 = fft(padded_signal2);
    
    cs = ifft(fft_signal1 .* fft_signal2);
    
    % Trim the output signal to remove trailing zeros
    cs =cs(1:cslen);
end
