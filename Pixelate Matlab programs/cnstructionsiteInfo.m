function [A,B,CSArray,CofCS,StartCofCS] = cnstructionsiteInfo(resizedArrenaO,A,r )

CSArray=zeros(3,5);                                    %defining blank array for cnstrctn site

%Arrena=imread('arrena2.jpg');
resizedArrenaO=imresize(resizedArrenaO,[480,480]);
%A=zeros(8,8);
%resizedArrenaO=imrotate(resizedArrenaO,90);

B=A;                                                   %grid array cntaining info of CS

imtool(resizedArrenaO)
ConstructionSite=(resizedArrenaO(:,:,1)>(r(3,1)-20))&(resizedArrenaO(:,:,2)>(r(3,3)-22))&(resizedArrenaO(:,:,3)>(r(3,5)-20));%&(resizedArrenaO(:,:,1)<=(r(3,2)+20))&(resizedArrenaO(:,:,2)<=(r(3,4)+20))&(resizedArrenaO(:,:,3)<=(r(3,6)+20));      %seperating constrctn site
%ConstructionSite=bwlabel(ConstructionSite);
str=strel('square',6);
ConstructionSite=imerode(ConstructionSite,str);
ConstructionSite=bwareaopen(ConstructionSite,2000);

ConstructionSiteO=ConstructionSite;                                         %saving starting cordinates of constrution siteb
%str1=strel('square',25);
%ConstructionSiteO=imdilate(ConstructionSiteO,str1);
%ConstructionSiteO=imerode(ConstructionSiteO,str1);
CSProp=regionprops(ConstructionSiteO,'Basic');
StartCofCS(1,:)=CSProp.BoundingBox;                                             % bounding box of cs
StartCofCS
CSstart(1,:)=CSProp(1).Centroid;                                      %finding cemtroid of first block in
CSstart
str1=strel('square',20);
ConstructionSite=imdilate(ConstructionSite,str1);                     %converting CS in one object
ConstructionSite=bwareaopen(ConstructionSite,10000);
CSProp1=regionprops(ConstructionSite,'Basic');
BBofCS(1,:)=CSProp1.BoundingBox;
imshow(ConstructionSite)
if(BBofCS(1,3)>BBofCS(1,4))
    y=3;
    z=5;
end
if(BBofCS(1,3)<BBofCS(1,4))
    y=5;
    z=3;
end

for i=1:y
    for j=1:z
        
        CofCS(i,j,1)=CSstart(1,2)+(j-1)*60;                                 %savinng Centroid of CS
        CofCS(i,j,2)=CSstart(1,2)+(i-1)*60;
    end
end




%CofCS




CSPro=regionprops(ConstructionSiteO,'Basic');

[n1,n2]=size(CSPro);
for i=1:n1
    CofCSforArray(i,:)=CSPro(i).Centroid;
end
x=1;
y=1;
for i=1:n1
    if (y>3)
        x=x+1;
        y=1;
    end
    for j=0:7
        if ((CofCSforArray(i,2)>(j*60))&(CofCSforArray(i,2)<((j+1)*60)))
            for k=0:7
                if ((CofCSforArray(i,1)>(k*60))&(CofCSforArray(i,1)<((k+1)*60)))
                    
                    CSArray(y,x)=A((j+1),(k+1));
                    
                    
                    if (A((j+1),(k+1))==-1)
                        B((j+1),(k+1))=-2;
                    elseif (A((j+1),(k+1))==1)
                        B((j+1),(k+1))=2;
                    elseif (A((j+1),(k+1))==5)
                        B((j+1),(k+1))=5;
                    else
                        B((j+1),(k+1))=10;
                    end
                end
            end
        end
        y=y+1;
    end
    CSArray;
    
    
    
    %CSArrayLinear=[CSArray(1,1):CSArray(1,5),CSArray(2,1):CSArray(2,5),CSArray(3,1):CSArray(3,5)];
    % CSArrayLinear
    %imtool(ConstructionSite)
    
end
B
A

end