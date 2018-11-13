function [A,xOfBP,yOfBP,BlueprintArray,BBofBlueprint,BPprop] = BlueprintInfo(resizedArrena,A,r)

Blueprint=resizedArrena(:,:,1)<=(r(4,2)+30)&resizedArrena(:,:,2)<=(r(4,4)+30)&resizedArrena(:,:,3)<=(r(4,6)+30);
Blueprint= ~Blueprint;

str = strel('square',10);
Blueprint=imerode(Blueprint,str);
%pro=regionprops(Blueprint,'basic');
Blueprint=bwareaopen(Blueprint,4000);
%Blueprint=bwareaopen()
BPprop=regionprops(Blueprint,'basic');
BoundingBox(1,:)=BPprop.BoundingBox;
Blueprint=imcrop(resizedArrena,BPprop.BoundingBox);
imtool(Blueprint)
 imBluePrint = imresize(Blueprint, [60,100]);            %saving blueprint in an array      BY finding average of pixel values  of each block
BBofBlueprint=[BoundingBox(1,1),BoundingBox(1,2);BoundingBox(1,1)+60,BoundingBox(1,2)];

xOfBP=BoundingBox(1,1);
yOfBP=BoundingBox(1,2);
i=1;
j=1;
for a=1:20:60
    for b=1:20:100
        box=imcrop(imBluePrint,[b a 20 20]);                % croping 20,20 block from croped blueprint to finr color of block
        %imtool(box)
       red= box(:,:,1);
       green=box(:,:,2);
       
       redMean=mean(mean(red));
       greenMean=mean(mean(green));
       
       if(redMean>=(r(2,7)-50)&greenMean<=(r(2,8)+50))
             box=2;                                       % if block is red then saving value 20 in array 
        elseif(redMean<=(r(1,7)+50)&greenMean>=(r(1,8)-50))
            box=1;                                         % if block is green saving vlue 1 in array
        else
            box=0;                                         % if block is white saving value 0 in array
         
       end
      
         BlueprintArray(i,j)=box;
          j=j+1;
         if (j>5)
             j=1;
             i=i+1;
         end
     end
end
BlueprintArray ;                                                                       % printing array of blueprints  containing info of color
 



    for n=1:2
      for j=0:7                                                                      % saving location of blue print in 8,8 GRID
          if (((BBofBlueprint(n,2)+30)>(j*60))&(((BBofBlueprint(n,2)+30)<((j+1)*60))))
          for k=0:7
              if (((BBofBlueprint(n,1)+30)>(k*60))&(((BBofBlueprint(n,1)+30)<((k+1)*60))))
                  A((j+1),(k+1))=1000;
                  
              end
          end
          end
      end
    end





end

