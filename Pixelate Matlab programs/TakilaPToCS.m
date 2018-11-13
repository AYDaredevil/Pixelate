function [CofCS,A,ColorOfIndicator,CofBot,CofRB,CofGB,EndFlag] = TakilaPToCS(r,resizedArrena,A,vid)



ArrenaGrid=zeros(5,5);
A= ArrenaGrid;

resizedArrena=imresize(resizedArrena,[300,300]);
resizedArrenaO=resizedArrena;
%if (countCS==1)

[A,ColorOfIndicator,IndicatorBW] = FindColorofIndicator(r,resizedArrena,A);
%[A,ColorOfIndicator,IndicatorBW] = colorOFindicator(A,r,resizedArrena);        %indicator

check=ColorOfIndicator;
A

[A,CofBot] = BotInfo(resizedArrena,A,r,resizedArrenaO);                     %BOT
A

[CofGrid ] = GridCentroid();

%if (ColorOfIndicator==check) 

[A,CofCS] = CSInfo(resizedArrena,r,A);            %CS          1
% [A,CofCS] = CSInfo(Arrena,r,A);
%countCS=countCS+1;
% end
A


[A,CofRB,CofGB] =BlockInfo(resizedArrena,r,A,IndicatorBW);

A
[A] = findingPathByCofIndicatorToDest(ColorOfIndicator,A);
%[A] = findingPathByCofIndicator(ColorOfIndicator,A);
A


[NodeMap,start]= AdjMatT(A);
start
[RevPath,count]=DIJKSTRAT3m(NodeMap,start,A);
%[RevPath,count]=DIJKSTRAT1(NodeMap,A1,start,A);
RevPath
Path2D = convert1to2T (RevPath);
Path2D
EndFlag='P';
[EndFlag,vid]=botMovement1F(CofBot,CofGrid,Path2D,count,resizedArrena,A,r,resizedArrenaO,vid,EndFlag)
%botMovement1(CofBot,CofGrid,Path2D,count);
A



end

