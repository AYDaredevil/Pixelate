function [ IndicatorBW] = ColorOfIndicatorCheck(r,resizedArrena)
%Arrena=imread('arrena3.jpg');
resizedArrena=imresize(resizedArrena,[480,480]);
x=35;

IndicatorColor=resizedArrena(:,:,1)<=(r(1,2)+x)&resizedArrena(:,:,2)>=(r(1,3)-x)&resizedArrena(:,:,3)<=(r(1,6)+x)&resizedArrena(:,:,1)>=(r(1,1)-x)&resizedArrena(:,:,2)<=(r(1,4)+x)&resizedArrena(:,:,3)>=(r(1,5)-x);
IndicatorColor1=bwareaopen(IndicatorColor,1000);
BPPro=regionprops(IndicatorColor1,'basic');
%imshow(IndicatorColor1);
[n1,n2]=size(BPPro);
if (n1>=1)
    IndicatorBW=IndicatorColor1;
else
    IndicatorBW=resizedArrena(:,:,1)>=(r(2,1)-x)&resizedArrena(:,:,2)<=(r(2,4)+x)&resizedArrena(:,:,3)<=(r(2,6)+x)&resizedArrena(:,:,1)<=(r(2,2)+x)&resizedArrena(:,:,2)>=(r(2,3)-x)&resizedArrena(:,:,3)>=(r(2,5)-x);
    
    
    
end

end