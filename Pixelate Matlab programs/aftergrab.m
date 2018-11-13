function []=aftergrab(cdata)
orange_rgb=colorcrop(cdata);
orange_image=imagecrop(cdata, orange_rgb);
blue_rgb=colorcrop(cdata);
blue_image=imagecrop(cdata, blue_rgb);
[~,~,bot_cent]=botcentroids1(orange_image, blue_image);
black_rgb=colorcrop(cdata);
black_img = imagecrop(cdata, black_rgb);
im=(1-black_img);
im=bwmorph(im,'erode',6);
im=bwmorph(im,'dilate',6);
im_labeled=bwlabel(im);
stats=regionprops(im_labeled,'basic');
z=find(max([stats(:,1).Area]) == [stats(:,1).Area]);
cs_bb=stats(z,1).BoundingBox;
m=cs_bb(3);
n=cs_bb(4);
t=1;
mat=zeros(3,m*n);
for i=1:1:5
    for j=1:1:3
         mat(1,t) = cs_bb(1)+(i-1)*m/5+m/10;
         mat(2,t) = cs_bb(2)+(j-1)*n/3+n/6;
         mat(3,t) = pdist(mat(1,t), mat(2,t), bot_cent(1), bot_cent(2));
         t=t+1; 
    end
end
min_dist=min(mat(3,:));
