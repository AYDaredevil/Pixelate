function [ADJ] = AdjacancyToBlock(ColorOfIndicator,B)

if (ColorOfIndicator==1)
    for i=1:8
        for j=1:8
            
            if (B(i,j)==-1)
                ADJ(i,j)=4;
                
            elseif (B(i,j)==0)
                ADJ(i,j)=1;
                
            elseif (B(i,j)==10)
                ADJ(i,j)=1;
                
            elseif (B(i,j)==5)
                ADJ(i,j)=5;
                
            else
                ADJ(i,j)=0;
            end
            
            
        end
    end
    
end


if (ColorOfIndicator==2)
    for i=1:8
        for j=1:8
            
            if (B(i,j)==1)
                ADJ(i,j)=4;
                
            elseif (B(i,j)==0)
                ADJ(i,j)=1;
                
            elseif (B(i,j)==10)
                ADJ(i,j)=1;
                
            elseif (B(i,j)==5)
                ADJ(i,j)=5;
                
            else
                ADJ(i,j)=0;
            end
            
            
        end
    end
end




end

