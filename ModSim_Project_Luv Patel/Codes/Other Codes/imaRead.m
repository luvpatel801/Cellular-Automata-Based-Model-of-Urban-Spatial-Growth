function y = imaRead(str)

arr = imread(str);

n  = size(arr);
m = n(2);
n = n(1);

data = zeros(n,m);

for i=1:n
    for j=1:m
       data(i,j) =  ( 0.3*arr(i,j,1) +0.6 * arr(i,j,3) + 0.1 * arr(i,j,3) ) * (50 / 256) ;
       if data(i,j) >= 25
           data(i,j) = 50;
       else
           data(i,j) = 0;
       end
    end
end

y = data;