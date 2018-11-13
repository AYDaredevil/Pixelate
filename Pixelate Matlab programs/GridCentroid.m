function [CofGrid ] = GridCentroid()
for i=1:8
    for j=1:8
        CofGrid(i,j,2)=(i-1)*60+30;
        CofGrid(i,j,1)=(j-1)*60+30; 
    end
end
 CofGrid;
end

