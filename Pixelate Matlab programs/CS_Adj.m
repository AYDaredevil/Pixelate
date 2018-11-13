function [] =CS_Adj_G(B,CofCS,Not_Arranged_G)

%300-Indicator
%1000-BP
%-1-Green(Outside CS)
%1-Red(outside CS)
%0-White(outside CS)
%-2-Green(inside)
%2-Red(inside)
%10-White(inside)
%5-Bot

c=1;
Not_Arr_converted=zeros(4,2);

for i=1:8
    for j=1:8
      
        if B(i,j)==300
            B(i,j)=0;
        
        
        elseif B(i,j)==1000
            B(i,j)=0;
        
        
        elseif B(i,j)==-1
            B(i,j)=0;
        
        
        elseif B(i,j)==1
            B(i,j)=0;
            
        elseif B(i,j)==0
            B(i,j)=1;        
        
        elseif B(i,j)==-2
            B(i,j)=0;
               
        
        elseif B(i,j)==2
            B(i,j)=0;
            
        elseif B(i,j)==10
            B(i,j)=1;
        end
    end
end

for i=0:7
    if(NotArranged_G(c,1)==0||NotArranged_G(c,2)==0)
        break
    end
    for j=0:7
        if(CofCS(NotArranged_G(c,1),NotArranged_G(c,1),2)>=j*60&&CofCS(NotArranged_G(c,1),NotArranged_G(c,1),2)<=(j+1)*60
        
            
        
        