function [] =CS_AdjwBlock(A)

%300-Indicator
%1000-BP
%-1-Green(Outside CS)
%1-Red(outside CS)
%0-White(outside CS)
%-2-Green(inside)
%2-Red(inside)
%10-White(inside)
%5-Bot



for i=1:8
    for j=1:8
      
        if(A(i,j)==300)
            A(i,j)=0;
        
        
        elseif A(i,j)==50
            A(i,j)=0;
        
        
        elseif A(i,j)==-1
            A(i,j)=0;
        
        
        elseif A(i,j)==1
            A(i,j)=0;
            
        elseif A(i,j)==0
            A(i,j)=0;        
        
        elseif A(i,j)==-2
            A(i,j)=0;
               
        
        elseif A(i,j)==2
            A(i,j)=0;
            
        elseif A(i,j)==10
            A(i,j)=1;
        end
    end
end
        