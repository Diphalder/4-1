function [y, time] = conv5(x , idx, h , idh)
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
%disp(time)
%disp(y)
%figure();
%stem(time,y);
%grid on;

end