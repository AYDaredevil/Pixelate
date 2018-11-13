function [r,resizedArrena,A] = pvalue(Arrena)

ArrenaGrid=zeros(8,8);
A= ArrenaGrid;
    
%Arrena=imread('arrena5.jpg');
arrena=imresize(Arrena,[480,480]);
resizedArrena=arrena;
resizedArrena=imrotate(resizedArrena,-90);
array=zeros(6,9);

green=imcrop(arrena);                            %saving green pixel values
%imtool(green)

greenred=green(:,:,1);
greengreen=green(:,:,2);
greenblue=green(:,:,3);

minGreenRed=min(min(greenred));
maxGreenRed=max(max(greenred));
array(1,1)=minGreenRed;
array(1,2)=maxGreenRed;

meanGreenRed=mean(mean(greenred));
array(1,7)=meanGreenRed;


minGreenGreen=min(min(greengreen));
maxGreenGreen=max(max(greengreen));
array(1,3)=minGreenGreen;
array(1,4)=maxGreenGreen;

meanGreenGreen=mean(mean(greengreen));
array(1,8)=meanGreenGreen;

minGreenBlue=min(min(greenblue));
maxGreenBlue=max(max(greenblue));
array(1,5)=minGreenBlue;
array(1,6)=maxGreenBlue;

meanGreenBlue=mean(mean(greenblue));
array(1,9)=meanGreenBlue;

red=imcrop(arrena);                              % saving red pixel values min, max and mean values
%imtool(red)
redred=red(:,:,1);
redgreen=red(:,:,2);
redblue=red(:,:,3);

minRedRed=min(min(redred));
maxRedRed=max(max(redred));
array(2,1)=minRedRed;
array(2,2)=maxRedRed;

meanredred=mean(mean(redred));
array(2,7)=meanredred;

minRedGreen=min(min(redgreen));
maxRedGreen=max(max(redgreen));
array(2,3)=minRedGreen;
array(2,4)=maxRedGreen;

meanredgreen=mean(mean(redgreen));
array(2,8)=meanredgreen;

minredBlue=min(min(redblue));
maxRedBlue=max(max(redblue));
array(2,5)=minredBlue;
array(2,6)=maxRedBlue;

meanredblue=mean(mean(redblue));
array(2,9)=meanredblue;


white=imcrop(arrena);                        %saving white(construction site) pixel values
%imtool(white)

whitered=white(:,:,1);
whitegreen=white(:,:,2);
whiteblue=white(:,:,3);

minwhitered=min(min(whitered));
maxwhitered=max(max(whitered));
array(3,1)=minwhitered;
array(3,2)=maxwhitered;

minwhitegreen=min(min(whitegreen));
maxwhitegreen=max(max(whitegreen));
array(3,3)=minwhitegreen;
array(3,4)=maxwhitegreen;

minwhiteblue=min(min(whiteblue));
maxwhiteblue=max(max(whiteblue));
array(3,5)=minwhiteblue;
array(3,6)=maxwhiteblue;

black=imcrop(arrena);                    %black(bCKGROUNG) pixel VALUES
%imtool(black) 
blackred=black(:,:,1);
blackgreen=black(:,:,2);
blackblue=black(:,:,3);

minblackred=min(min(blackred));
maxblackred=max(max(blackred));
array(4,1)=minblackred;
array(4,2)=maxblackred;

minblackgreen=min(min(blackgreen));
maxblackgreen=max(max(blackgreen));
array(4,3)=minblackgreen;
array(4,4)=maxblackgreen;

minblackblue=min(min(blackblue));
maxblackblue=max(max(blackblue));
array(4,5)=minblackblue;
array(4,6)=maxblackblue;

botfront=imcrop(arrena);                        %saving bot front pixel values
%imtool(green)

botfrontred=botfront(:,:,1);
botfrontgreen=botfront(:,:,2);
botfrontblue=botfront(:,:,3);

minbotfrontred=min(min(botfrontred));
maxbotfrontred=max(max(botfrontred));
array(5,1)=minbotfrontred;
array(5,2)=maxbotfrontred;

minbotfrontgreen=min(min(botfrontgreen));
maxbotfrontgreen=max(max(botfrontgreen));
array(5,3)=minbotfrontgreen;
array(5,4)=maxbotfrontgreen;

minbotfrontblue=min(min(botfrontblue));
maxbotfrontblue=max(max(botfrontblue));
array(5,5)=minbotfrontblue;
array(5,6)=maxbotfrontblue;



botback=imcrop(arrena);                                                %bot back pixel
%imtool(red)
botbackred=botback(:,:,1);
botbackgreen=botback(:,:,2);
botbackblue=botback(:,:,3);

minbotbackred=min(min(botbackred));
maxbotbackred=max(max(botbackred));
array(6,1)=minbotbackred;
array(6,2)=maxbotbackred;

minbotbackgreen=min(min(botbackgreen));
maxbotbackgreen=max(max(botbackgreen));
array(6,3)=minbotbackgreen;
array(6,4)=maxbotbackgreen;

minbotbackblue=min(min(botbackblue));
maxbotbackblue=max(max(botbackblue));
array(6,5)=minbotbackblue;
array(6,6)=maxbotbackblue;
r=array;

end