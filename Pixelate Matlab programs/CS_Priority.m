function [Priority_G,Priority_R]=CS_Priority(CofGrid,CofCS,CSarray)

%Green is negative 
%Red is positive


Priority_G=zeroes(10,2);
Priority_R=zeroes(10,2);



TopLeftX=CofCS(1,1)-CofGrid(2,3,1);
TopLeftY=CofCS(1,2)-CofGrid(2,3,2);

TopRightX=CofGrid(2,6,1)-CofCS(1,1);
TopRightY=-CofGrid(2,6,2)+CofCS(1,2);

BottomLeftX=-CofGrid(7,3,1)+CofCS(1,1);
BottomLeftY=CofGrid(7,3,2)-CofCS(1,2);

BottomRightX=CofGrid(7,6,1)-CofCS(1,1);
BottomRightY=CofGrid(7,6,2)-CofCS(1,2);

if (TopLeftX<15&&TopLeftY<15)
    
    CSarray(1,1)=CSarray(1,1)*100;
    CSarray(1,2)=CSarray(1,2)*50;
    CSarray(1,3)=CSarray(1,3)*50;
    CSarray(1,4)=CSarray(1,4)*50;
    CSarray(1,5)=CSarray(1,5)*50;
    CSarray(2,1)=CSarray(2,1)*50;
    CSarray(2,2)=CSarray(2,2)*49;
    CSarray(2,3)=CSarray(2,3)*25;
    CSarray(2,4)=CSarray(2,4)*25;
    CSarray(2,5)=CSarray(2,5)*25;
    CSarray(3,1)=CSarray(3,1)*50;
    CSarray(3,2)=CSarray(3,2)*25;
    CSarray(3,3)=CSarray(3,3)*10;
    CSarray(3,4)=CSarray(3,4)*10;
    CSarray(3,5)=CSarray(3,5)*10;
    
    
    
elseif TopRightX<15&&TopRightY<15
    
    CSarray(1,1)=CSarray(1,1)*50;
    CSarray(1,2)=CSarray(1,2)*50;
    CSarray(1,3)=CSarray(1,3)*50;
    CSarray(1,4)=CSarray(1,4)*50;
    CSarray(1,5)=CSarray(1,5)*100;
    CSarray(2,1)=CSarray(2,1)*25;
    CSarray(2,2)=CSarray(2,2)*25;
    CSarray(2,3)=CSarray(2,3)*25;
    CSarray(2,4)=CSarray(2,4)*49;
    CSarray(2,5)=CSarray(2,5)*50;
    CSarray(3,1)=CSarray(3,1)*10;
    CSarray(3,2)=CSarray(3,2)*10;
    CSarray(3,3)=CSarray(3,3)*10;
    CSarray(3,4)=CSarray(3,4)*25;
    CSarray(3,5)=CSarray(3,5)*50;
    
    
elseif BottomRightX<15&&BottomRightY<15
    
    CSarray(1,1)=CSarray(1,1)*10;
    CSarray(1,2)=CSarray(1,2)*10;
    CSarray(1,3)=CSarray(1,3)*10;
    CSarray(1,4)=CSarray(1,4)*25;
    CSarray(1,5)=CSarray(1,5)*50;
    CSarray(2,1)=CSarray(2,1)*25;
    CSarray(2,2)=CSarray(2,2)*25;
    CSarray(2,3)=CSarray(2,3)*25;
    CSarray(2,4)=CSarray(2,4)*49;
    CSarray(2,5)=CSarray(2,5)*50;
    CSarray(3,1)=CSarray(3,1)*50;
    CSarray(3,2)=CSarray(3,2)*50;
    CSarray(3,3)=CSarray(3,3)*50;
    CSarray(3,4)=CSarray(3,4)*50;
    CSarray(3,5)=CSarray(3,5)*100;
    
    
elseif BottomLeftX<15&&BottomLeftY<15
    
    CSarray(1,1)=CSarray(1,1)*50;
    CSarray(1,2)=CSarray(1,2)*25;
    CSarray(1,3)=CSarray(1,3)*15;
    CSarray(1,4)=CSarray(1,4)*15;
    CSarray(1,5)=CSarray(1,5)*15;
    CSarray(2,1)=CSarray(2,1)*50;
    CSarray(2,2)=CSarray(2,2)*49;
    CSarray(2,3)=CSarray(2,3)*25;
    CSarray(2,4)=CSarray(2,4)*25;
    CSarray(2,5)=CSarray(2,5)*25;
    CSarray(3,1)=CSarray(3,1)*100;
    CSarray(3,2)=CSarray(3,2)*50;
    CSarray(3,3)=CSarray(3,3)*50;
    CSarray(3,4)=CSarray(3,4)*50;
    CSarray(3,5)=CSarray(3,5)*50;
    
    
    
    
elseif TopLeftX<15
    
    CSarray(1,1)=CSarray(1,1)*100;
    CSarray(1,2)=CSarray(1,2)*50;
    CSarray(1,3)=CSarray(1,3)*20;
    CSarray(1,4)=CSarray(1,4)*10;
    CSarray(1,5)=CSarray(1,5)*5;
    CSarray(2,1)=CSarray(2,1)*100;
    CSarray(2,2)=CSarray(2,2)*50;
    CSarray(2,3)=CSarray(2,3)*20;
    CSarray(2,4)=CSarray(2,4)*10;
    CSarray(2,5)=CSarray(2,5)*5;
    CSarray(3,1)=CSarray(3,1)*100;
    CSarray(3,2)=CSarray(3,2)*50;
    CSarray(3,3)=CSarray(3,3)*20;
    CSarray(3,4)=CSarray(3,4)*10;
    CSarray(3,5)=CSarray(3,5)*5;
    
    
