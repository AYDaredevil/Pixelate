function [NodeMap,start]= AdjMatFinal(A)

NodeMap=zeros(64,64);
a=[1:8;9:16;17:24;25:32;33:40;41:48;49:56;57:64];
start=0;
c=1;

for i=1:8
    for j=1:8
        
        if(i-1>0)
            if(A(i-1,j)==1)
                NodeMap(a(i,j),a(i-1,j))=1;
            end
        end
        
        if(j-1>0)
            if(A(i,j-1)==1)
                NodeMap(a(i,j),a(i,j-1))=1;
            end
        end
        
        if(i+1<9)
            if(A(i+1,j)==1)
                NodeMap(a(i,j),a(i+1,j))=1;
            end
        end
        
        if(j+1<9)
            if(A(i,j+1)==1)
                NodeMap(a(i,j),a(i,j+1))=1;
            end
        end
        
        if(A(i,j)==5)
            start=c;
        end
        
        c=c+1;
    end
    
end


end
