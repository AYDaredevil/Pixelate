function [EndFlag,A] = CallinfFNtoAGreen(NotArranged_G,CofBot,CofGrid,resizedArrena,A,r,resizedArrenaO,vid)

[BofGreen]= CSArrangeADJforGreen(NotArranged_G,A);


[NodeMap,start]= AdjMatFinal(BofGreen);                          

[RevPath,count,noway]=DIJKSTRAv3(NodeMap,start,BofGreen);                          % DIJKSTRA ALGO                                                         

Path2D = convert1to2Final(RevPath);

EndFlag='P';  

if noway==1
    [EndFlag,vid,check] = botMovementTOBlockinCS(CofBot,CofGrid,Path2D,count,resizedArrena,A,r,resizedArrenaO,vid,EndFlag)
 
end
if noway==0
   EndFlag='F';
end

end 