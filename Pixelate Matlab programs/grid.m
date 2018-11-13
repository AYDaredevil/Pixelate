function [y]=grid(cdata);
im=imcrop(cdata);
im=imresize(im,[240 240]);
bw=colorcrop(im);
arena=(1-bw);
arena=bwmorph(arena,'erode',6);
arena_labeled=bwlabel(arena);
stats=regionprops(arena_labeled,'basic');
z=find(max([stats(:,1).Area]) == [stats(:,1).Area])
cs_bb=stats(z,1).BoundingBox;
stats(z,1).Area=0;
z1=find(max([stats(:,1).Area]) == [stats(:,1).Area])
bp_bb=stats(z1,1).BoundingBox;
imtool(arena);

end

