%Gauss Seidel Solver 
from source https://de.mathworks.com/matlabcentral/answers/
303634-writing-a-code-to-attempt-to-
make-matrix-diagonally-dominant 2017-11-05 

clear;
clc; 

%Input Matrix A 
A= [2 7 3; 
    8 2 3;
    1 0 6;
    ]; 

b=[2;  8; 1]; 

[m,n]=size(A); 

%checks if Matrix is square
if m~=n, error('A is nit square matrix'); 
  end 

ww=1;  
%Rearrange Matrix in diagonal dominant order
  while ww <= n 
  for i=1:n
    if sum(abs(A(i,:))) - abs(A(i,ww)) < abs(A(i,ww))
      A([ww,i],:)=A([i ww],:); 
      b([ww i],:)=b([i ww],:); 
      ww=ww+1; 
      break
    elseif sum(abs(A(i,:))) - abs(A(i,ww)) == abs(A(i,ww))
      A([ww,i],:)=A([i ww],:); 
       b([ww i],:)=b([i ww],:);
      if sum(abs(A(i,:))) - abs(A(i,ww)) < abs(A(i,ww))
        A([ww,i],:)=A([i ww],:); 
        b([ww i],:)=b([i ww],:);
        ww=ww+1; 
        break; 
      end 
      if i==n 
        ww=ww+1; 
      end 
        
      elseif i==n  
        ww=ww+1; 
      else 
        
       continue 
       
     end
     
   end 
  
 end 
fprintf ('Matrix A successfully rearanged to diagonal dominat') 
disp(A) 
 