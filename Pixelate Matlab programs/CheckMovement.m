function [A,CofBot]=CheckMovement(CofBot,CofGrid,Path2D,A,resizedArrena)

[A,CofBot] = BotInfo(resizedArrena,A,r)


Dist=distance(CofBot(1,1),CofBot(1,2),Path2D(count+1,1),Path2D(count+1,2));
MinD=(Distance(CofGrid(Path2D(count,1),Path2D(count,2),1),CofGrid(Path2D(count,1),Path2D(count,2),2),CofGrid(Path2D(count+1,1),Path2D(count+1,2),1),CofGrid(Path2D(count+1,1),Path2D(count+1,2),2)))/2;

if(Dist<MinD)
    f=0;
    count=count+1;
    botMovement(CofBot,CofGrid,Path2D);
    
   
else
    f=1;
end



