function [CofCS,A,ColorOfIndicator,CofBot,CofRB,CofGB] = TakilaA(r,resizedArrena,A,countCS,count,check)

% countCS=1;
 %count=1;
%ArrenaGrid=zeros(5,5);
%A= ArrenaGrid;

resizedArrena=imresize(resizedArrena,[300,300]);
resizedArrenaO=resizedArrena;
%if (countCS==1)

[A,ColorOfIndicator,IndicatorBW] = FindColorofIndicator(r,resizedArrena,A);
%[A,ColorOfIndicator,IndicatorBW] = colorOFindicator(A,r,resizedArrena);        %indicator


A

[A,CofBot] = BotInfo(resizedArrena,A,r,resizedArrenaO);                     %BOT
A

if (check~=ColorOfIndicator)
    
[CofGrid ] = GridCentroid();

%if (ColorOfIndicator==check) 

[A,CofCS] = CSInfo(resizedArrena,r,A);            %CS          1
% [A,CofCS] = CSInfo(Arrena,r,A);
%countCS=countCS+1;
% end
A

[A,CofRB,CofGB] =BlockInfo(resizedArrena,r,A,IndicatorBW);

A
end
A
[AD] = findingPathByCofIndicator(ColorOfIndicator,A);
A
AD
[NodeMap,A1,start]= AdjMatT(AD);
start
[RevPath]=DIJKSTRAT(NodeMap,A1,start,AD);
RevPath
Path2D = convert1to2T (RevPath);
Path2D
botMovement1(CofBot,CofGrid,Path2D,count);

A

check=ColorOfIndicator;
end

