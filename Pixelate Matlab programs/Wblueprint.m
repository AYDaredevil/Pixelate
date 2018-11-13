function []=Pixelete(r)

ArrenaGrid=zeros(8,8);                                                    % defining a 8,8 blank matrix///converting arrena in a grid of 8,8
A=ArrenaGrid;
Arrena=imread('arrena2.jpg');
resizedArrena=imresize(Arrena,[480,480]);                                                 %resizing of arrena
resizedArrenaO=imresize(Arrena,[480,480]); 
imtool(resizedArrena)


 for k = 1:20:380                                                             % finding blueprint from arrena
for i = 1:20:440
RGBBlueprint=imcrop( resizedArrena,[i k 100 60]);
BWBlueprint=im2bw(RGBBlueprint);
str=strel('square',9);
blprnt3=imerode(BWBlueprint,str);
BWBlueprint=imdilate(blprnt3,str); 

prop=regionprops(BWBlueprint,'basic');
[no,e]=size(prop);
           if(no >=7)
               Blueprint=RGBBlueprint;
                 %imtool(Blueprint);                                         % printing separate blueprint
                         
                 xOfBP=i;
                 yOfBP=k;
               
               break;
           end
end

 end
 
 
 imBluePrint = imresize(Blueprint, [60,100]);            %saving blueprint in an array      BY finding average of pixel values  of each block
z=1;


for a=1:20:60
    for b=1:20:100
        box=imcrop(imBluePrint,[b a 20 20]);                % croping 20,20 block from croped blueprint to finr color of block
        
       red= box(:,:,1);
       green=box(:,:,2);
       
       redMean=mean(mean(red));
       greenMean=mean(mean(green));
       
       if(redMean>150&greenMean<80)
             box=20;                                       % if block is red then saving value 20 in array 
        elseif(redMean<90&greenMean>140)
            box=1;                                         % if block is green saving vlue 1 in array
        else
            box=0;                                         % if block is white saving value 0 in array
         
        end
         BlueprintArray(z)=box;
          z=z+1;
     
     end
end
BlueprintArray                                                                        % printing array of blueprints  containing info of color
 
 
                                                                                         % thresholding for indicator
 IndicatorBW=resizedArrena(:,:,1)<=(r(1,2)+10)&resizedArrena(:,:,2)<=(r(1,4)+10)&resizedArrena(:,:,3)<=(r(1,6)+10)&resizedArrena(:,:,1)>=(r(1,1)-10)&resizedArrena(:,:,2)>=(r(1,3)-10)&resizedArrena(:,:,3)>=(r(1,5)-10);     % separating indicator
 IndicatorBW=bwareaopen(IndicatorBW,2500);
 %imtool(IndicatorBW)
 
 BPPro=regionprops(IndicatorBW,'basic');                                    %finding color of indicator
 IndicatorRGB=imcrop(Arrena,BPPro.BoundingBox);
 %imtool(IndicatorRGB)

 [n1,n2]=size(BPPro);
 for i=1:n1
 cb(i,:)=BPPro(i).Centroid;
 
 end                                                               
  for i=1:n1                                                                  % saving location of indicator=300 in grid
      for j=0:7
          if ((cb(i,2)>(j*60))&(cb(i,2)<((j+1)*60)))
          for k=0:7
              if ((cb(i,1)>(k*60))&(cb(i,1)<((k+1)*60)))
                  A((j+1),(k+1))=300;                                      
              end
          end
          end
      end
  end
 
 RedPixelValueOfIndicator=IndicatorRGB(:,:,1);
 GreenPixelValueOfIndicator=IndicatorRGB(:,:,2);
 IRM=mean(mean( RedPixelValueOfIndicator));                             %REMAINING WORK
 IGM=mean(mean( GreenPixelValueOfIndicator));
 
 if((IRM>150)&(IGM<100))                                          % printing color of indicator
     disp('indicator is red')
 end
 if((IRM<100)&(IGM>150))
     disp('indicator is green')
 end
 
 
