function [EndFlag,vid,check] = botMovementTOCS(CofBot,CofGrid,Path2D,count,resizedArrena,A,r,resizedArrenaO,vid,EndFlag)

PathSize=1;

if count==1
    for i=1:25
        if(Path2D(i,1)==0)
            break
        end
        PathSize=PathSize+1;
        
    end
    
end

while (count<=(PathSize-2))
    
    Arrena = getsnapshot(vid);
    resizedArrena=imresize(Arrena,[300,300]);
    [A,CofBot] = BotInfo(resizedArrena,A,r,resizedArrenaO);                            %updating bot location
    CofBot
    
    [A,ColorOfIndicator,IndicatorBW] = FindColorofIndicator(r,resizedArrena,A)         % checking color ind.
    
    if ColorOfIndicator!=check                                                         % if color of indicator changes break loop
        break
    end
    
    bfX=CofBot(1,1);
    bfY=-CofBot(1,2);
    bbX=CofBot(2,1);
    bbY=-CofBot(2,2);
    
    
    PathSize
    
    if(count<=(PathSize-1))
        
        f1=(CofBot(1,1)+CofBot(2,1))/2;
        f2=(CofBot(1,2)+CofBot(2,2))/2;
        f3=CofGrid(Path2D(count+1,1),Path2D(count+1,2),1);
        f4=CofGrid(Path2D(count+1,1),Path2D(count+1,2),2);
        
        f1
        f2
        f3
        f4
        
        %dist=sqrt((bfX+bbY)/2,(bfY+bbY)/2,CofGrid(Path2D(2,1),Path2D(2,2),1),);
        dist=sqrt(((f1-f3)^2)+((f2-f4)^2));
        
        
        
        
        p=complex(bfX,bfY);
        q=complex(bbX,bbY);
        v1=p-q;
        angleV1=angle(v1);
        
        
        
        %x1=CofGrid(Path2D(count,1),Path2D(count,2),1);
        %y1=-CofGrid(Path2D(count,1),Path2D(count,2),2);
        x1=(bbX+bfX)/2;
        y1=(bbY+bfY)/2;
        
        x2=CofGrid(Path2D(count+1,1),Path2D(count+1,2),1);
        y2=-CofGrid(Path2D(count+1,1),Path2D(count+1,2),2);
        
        l=complex(x1,y1);
        m=complex(x2,y2);
        v2=m-l;
        angleV2=angle(v2);
        
        
        angle1=(angleV1-angleV2)*(180/pi);
        
        
        %baseLine=atan((y2-y1)/(x2-x1))*(180/pi);
        %botSlope=atan((bfY-bbY)/(bfX-bbX))*(180/pi);
        
        %angle=botSlope-baseLine;
        
        if((angle1>10&angle1<170)|(angle1>(-350)&angle1<(-190)))
            flag='R';
            if count==PathSize-2
                count=count+1;
            end
            
        elseif((angle1<(-10)&angle1>(-170))|(angle1<350&angle1>190))
            flag='L';
            if count==PathSize-2
                count=count+1;
            end
            
        elseif((abs(angle1)<=10)|(abs(angle1)>=350)&count<(PathSize-2))
            flag='S';
            count=count+1;
        end
        angle1=abs(angle1);
        
        if (angle1>180)
            angle1=360-angle1;
        end
        flag
        angle1
        dist
        count
        
        
        MAtlabToArduinoWTB(flag,dist,angle1);
    end
    
    check=ColorOfIndicator;
    
end

if ColorOfIndicator!=check                                                         % if color of indicator changes break loop
      MAtlabToArduinoWTB('U',140,10);
      MAtlabToArduinoWTB('B',20,10);
      EndFlag='F';
end
    
if count>=PathSize-1
     MAtlabToArduinoWTB('S',20,10);
     MAtlabToArduinoWTB('U',140,10);
      MAtlabToArduinoWTB('B',20,10);
  EndFlag='F';
end




