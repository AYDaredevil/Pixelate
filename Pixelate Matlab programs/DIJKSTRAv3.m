function [RevPath,count,noway]=DIJKSTRAv3(NodeMap,start,A)

Distance=ones(1,64);
Distance=Distance*9999;
Visit=(1:64);
Parent=zeros(1,64);
NodePointer=0;                      %Current Node
Flag=1;
RevPath=[1:64]*0;
c=1;
count=1;
noway=1;

Distance(start)=0;

NodePointer=start;


while (noway==1)
  
        
    for i=1:64
        if((NodeMap(NodePointer,i)==1)&&(Distance(i)>(Distance(NodePointer)+1)))
             Distance(i)=Distance(NodePointer)+1;
             Parent(i)=NodePointer;
        end
    end
           
    Visit(NodePointer)=0;
    
    %Checking whether a box is above,below,left or right of node pointer
    
    
    %Convert from 1D to 2D
    NP2D(1,1)=ceil(NodePointer/8); %row
    NP2D(1,2)=mod(NodePointer,8);  %column
    if(NP2D(1,2)==0)
        NP2D(1,2)=8;
    end
    
    if(NP2D(1,1)-1>0)
        if(A((NP2D(1,1)-1),NP2D(1,2))==4)
            Parent(NodePointer-8)=NodePointer;
            NodePointer=NodePointer-8;
            break
        end
    end
    
    if(NP2D(1,2)-1>0)
        if(A(NP2D(1,1),(NP2D(1,2)-1))==4)
            Parent(NodePointer-1)=NodePointer;
            NodePointer=NodePointer-1;
            break
            
        end
    end
    
    if(NP2D(1,1)+1<9)
        if(A((NP2D(1,1)+1),NP2D(1,2))==4)
            Parent(NodePointer+8)=NodePointer;
            NodePointer=NodePointer+8;
            break
        end
    end
    
    if(NP2D(1,2)+1<9)
        if(A(NP2D(1,1),(NP2D(1,2)+1))==4)
            Parent(NodePointer+1)=NodePointer;
            NodePointer=NodePointer+1;
            break
        end
    end
    
    
    % Looking for an unvisted node which has minimum traversed distance
    if Flag==1
        MinD=9999999;
        
        for i=1:64
            
            if (MinD>=Distance(i)&&Visit(i)~=0)
                MinD=Distance(i);
                NodePointer=i;
                
            end
        end
    end
    
    if MinD==9999
        noway=0;
    end
    
       
   
   
end

if noway==1

 RevPath(c)=NodePointer;
while Parent(RevPath(c))~=0
    
    RevPath(c+1)=Parent(RevPath(c));
    c=c+1;
    
end

end


    

end
       

