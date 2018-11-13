function [ColorOfIndicator,BlueprintArray,CSArray,A,CofCS,CofBot,StartCofCS]=Pixelete(r,count)

ArrenaGrid=zeros(8,8);                                                    % defining a 8,8 blank matrix///converting arrena in a grid of 8,8
A=ArrenaGrid;

Arrena=imread('arrena2.jpg');
resizedArrena=imresize(Arrena,[480,480]);                                                 %resizing of arrena

resizedArrenaO=imresize(Arrena,[480,480]);                                          %saving original arrena in another variable for furthur use
imtool(resizedArrena);


if countBP==1

[A,xOfBP,yOfBP,BlueprintArray,BBofBlueprint,BPprop] = BlueprintInfo(resizedArrena,A,r);          %calling fn, containing info of blueprint
%countBP=countBP+1;
end

                                                 % thresholding for indicator
 [A,ColorOfIndicator,IndicatorBW] = colorOFindicator(A,r,resizedArrena);                         %calling fn containing color of indicator                                                                                
                                                                                                                                                                        
  
 
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
                  A((j+1),(k+1))=2;
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
   
   
                                               % FINDING LOCATION OF BOT
                                                   
                                                     
                                                   
                                                      
                                                      
 [A,CofBot] = BotInfo(resizedArrena,A,r);
  
  
  
  
                              %finding CONSTRUCTIONSITE info
  
 [A,CSArray,CofCS,StartCofCS] = cnstructionsiteInfo(resizedArrenaO,A,r);
         
 
 
 
end
   
   
  
 
 