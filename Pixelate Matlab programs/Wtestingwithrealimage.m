function []=testingwithrealimage(r)

A=zeros(8,8);                                                                     % defining a 8,8 blank matrix

Arrena=imread('test.jpg');
resizedArrena=imresize(Arrena,[480,480]);                                              %resizing of arrena
%imtool(Arrena)

ConstructionSite=(resizedArrena(:,:,1)>=(r(1,1)-20))&(resizedArrena(:,:,2)>=(r(1,3)-20))&(resizedArrena(:,:,3)>=(r(1,5)-20))&(resizedArrena(:,:,1)<=(r(1,2)+30))&(resizedArrena(:,:,2)<=(r(1,4)+30))&(resizedArrena(:,:,3)<=(r(1,6)+30));      %seperating constrctn site
%ConstructionSite=bwlabel(ConstructionSite);
%ConstructionSitePRO=regionprops(ConstructionSite,'basic');

%ConstructionSite=bwareaopen(ConstructionSite,2000);                            % printing seperate cnstrctn site                                                                     
imtool(ConstructionSite)                                                  

ConstructionSite=(resizedArrena(:,:,1)>=(r(2,1)-20))&(resizedArrena(:,:,2)>=(r(2,3)-20))&(resizedArrena(:,:,3)>=(r(2,5)-20))&(resizedArrena(:,:,1)<=(r(2,2)+30))&(resizedArrena(:,:,2)<=(r(2,4)+30))&(resizedArrena(:,:,3)<=(r(2,6)+30));      %seperating constrctn site
%ConstructionSite=bwlabel(ConstructionSite);
%ConstructionSitePRO=regionprops(ConstructionSite,'basic');

%ConstructionSite=bwareaopen(ConstructionSite,2000);                            % printing seperate cnstrctn site                                                                     
imtool(ConstructionSite)    

ConstructionSite=(resizedArrena(:,:,1)>=(r(3,1)-20))&(resizedArrena(:,:,2)>=(r(3,3)-20))&(resizedArrena(:,:,3)>=(r(3,5)-20))&(resizedArrena(:,:,1)<=(r(3,2)+20))&(resizedArrena(:,:,2)<=(r(3,4)+20))&(resizedArrena(:,:,3)<=(r(3,6)+20));      %seperating constrctn site
%ConstructionSite=bwlabel(ConstructionSite);
%ConstructionSitePRO=regionprops(ConstructionSite,'basic');

%ConstructionSite=bwareaopen(ConstructionSite,2000);                            % printing seperate cnstrctn site                                                                     
imtool(ConstructionSite)    

ConstructionSite=(resizedArrena(:,:,1)>=(r(4,1)-20))&(resizedArrena(:,:,2)>=(r(4,3)-20))&(resizedArrena(:,:,3)>=(r(4,5)-20))&(resizedArrena(:,:,1)<=(r(4,2)+20))&(resizedArrena(:,:,2)<=(r(4,4)+20))&(resizedArrena(:,:,3)<=(r(4,6)+10));      %seperating constrctn site
%ConstructionSite=bwlabel(ConstructionSite);
%ConstructionSitePRO=regionprops(ConstructionSite,'basic');

%ConstructionSite=bwareaopen(ConstructionSite,2000);                            % printing seperate cnstrctn site                                                                     
imtool(ConstructionSite)    

ConstructionSite=(resizedArrena(:,:,1)>=0)&(resizedArrena(:,:,2)>=0)&(resizedArrena(:,:,3)>=0)&(resizedArrena(:,:,1)<=(r(5,2)+40))&(resizedArrena(:,:,2)<=(r(5,4)+70))&(resizedArrena(:,:,3)<=(r(5,6)+70));      %seperating constrctn site
%ConstructionSite=bwlabel(ConstructionSite);
%ConstructionSitePRO=regionprops(ConstructionSite,'basic');

%ConstructionSite=bwareaopen(ConstructionSite,2000);                            % printing seperate cnstrctn site 
%str=strel('square',0);
%ConstructionSite=imerode(ConstructionSite,str);
%ConstructionSite=imdilate(ConstructionSite,str);

imtool(ConstructionSite)    

ConstructionSite=(resizedArrena(:,:,1)>=(r(6,1)-20))&(resizedArrena(:,:,2)>=(r(6,3)-20))&(resizedArrena(:,:,3)>=(r(6,5)-20))&(resizedArrena(:,:,1)<=(r(6,2)+20))&(resizedArrena(:,:,2)<=(r(6,4)+20))&(resizedArrena(:,:,3)<=(r(6,6)+20));      %seperating constrctn site
%ConstructionSite=bwlabel(ConstructionSite);
%ConstructionSitePRO=regionprops(ConstructionSite,'basic');

%ConstructionSite=bwareaopen(ConstructionSite,2000);                            % printing seperate cnstrctn site                                                                     
imtool(ConstructionSite)    