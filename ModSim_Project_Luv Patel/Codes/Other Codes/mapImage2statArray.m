function y = mapImage2statArray(str)

arr = imread('bult_up_ref.jpg');
r = arr(1,1,1);
g = arr(1,1,2);
b = arr(1,1,3);
range = 100;

arr = imread(str);
[s1 s2 s3] = size(arr);
for i=1:s1
    for j=1:s2
        a= abs(arr(i,j,1)-r);
        b = abs(arr(i,j,2)-g);
        c = abs(arr(i,j,3)-b);
        
        if a<=range && b<=range && c<=range
            arr(i,j,1)=0;
            arr(i,j,2)=0;
            arr(i,j,3)=0;
        else
            arr(i,j,1)=200;
            arr(i,j,2)=200;
            arr(i,j,3)=200;
        end
    end
end
y=arr;
end