function [X] = zt(x,zeroth)
N = length(x); 
z = sym('z'); 
X = 0; 
for n = 0:N-1
    X = X + x(n+1)*z^(zeroth-n); 
end
end