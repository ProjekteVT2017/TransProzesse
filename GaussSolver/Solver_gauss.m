function [x] = Solver_gauss(A,b,TOL,MaxNumOfIter)
    %Gauss Seidel Solver 
    %from source https://de.mathworks.com/matlabcentral/answers/
    %303634-writing-a-code-to-attempt-to-
    %make-matrix-diagonally-dominant [Zugriff 05.11.2017] 
    
    %https://de.mathworks.com/matlabcentral/fileexchange/
    %32051-gauss-seidel-method?focused=5193371&tab=function [Zugriff 09.11.2017]
    
    %checks if Matrix is square
    u=length(b); 
    [m,n]=size(A);
    if u~=m, 
    error('different size A and b'); 
    end 

   if m~=n, error('A is not square matrix'); 
   end 
      
    %Rearrange Matrix in diagonal dominant order
     ww=1;
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
    fprintf ('Matrix A successfully rearranged to diagonal dominant \n') 
    disp(A); 

   %Initiale conditions for Iteration (TOL=Tolerance,MaxNumOfIter and Error_eval)
   
   x=zeros(n,1); 
   counter=1; 
   iteration = 0;
   Error_eval= ones(1,n); 
   
   while Error_eval > TOL 
        iteration = iteration + 1;
       Z = x;  % save current values to calculate error later
       for i = 1:n
            j = 1:n; % define an array of the coefficients' elements
           j(i) = [];  % eliminate the unknow's coefficient from the remaining coefficients
            Xtemp = x;  % copy the unknows to a new variable
            Xtemp(i) = [];  % eliminate the unknown under question from the set of values
           x(i) = (b(i) - sum(A(i,j) * Xtemp)) / A(i,i);
       end
       Xsolution(:,iteration) = x;
         
       Error_eval = norm(A*x-b);
   end
%% Display Results
    fprintf ('The solution of x is: \n %f\n %f\n %f\n %f\n ', x)
    fprintf('number of iterations is: %f\n', iteration)
end 