IndicatorPRO=regionprops(IndicatorBW,'basic');           %removing indicator from arrena
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

   %imtool(resizedArrena);
 
   
                                                  % FINDING RED BLOCKS
 RedBricks=resizedArrena(:,:,1)>=(r(2,1)-10)&resizedArrena(:,:,2)<=(r(2,4)+10)&resizedArrena(:,:,3)<=(r(2,6)+10)&resizedArrena(:,:,1)<=(r(2,2)+10)&resizedArrena(:,:,2)>=(r(2,3)-10)&resizedArrena(:,:,3)>=(r(2,5)-10);           % separating red bricks
 str=strel('square',4);
 RedBricks=imerode(RedBricks,str);
 RedBricks=imdilate(RedBricks,str);
 %imtool(RedBricks);
 
 RBPro=regionprops(RedBricks,'basic');
 [n1,n2]=size(RBPro);
 for i=1:n1
 cr(i,:)=RBPro(i).Centroid;                                   % saving information  of location of red bricks in 8,8 grid
 
 end
  for i=1:n1
      for j=0:7
          if ((cr(i,2)>(j*60))&(cr(i,2)<((j+1)*60)))
          for k=0:7
              if ((cr(i,1)>(k*60))&(cr(i,1)<((k+1)*60)))
                  A((j+1),(k+1))=20;
              end
          end
          end
      end
  end

                                                                          % FINDING GREEN BLOCKS
 GreenBricks=resizedArrena(:,:,1)<=(r(1,2)+10)&resizedArrena(:,:,2)>=(r(1,3)-10)&resizedArrena(:,:,3)<=(r(1,6)+10)&resizedArrena(:,:,1)>=(r(1,1)-10)&resizedArrena(:,:,2)<=(r(1,4)+10)&resizedArrena(:,:,3)>=(r(1,5)-10);          % separating green bricks
 str=strel('square',4);
 GreenBricks=imerode(GreenBricks,str);
 GreenBricks=imdilate(GreenBricks,str);
 %imtool(GreenBricks);
 
  GBPro=regionprops(GreenBricks,'basic');                                 % saving information  of location of green bricks in 8,8 grid
 [n1,n2]=size(RBPro);
 for i=1:n1
 cb(i,:)=GBPro(i).Centroid;
 
 end
  for i=1:n1
      for j=0:7
          if ((cb(i,2)>(j*60))&(cb(i,2)<((j+1)*60)))
          for k=0:7
              if ((cb(i,1)>(k*60))&(cb(i,1)<((k+1)*60)))
                  A((j+1),(k+1))=1;
              end
          end
          end
      end
  end
   
   
                                                      % FINDING LOCATION OF
                                                      % BOT front
  BotFront=resizedArrena(:,:,1)<=(r(5,2)+10)&resizedArrena(:,:,1)>=(r(5,1)-10)&resizedArrena(:,:,2)>=(r(5,3)-10)&resizedArrena(:,:,3)<=(r(5,6)+10)&resizedArrena(:,:,2)<=(r(5,4)+10)&resizedArrena(:,:,3)>=(r(5,5)-10); 
  str=strel('square',4);
  BotFront =imerode(BotFront,str);
  BotFront=imdilate(BotFront,str);

 
  BFPro=regionprops(BotFront,'basic');                                 % saving information  of location of bot front in 8,8 grid
  [n1,n2]=size(BFPro);
  for i=1:n1
  cb(i,:)=BFPro(i).Centroid;
 
  end
  for i=1:n1
      for j=0:7
          if ((cb(i,2)>(j*60))&(cb(i,2)<((j+1)*60)))
          for k=0:7
              if ((cb(i,1)>(k*60))&(cb(i,1)<((k+1)*60)))
                  A((j+1),(k+1))=A((j+1),(k+1))+500;
              end
          end
          end
      end
  end
  % imtool(BotFront)
   
   
                                                        % BOT BACK
  BotBack=resizedArrena(:,:,1)<=(r(6,2)+10)&resizedArrena(:,:,1)>=(r(6,1)-10)&resizedArrena(:,:,2)>=(r(6,3)-10)&resizedArrena(:,:,3)<=(r(6,6)+10)&resizedArrena(:,:,2)<=(r(6,4)+10)&resizedArrena(:,:,3)>=(r(6,5)-10); 
  str=strel('square',4);
  BotBack =imerode(BotBack,str);
  BotBack=imdilate(BotBack,str);

 
  BBPro=regionprops(BotBack,'basic');                                 % saving information  of location of bot back in 8,8 grid
  [n1,n2]=size(BBPro);
  for i=1:n1
  cb(i,:)=BBPro(i).Centroid;
 
  end
  for i=1:n1
      for j=0:7
          if ((cb(i,2)>(j*60))&(cb(i,2)<((j+1)*60)))
          for k=0:7
              if ((cb(i,1)>(k*60))&(cb(i,1)<((k+1)*60)))
                  A((j+1),(k+1))=A((j+1),(k+1))+600;
              end
          end
          end
      end
  end
  %imtool(BotBack)
  A(:,:)
            
  
  
  
  
                              %CONSTRUCTIONSITE
  
  CSArray=zeros(3,5);                                    %defining blank array for cnstrctn site
  
  ConstructionSite=(resizedArrenaO(:,:,1)>(r(3,1)-10))&(resizedArrenaO(:,:,2)>(r(3,3)-10))&(resizedArrenaO(:,:,3)>(r(3,5)-10))&(resizedArrenaO(:,:,1)<=(r(3,2)+10))&(resizedArrenaO(:,:,2)<=(r(3,4)+0))&(resizedArrenaO(:,:,3)<=(r(3,6)+10));      %seperating constrctn site
ConstructionSite=bwlabel(ConstructionSite);
str=strel('square',2);
ConstructionSite=imerode(ConstructionSite,str);

ConstructionSite=bwareaopen(ConstructionSite,2000);                           

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
CSArray=[CSArray(1,1):CSArray(1,5),CSArray(2,1):CSArray(2,5),CSArray(3,1):CSArray(3,5)];
CSArray
  
imtool(ConstructionSite)



                                                  

   
   
   
   
end
 
 
 
 
 
 
 


 