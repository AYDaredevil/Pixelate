function [ ] = array( )

imBluePrint=imread('blprnt.j2c');
%sizeOfArray = size(imBluePrint);
imBluePrint = imresize(imBluePrint, [60,100]);
z=1;


for i=1:20:60
    for j=1:20:100
        box=imcrop(imBluePrint,[j i 20 20]);
        
       red= box(:,:,1);
       green=box(:,:,2);
        redMean=mean(mean(red));
       % redMean=mean(avrR);
       greenMean=mean(mean(green));
       % greenMean=mean(avgG);
        if(redMean>150&greenMean<70)
            %bluePrintArray(()
             box=20;
        elseif(redMean<70&greenMean>150)
            box=1;
        else
            box=0;
         
        end
         BlueprintArray(z)=box;
          z=z+1;
     
     end
end
BlueprintArray
end