elseif TopLeftY<15
    
    CSarray(1,1)=CSarray(1,1)*30;
    CSarray(1,2)=CSarray(1,2)*30;
    CSarray(1,3)=CSarray(1,3)*30;
    CSarray(1,4)=CSarray(1,4)*30;
    CSarray(1,5)=CSarray(1,5)*30;
    CSarray(2,1)=CSarray(2,1)*20;
    CSarray(2,2)=CSarray(2,2)*20;
    CSarray(2,3)=CSarray(2,3)*20;
    CSarray(2,4)=CSarray(2,4)*20;
    CSarray(2,5)=CSarray(2,5)*20;
    CSarray(3,1)=CSarray(3,1)*10;
    CSarray(3,2)=CSarray(3,2)*10;
    CSarray(3,3)=CSarray(3,3)*10;
    CSarray(3,4)=CSarray(3,4)*10;
    CSarray(3,5)=CSarray(3,5)*10;
    
    
elseif BottomLeftY<15
    
    CSarray(1,1)=CSarray(1,1)*10;
    CSarray(1,2)=CSarray(1,2)*10;
    CSarray(1,3)=CSarray(1,3)*10;
    CSarray(1,4)=CSarray(1,4)*10;
    CSarray(1,5)=CSarray(1,5)*10;
    CSarray(2,1)=CSarray(2,1)*20;
    CSarray(2,2)=CSarray(2,2)*20;
    CSarray(2,3)=CSarray(2,3)*20;
    CSarray(2,4)=CSarray(2,4)*20;
    CSarray(2,5)=CSarray(2,5)*20;
    CSarray(3,1)=CSarray(3,1)*30;
    CSarray(3,2)=CSarray(3,2)*30;
    CSarray(3,3)=CSarray(3,3)*30;
    CSarray(3,4)=CSarray(3,4)*30;
    CSarray(3,5)=CSarray(3,5)*30;
    
elseif BottomRightX<15&&BottomRightY<15
    
    CSarray(1,1)=CSarray(1,1)*10;
    CSarray(1,2)=CSarray(1,2)*10;
    CSarray(1,3)=CSarray(1,3)*10;
    CSarray(1,4)=CSarray(1,4)*25;
    CSarray(1,5)=CSarray(1,5)*50;
    CSarray(2,1)=CSarray(2,1)*25;
    CSarray(2,2)=CSarray(2,2)*25;
    CSarray(2,3)=CSarray(2,3)*25;
    CSarray(2,4)=CSarray(2,4)*49;
    CSarray(2,5)=CSarray(2,5)*50;
    CSarray(3,1)=CSarray(3,1)*50;
    CSarray(3,2)=CSarray(3,2)*50;
    CSarray(3,3)=CSarray(3,3)*50;
    CSarray(3,4)=CSarray(3,4)*50;
    CSarray(3,5)=CSarray(3,5)*100;
    
elseif BottomRightX<15
    
    CSarray(1,1)=CSarray(1,1)*10;
    CSarray(1,2)=CSarray(1,2)*20;
    CSarray(1,3)=CSarray(1,3)*30;
    CSarray(1,4)=CSarray(1,4)*40;
    CSarray(1,5)=CSarray(1,5)*50;
    CSarray(2,1)=CSarray(2,1)*10;
    CSarray(2,2)=CSarray(2,2)*20;
    CSarray(2,3)=CSarray(2,3)*30;
    CSarray(2,4)=CSarray(2,4)*40;
    CSarray(2,5)=CSarray(2,5)*50;
    CSarray(3,1)=CSarray(3,1)*10;
    CSarray(3,2)=CSarray(3,2)*20;
    CSarray(3,3)=CSarray(3,3)*30;
    CSarray(3,4)=CSarray(3,4)*40;
    CSarray(3,5)=CSarray(3,5)*50;
    
else
    
    CSarray(1,1)=CSarray(1,1)*10;
    CSarray(1,2)=CSarray(1,2)*50;
    CSarray(1,3)=CSarray(1,3)*50;
    CSarray(1,4)=CSarray(1,4)*50;
    CSarray(1,5)=CSarray(1,5)*10;
    CSarray(2,1)=CSarray(2,1)*10;
    CSarray(2,2)=CSarray(2,2)*50;
    CSarray(2,3)=CSarray(2,3)*100;
    CSarray(2,4)=CSarray(2,4)*50;
    CSarray(2,5)=CSarray(2,5)*10;
    CSarray(3,1)=CSarray(3,1)*10;
    CSarray(3,2)=CSarray(3,2)*50;
    CSarray(3,3)=CSarray(3,3)*50;
    CSarray(3,4)=CSarray(3,4)*50;
    CSarray(3,5)=CSarray(3,5)*10;


end


%========================================PRIORTIZING=====================================================


%GREEN

Pointer=0;
c=1;

while c<10
for i=1:3
   for j=1:5
       if(CSarray(i,j)<Pointer)
           Priority_G(c,1)=i;
           Priority_G(c,2)=j;
       end
   end
end
if CSarray(Priority_G(c,1),Priority_G(c,2))==0
    break
end
CSarray(Priority_G(c,1),Priority_G(c,2))=0;
c=c+1;
end



Pointer=0;
c=1;

while c<11
for i=1:3
   for j=1:5
       if(CSarray(i,j)>Pointer)
           Priority_R(c,1)=i;
           Priority_R(c,2)=j;
       end
   end
end

if CSarray(Priority_R(c,1),Priority_R(c,2))==0
    break
end
CSarray(Priority_R(c,1),Priority_R(c,2))=0;
c=c+1;
end



    
    
    
    
    
end



