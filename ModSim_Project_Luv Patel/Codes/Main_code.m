clear all ; close all; clc; 
% 0 means Restricted ... 35 means road... 50 means built up... 15 means Non  built up


w1 = 0.1; % wieght of the factor distance from road
w2 = 0.5; % wieght of the factor neighbourhood.
itr = 10;
cut_road = 0.9;

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
%figure;
%image(dis*2)
%colorbar;

%%% now The Cellular Autometa as per rules.... 


p1 = ( 1 - (dis/ max ( max ( dis )  ) ) ) ;

% Binary probability
    for i=1:sr
        for j=1:sc
           if p1(i,j) < cut_road
               p1(i,j) = 0;
           end
        end
    end
%%%


%%% effect of 7 x 7 neighbourhood...

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
            
                  p = (ne / 48) ;
          
                  
                  %%% 
                  
         end
         
           if(ar(i,j)==15)
               
               %%% main logic
            
                if(rand() <=  ( p1(i,j)*w1 + p*w2  ) )
                        tm(i,j) = 50;
                        tm2(i,j) = 50 - (t * 4);
                end
                %%%%%
                
            end
         
         
         
     end
 end
 
 ar=tm;
 
end

