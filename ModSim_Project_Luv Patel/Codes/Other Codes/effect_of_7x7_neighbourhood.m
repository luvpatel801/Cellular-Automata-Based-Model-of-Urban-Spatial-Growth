clear all ; close all; clc; 
% 0 means Restricted ... 35 means road... 50 means built up... 15 means Non  built up

%%%Initilizing

img = imread('test2.jpg');
%image(img);
[sr sc sf] = size(img);
ar = zeros(sr,sc);
for i=1:sr
    for j=1:sc
      if(img(i,j,1) >240 )
          ar(i,j)=15;
      else if (img(i,j,1)<150)
              ar(i,j)=50;
          else
              ar(i,j)=35;
          end
      end
      
      if img(i,j,2)>90 && ar(i,j)~=15
          ar(i,j) = 0;
      end
      
    end
end
colorMap = jet(50);
colormap(colorMap);
image(ar)
colorbar
pause(3)
%%%% calculating nearest distence from road..


%%% effect of 7 x 7 neighbourhood...


itr=7;
tm2=ar;
for t=1:itr
tm=ar;

 pause(1);
 image(tm2);
 hold on;
 
 for i=1:sr
     for j=1:sc
         
         % 0 means Restricted ... 35 means road... 50 means built up... 15 means Non  built up
         if(ar(i,j)==15)
             ne=0;
             for x=i-3:i+3
                 for y=j-3:j+3
                            if x>=1 && x<=sr && x~=i && y>=1 && y<=sc && y~=j
                                    if(ar(x,y)==50)
                                        ne = ne + 1;
                                    end
                            end
                 end
             end
             
             %%% The Logic
                  p = ne / 48 ;
                  if rand() <= p
                      tm(i,j)= 50;
                      tm2(i,j)= 50- (t * 4);
                  end
                  
                  %%% 
                  
         end
         
         
     end
 end
 
 ar=tm;
 
end

