function ar = neighbourFiltering(arr,crit)
ar=arr;
 [ii jj kk]=size(arr);
 for k=1:ii
     for j=1:jj
     ne=0;
     allNe = [k-1 j-1
         k-1 j
         k-1 j+1
         k j-1
         k j+1
         k+1 j-1
         k+1 j
         k+1 j+1];
     for kkk=1:8
         r=allNe(kkk,1);
         c=allNe(kkk,2);
         if r>=1 && r<=ii && c>=1 && c<=jj
             if(arr(r,c,1)==0)
                 ne=ne+1;
         end
     end
     end
     if ne>=crit
         ar(k,j,1)=0;
         ar(k,j,2)=0;
         ar(k,j,3)=0;
     else
         ar(k,j,1)=200;
         ar(k,j,2)=200;
         ar(k,j,3)=200;
     end
     
end
end