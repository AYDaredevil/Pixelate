function []=constructionSiteArray()

A=[1:8;9:16;17:24;25:32;33:40;41:48;49:56;57:64]                                                                    % defining a 8,8 blank matrix
CSArray=zeros(3,5);

Arrena=imread('arrena2.jpg');
resizedArrena=imresize(Arrena,[480,480]);                                              %resizing of arrena
%imtool(Arrena)

%ConstructionSite=(resizedArrena(:,:,1)>(r(3,1)-10))&(resizedArrena(:,:,2)>(r(3,3)-10))&(resizedArrena(:,:,3)>(r(3,5)-10))&(resizedArrena(:,:,1)<=(r(3,2)+10))&(resizedArrena(:,:,2)<=(r(3,4)+0))&(resizedArrena(:,:,3)<=(r(3,6)+10));      %seperating constrctn site
ConstructionSite=(resizedArrena(:,:,1)>200)&(resizedArrena(:,:,2)>200)&(resizedArrena(:,:,3)>200);%&(resizedArrena(:,:,1)<=(r(3,2)+10))&(resizedArrena(:,:,2)<=(r(3,4)+0))&(resizedArrena(:,:,3)<=(r(3,6)+10));  
ConstructionSite=bwlabel(ConstructionSite);
ConstructionSitePRO=regionprops(ConstructionSite,'basic');

ConstructionSite=bwareaopen(ConstructionSite,2000);                                                                      % printing seperate cnstrctn site
str=strel('square',2);
%ConstructionSite=imdilate(ConstructionSite,str);
ConstructionSite=imerode(ConstructionSite,str);
CSPro=regionprops(ConstructionSite,'Basic');

[n1,n2]=size(CSPro);
for i=1:n1
CofCS(i,:)=CSPro(i).Centroid;
end
x=1;
y=1;
 for i=1:n1
     if (y>3)
         x=x+1;
         y=1;
     end
      for j=0:7
          if ((CofCS(i,2)>(j*60))&(CofCS(i,2)<((j+1)*60)))
          for k=0:7
              if ((CofCS(i,1)>(k*60))&(CofCS(i,1)<((k+1)*60)))
                  CSArray(y,x)=A((j+1),(k+1));
              end
          end
          end
      end
      y=y+1;
 end
 CSArray
 CSArray=[CSArray(1,1):CSArray(1,5),CSArray(2,1):CSArray(2,5),CSArray(3,1):CSArray(3,5)];
    CSArray
  
imtool(ConstructionSite)