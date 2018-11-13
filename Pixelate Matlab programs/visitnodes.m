function [NodeRec]= visitnodes()

NodeRec=zeros(64,64);
a=[1:8;9:16;17:24;25:32;33:40;41:48;49:56;57:64];


for i=1:8
    for j=1:8
        if(i-1>0)
            NodeRec(a(i,j),a(i-1,j))=1;
        end
        
        if(j-1>0)
            NodeRec(a(i,j),a(i,j-1))=1;
        end
        
        if(i+1<9)
            NodeRec(a(i,j),a(i+1,j))=1;
        end
        
        if(j+1<9)
            NodeRec(a(i,j),a(i,j+1))=1;
        end
        
    end
    
end
     

end
