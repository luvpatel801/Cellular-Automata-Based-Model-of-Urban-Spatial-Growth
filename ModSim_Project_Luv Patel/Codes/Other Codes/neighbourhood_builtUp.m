clear all ; close all; clc;
inputImg='input.jpg';
img = imread(inputImg);
[sr sc scol] = size(img);
arr = zeros(sr,sc);
for i=1:sr
    for j=1:sc
        if(img(i,j)>=100)
            arr(i,j)=50;
            
        end
    end
end

% imshow(img)
% figure
imshow(arr)

itr = 20;
hve_ne = 2;

tm=arr;
for t=1:itr
  
% imshow(arr,'InitialMagnification',2000);
% imshow(arr);
if(mod(t,5) == 1)
colorMap = jet(50);
colormap(colorMap);
colorbar;
image(arr);

hold on;
pause(0.1)
end

for i=1:sr
   for j=1:sc
       if(arr(i,j)==0)
        ne=0;
      allNe = [i-1 j-1
         i-1 j
         i-1 j+1
         i j-1
         i j+1
         i+1 j-1
         i+1 j
         i+1 j+1];
     for kkk=1:8
         x=allNe(kkk,1);
         y=allNe(kkk,2);
         if x>=1 && x<=sr && y>=1 && y<=sc
             if(arr(x,y)>=1)
                 ne=ne+1;
             end
         end
     end
     if(ne>=hve_ne)
         tm(i,j)=(50 - (t*(50/itr)));
     end
       end
   end
end
arr=tm;

end





