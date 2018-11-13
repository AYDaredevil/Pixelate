function [A,CofRB,CofGB] =BlockInfo(resizedArrena,r,A,IndicatorBW,xOfBP,yOfBP)

IndicatorPRO=regionprops(IndicatorBW,'basic');                                            %removing indicator from arrena
coOfIndicator(:,:)=IndicatorPRO.BoundingBox;
a1=coOfIndicator(1,1);
b1=coOfIndicator(1,2);
c1=coOfIndicator(1,3);
d1=coOfIndicator(1,4);

resizedArrena(b1:b1+d1,a1:a1+c1,1)= 255;
resizedArrena(b1:b1+d1,a1:a1+c1,2)= 255;
resizedArrena(b1:b1+d1,a1:a1+c1,3)= 255;



a=xOfBP;                                             % removing blueprint from arrena
b=yOfBP;
resizedArrena(b+1:b+65,a:a+100,1)= 255;
resizedArrena(b+1:b+65,a:a+100,2)= 255;
resizedArrena(b+1:b+65,a:a+100,3)= 255;


r=25;

RedBricks=resizedArrena(:,:,1)>=(r(2,1)-r)&resizedArrena(:,:,2)<=(r(2,4)+r)&resizedArrena(:,:,3)<=(r(2,6)+r)&resizedArrena(:,:,1)<=(r(2,2)+r)&resizedArrena(:,:,2)>=(r(2,3)-r)&resizedArrena(:,:,3)>=(r(2,5)-20);           % separating red bricks
%imtool(RedBricks);
str=strel('square',6);
RedBricks=imerode(RedBricks,str);
RedBricks=imdilate(RedBricks,str);
RedBricks=bwareaopen(RedBricks,150);
%imtool(RedBricks);

RBPro=regionprops(RedBricks,'basic');
%CofRB(1,:)=RBPro.Centroid;

[n1,n2]=size(RBPro);
for i=1:n1
    CofRB(i,:)=RBPro(i).Centroid;                                   % saving information  of location of red bricks in 8,8 grid
    
end
for i=1:n1
    for j=0:7
        if ((CofRB(i,2)>(j*60))&(CofRB(i,2)<((j+1)*60)))
            for k=0:7
                if ((CofRB(i,1)>(k*60))&(CofRB(i,1)<((k+1)*60)))
                    A((j+1),(k+1))=1;
                end
            end
        end
    end
end

g=25;                                                                      % FINDING GREEN BLOCKS
GreenBricks=resizedArrena(:,:,1)<=(r(1,2)+g)&resizedArrena(:,:,2)>=(r(1,3)-g)&resizedArrena(:,:,3)<=(r(1,6)+g)&resizedArrena(:,:,1)>=(r(1,1)-g)&resizedArrena(:,:,2)<=(r(1,4)+g)&resizedArrena(:,:,3)>=(r(1,5)-g);          % separating green bricks
str=strel('square',4);
GreenBricks=imerode(GreenBricks,str);
GreenBricks=imdilate(GreenBricks,str);
GreenBricks=bwareaopen(GreenBricks,70);
imtool(GreenBricks);

GBPro=regionprops(GreenBricks,'basic');                                 % saving information  of location of green bricks in 5,5 grid
%CofGB(1,:)=GBPro.Centroid;

[n1,n2]=size(GBPro);
for i=1:n1
    CofGB(i,:)=GBPro(i).Centroid;
    
end
for i=1:n1
    for j=0:7
        if ((CofGB(i,2)>(j*60))&(CofGB(i,2)<((j+1)*60)))
            for k=0:7
                if ((CofGB(i,1)>(k*60))&(CofGB(i,1)<((k+1)*60)))
                    A((j+1),(k+1))=-1;
                end
            end
        end
    end
end



end

