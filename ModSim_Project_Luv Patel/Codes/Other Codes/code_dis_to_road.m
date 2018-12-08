clear all ; close all; clc; 
% 0 means Restricted ... 35 means road... 50 means built up... 15 means Non  built up

%%%Initilizing

img = imread('test.jpg');
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
%%%% calculating nearest distence from road..




dis = zeros(sr,sc) ;
for i=1:sr
    for j=1:sc
%         if(ar(i,j)==25) 
%             dis(i,j)=0;
%         end
        d=1e6;
                for x=1:sr
                    for y=1:sc
                       if(ar(x,y)==35)
                           
                           % Euclidian
                          %  tm = ((i-x)^2 + (j-y)^2)^0.5 ;
                          
                          % Non Euclidian
                            tm = max ( abs(i-x) , abs(j-y) ) ;
                          
                           if tm<d
                               d=tm;
                           end
                       end
                    end
                end
                dis(i,j)=d;
    end
end
figure;
image(dis*2)
colorbar;

%%% now The Cellular Autometa as per rules.... 


  pause(1);
  figure
    image(ar);
    hold on;
    figure
     image(ar);
% 0 means Restricted ... 35 means road... 50 means built up... 15 means Non  built up
p = ( 1 - (dis/ max ( max ( dis )  ) ) )  / 2;

itr = 10;

for t=1:itr
    tm=ar;
    for i=1:sr
        for j=1:sc
            
            %%%
            if(ar(i,j)==15)
                if(rand() <= p(i,j) )
                        tm(i,j) = 50;
                end
            end
            %%%
        end
    end
    ar=tm;
    pause(1);
    image(ar);
    hold on;
end





