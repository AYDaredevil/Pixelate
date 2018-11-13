function [A,CofBot,ColorOfIndicator,CofRB,CofGB,EndFlag,B] = CallingFNtoCS(resizedArrena,A,r,CofGrid)

resizedArrenaO=resizedArrena;

[A,ColorOfIndicator,IndicatorBW] = FindColorofIndicator(r,resizedArrena,A); % indicator info

[A,CofBot] = BotInfo(resizedArrena,A,r,resizedArrenaO) ;                       % BOT INFO

%??????????????????????/BLOCK info MISSING

[A,B,CSArray,CofCS,StartCofCS] = cnstructionsiteInfo(resizedArrenaO,A,r );                  % Cs

[Priority_G,Priority_R]=CS_Priority(CofGrid,CofCS,CSarray);

[CofDest]=findCSnode(Priority_G,Priority_R,CofCS,CSArray,ColorOfIndicator)

[ADJToCS] = AdjacancyToCS(CofDest,B)                                                  % adj to CS

[NodeMap,start]= AdjMatFinal(ADJToCS);                          

[RevPath,count,noway]=DIJKSTRAv3(NodeMap,start,ADJToCS);                          % DIJKSTRA ALGO                                                         

Path2D = convert1to2Final(RevPath);

EndFlag='P';                                                                  % defining  VARIABLE

if noway==1
[EndFlag,vid,check] = botMovementTOCS(CofBot,CofGrid,Path2D,count,resizedArrena,A,r,resizedArrenaO,vid,EndFlag)
end

if noway==0
   EndFlag='F';
end
end







