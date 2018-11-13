Arrena=imread('arrena2.jpg');
resizedArrena=imresize(Arrena,[480,480]);                                                 %resizing of arrena
resizedArrenaO=imresize(Arrena,[480,480]); 

resizedArrena=resizedArrena(:,:,1)>200&resizedArrena(:,:,2)>200&resizedArrena(:,:,3)>200;

resizedArrena=bwlabel(resizedArrena);
imtool(resizedArrena)
prop=regionprops(resizedArrena,'basic');
prop(18).Area