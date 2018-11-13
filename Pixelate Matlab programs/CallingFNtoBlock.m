function [A,CofBot,ColorOfIndicator,CofRB,CofGB,EndFlag,B] = CallingFNtoBlock(resizedArrena,A,r,CofGrid,xOfBP,yOfBP)

resizedArrenaO=resizedArrena;

[A,ColorOfIndicator,IndicatorBW] = FindColorofIndicator(r,resizedArrena,A); % indicator info

LEDblink(ColorOfIndicator);

[A,CofBot] = BotInfo(resizedArrena,A,r,resizedArrenaO) ;                    % bot info

%[A,CofRB,CofGB] =BlockInfo(resizedArrena,r,A,IndicatorBW,xOfBP,yOfBP);      % block info
[A,CofRB,CofGB] =BlockInfo(resizedArrena,r,A,IndicatorBW,xOfBP,yOfBP);

[A,B,CSArray,CofCS,StartCofCS] = cnstructionsiteInfo(resizedArrenaO,A,r );    % conxtruction site

[ADJ] = AdjacancyToBlock(ColorOfIndicator,B);  % afinding djacancy
ADJ

[NodeMap,start]= AdjMatFinal(ADJ);                          

[RevPath,count,noway]=DIJKSTRAv3(NodeMap,start,ADJ);                          % DIJKSTRA ALGO                                                         

Path2D = convert1to2Final(RevPath);

EndFlag='P';                                                                  % defining  VARIABLE

if noway==1
    [EndFlag,vid,check] = botMovementTOBlock(CofBot,CofGrid,Path2D,count,resizedArrena,A,r,resizedArrenaO,ColorOfIndicator,EndFlag);%vid);        % GIVIMG instr. To bot 
end
if noway==0
   EndFlag='F';
end
end