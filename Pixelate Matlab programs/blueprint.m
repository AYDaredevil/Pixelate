function [bp_mat, cs_bb, ind_bb]=blueprint(cdata, red_rgb, green_rgb, white_rgb, black_rgb)
red_rgb = colorcrop(cdata);
red_image = imagecrop(cdata, red_rgb);
green_rgb = colorcrop(cdata);
green_image = imagecrop(cdata, green_rgb);
white_rgb = colorcrop(cdata);
white_image = imagecrop(cdata, white_rgb);
black_rgb=colorcrop(cdata);
black_img = imagecrop(cdata, black_rgb);
cdata=(1-black_img);
cdata=bwmorph(cdata,'erode',6);
cdata=bwmorph(cdata,'dilate',6);
im_labeled=bwlabel(cdata);
stats=regionprops(im_labeled,'basic');
z=find(max([stats(:,1).Area]) == [stats(:,1).Area]);
cs_bb=stats(z,1).BoundingBox;
stats(z,1).Area=0;
z1=find(max([stats(:,1).Area]) == [stats(:,1).Area]);
bp_bb=stats(z1,1).BoundingBox;
stats(z1,1).Area=0;
z2=find(max([stats(:,1).Area]) == [stats(:,1).Area]);
ind_bb=stats(z2,1).BoundingBox;
m = bp_bb(3);
n = bp_bb(4);
u=1;
bp_mat = zeros(3,5);
for i=floor(bp_bb(1)):floor(m/5):bp_bb(1) + m -1
    v = 1;
    for j=floor(bp_bb(2)):floor(n/3): bp_bb(2) + n -1
        if (white_image(j+floor(n/6), i+floor(m/10)) == 1)
            bp_mat(v,u) = 0;
        elseif (green_image(j+floor(n/6), i+floor(m/10)) == 1)
            bp_mat(v,u) = 1;
        elseif (red_image(j+floor(n/6), i+floor(m/10)) == 1)
            bp_mat(v,u) = 2;
        end
        v = v + 1;
    end
    u = u+1;
end
end

