function[centb,centf,bot_cent]=botcentroids1(orange_image, blue_image)
botf=bwmorph(orange_image,'erode',6);
botf=bwmorph(botf,'dilate',6);
botf_labeled=bwlabel(botf);
stats=regionprops(botf_labeled,'basic');
centf=stats().Centroid;
botb=bwmorph(blue_image,'erode',6);
botb=bwmorph(botb,'dilate',6);
botb_labeled=bwlabel(botb);
stats=regionprops(botb_labeled,'basic');
centb=stats().Centroid;
bot_cent=(centb+centf)/2;
end