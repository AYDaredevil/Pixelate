function [ADJToCS] = AdjacancyToCSinCS(CofDest,B)

     row=0;
     column=0;

for i=0:7
    if ((CofDest(1,1)>=i*60)&(CofDest(1,1)<=(i+1)*60))
        for j=0:7
            if ((CofDest(1,2)>=j*60)&(CofDest(1,2)<=(j+1)*60))
                row=j+1;
                column=i+1;
            end
        end
    end
end

for i=1:8
    for j=1:8
        
        if B(i,j)==5
            ADJToCS(i,j)=5;
            
       % elseif (B(i,j)==0)
         %   ADJToCS(i,j)=1;
            
       elseif (B(i,j)==10)
            ADJToCS(i,j)=1;
        else
             ADJToCS(i,j)=0;
        end
    end
end

if ((row>0)&(column>0))
ADJToCS(row,column)=4;
end

end

