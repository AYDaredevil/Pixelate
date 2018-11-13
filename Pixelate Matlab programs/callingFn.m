function [Path2D,flag,BlueprintArray,CSArray,CofCS ] = callingFn(  )

count=1;
[r] = pvalue();
%[ IndicatorBW] = ColorOfIndicatorCheck(r);
[ColorOfIndicator,BlueprintArray,CSArray,A,CofCS,CofBot,StartCofCS]=Pixelete(r,count);
[A] = findingPathByCofIndicator(ColorOfIndicator,A,CSArray,BlueprintArray);
[NodeMap,A1,Bot]= AdjMat(A);
[RevPath]=DIJKSTRA(NodeMap,A1,Bot);
Path2D = convert1to2 (RevPath);

 [CofGrid ] = GridCentroid();
 [flag] = botMovement(CofBot,CofGrid,Path2D);
 
 
 
 

 end

