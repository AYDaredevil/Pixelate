function [NotArranged_G,NotArranged_R]=CheckCS (CS,BP)

%0-White
%-1-Green(correct)
%1-Red(correct)
%-2-Green(incorrect)
%2-Green(correct)

NotArranged_G=zeros(10,2);
NotArranged_R=zeros(10,2);
c=1;


for i=1:3
    for j=1:5
        if(BP(i,j)==0)
            if(CS(i,j)==-1)
                NotArranged_G(c,1)=i;
                NotArranged_G(c,2)=j;
                c=c+1;
            end
            if(CS(i,j)==1)
                NotArranged_R(c,1)=i;
                NotArranged_R(c,2)=j;
                c=c+1;
            end
        
        
        elseif(BP(i,j)==-1)
            if(CS(i,j)==1)
                NotArranged_R(c,1)=i;
                NotArranged_R(c,2)=j;
                c=c+1;
            end
        
        
        elseif(BP(i,j)==1)
            
            if(CS(i,j)==-1)
                NotArranged_G(c,1)=i;
                NotArranged_G(c,2)=j;
                c=c+1;
            end
        end
    end
end

end