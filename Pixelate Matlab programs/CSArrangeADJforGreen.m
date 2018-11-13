function [BofGreen]= CSArrangeADJforGreen(NotArranged_G,A)
PathSize=0;
for i=1:4
    if(NotArranged_G(i,1)==0)
        break
    end
    PathSize=PathSize+1;
    
end
CSgreen=zeros(PathSize,2);

for z=1:PathSize
    
    for i=0:7
        if ((CofCS(NotArranged_G(z,1),NotArranged_G(z,2),1)>=i*60)&(CofCS(NotArranged_G(z,1),NotArranged_G(z,2),1)<=(i+1)*60))
            for j=0:7
                if ((CofCS(NotArranged_G(z,1),NotArranged_G(z,2),2)>=j*60)&(CofCS(NotArranged_G(z,1),NotArranged_G(z,2),2)<=(j+1)*60))
                    CSgreen(z,1)=j+1;
                    CSgreen(z,2)=i+1;
                end
            end
        end
    end
    
    
    
    BofGreen=zeros(8,8);
    
    for i=1:8
        for j=1:8
            
            if (A(i,j)==0)
                BofGreen(i,j)=1;
                
            elseif (A(i,j)==10)
                BofGreen(i,j)=1;
                
            elseif (A(i,j)==5)
                BofGreen(i,j)=5;
                
            else
                BofGreen(i,j)=0;
            end
        end
    end
    
    
    for i=1:PathSize
        BofGreen(CSgreen(i,1),CSgreen(i,2))=4;
    end
    
end






