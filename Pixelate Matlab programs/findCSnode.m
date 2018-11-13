function [CofDest]=findCSnode(Priority_G,Priority_R,CofCS,CSArray,ColorOfIndicator)

%CSarray=function which returns CSarray thru image processsing
%Check indicator color
row=0;
column=0;

if ColorOfIndicator==1                %GREEN
i=1;
while(Priority_G(i,1)~=0)
    if(CSArray(Priority_G(i,1),Priority_G(i,2)==0))
        row=Priority_G(i,1);
        column=Priority_G(i,2);
        break
    end
end
end

if ColorOfIndicator==2              %RED
i=1;
while(Priority_R(i,1)~=0)
    if(CSArray(Priority_R(i,1),Priority_R(i,2)==0))
        row=Priority_R(i,1);
        column=Priority_R(i,2);
        break
    end
end
end

if (row>0&&column>0)
    
CofDest(1,1)=CofCS(row,column,1);
CofDest(1,2)=CofCS(row,column,2);
end

end


        
    