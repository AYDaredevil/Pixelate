function [BofREd]= CSArrangeADJforRed(NotArranged_R,A)
PathSize=0;
for i=1:4
    if(NotArranged_R(i,1)==0)
        break
    end
    PathSize=PathSize+1;
    
end
CSred=zeros(PathSize,2);

for z=1:PathSize
    
    for i=0:7
        if ((CofCS(NotArranged_R(z,1),NotArranged_R(z,2),1)>=i*60)&(CofCS(NotArranged_R(z,1),NotArranged_R(z,2),1)<=(i+1)*60))
            for j=0:7
                if ((CofCS(NotArranged_R(z,1),NotArranged_R(z,2),2)>=j*60)&(CofCS(NotArranged_R(z,1),NotArranged_R(z,2),2)<=(j+1)*60))
                    CSred(z,1)=j+1;
                    CSred(z,2)=i+1;
                end
            end
        end
    end
    
    
    
    BofREd=zeros(8,8);
    
    for i=1:8
        for j=1:8
            
            if (A(i,j)==0)
                BofREd(i,j)=1;
                
            elseif (A(i,j)==10)
                BofREd(i,j)=1;
                
            elseif (A(i,j)==5)
                BofREd(i,j)=5;
                
            else
                BofREd(i,j)=0;
            end
        end
    end
    
    
    for i=1:PathSize
        BofREd(CSred(i,1),CSred(i,2))=4;
    end
    
end






