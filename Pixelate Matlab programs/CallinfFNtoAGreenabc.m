function [] = CallinfFNtoAGreen(resizedArrena,A,r,CofGrid)

resizedArrenaO=resizedArrena;


[A,CofBot] = BotInfo(resizedArrena,A,r,resizedArrenaO) ;                       % BOT INFO

%??????????????????????/BLOCK info MISSING

[A,B,CSArray,CofCS,StartCofCS] = cnstructionsiteInfo(resizedArrenaO,A,r );                  % Cs

[Priority_G,Priority_R]=CS_Priority(CofGrid,CofCS,CSarray);

[CofDest]=findCSnode(Priority_G,Priority_R,CofCS,CSArray,ColorOfIndicator)

[ADJToCS] = AdjacancyToCSinCS(CofDest,B);                                             % adj to CS
%[ADJToCS] = AdjacancyToCS(CofDest,B)                                                 

[NodeMap,start]= AdjMatFinal(ADJToCS);                          

[RevPath,count,noway]=DIJKSTRAv3(NodeMap,start,ADJToCS);                          % DIJKSTRA ALGO                                                         

Path2D = convert1to2Final(RevPath);

EndFlag='P';                                                                  % defining  VARIABLE

if noway==1