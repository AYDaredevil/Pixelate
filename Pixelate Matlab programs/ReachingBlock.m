function [CofDestBlock] = ReachingBlock[PathSize,Path2D,r,ColorOfIndicator]

Path2D(PathSize-1,1)=x;
Path2D(PathSize-1,2)=y;

BoundingBoxTarget=[(y-1),(x-1),(y-1)+60,(x-1)+60];

Target=imcrop(resizedArrena,BoundingBoxTarget);

if ColorOfIndicator==2
    
    Target=Target(:,:,1)>=(r(2,1)-20)&Target(:,:,2)<=(r(2,4)+20)&Target(:,:,3)<=(r(2,6)+20)&Target(:,:,1)<=(r(2,2)+20)&Target(:,:,2)>=(r(2,3)-20)&Target(:,:,3)>=(r(2,5)-20);
end

if ColorOfIndicator==2
    
    Target=Target(:,:,1)<=(r(1,2)+20)&Target(:,:,2)>=(r(1,3)-20)&Target(:,:,3)<=(r(1,6)+20)&Target(:,:,1)>=(r(1,1)-20)&Target(:,:,2)<=(r(1,4)+20)&Target(:,:,3)>=(r(1,5)-20);
end


TargetPRO=regionprops(Target,'basic');

CofDestBlock(1,:)=TargetPRO(1).BoundingBox;

CofDestBlock(1,1)=CofDestBlock(1,1)+(y-1)*60;
CofDestBlock(1,2)=CofDestBlock(1,2)+(x-1)*60;
end