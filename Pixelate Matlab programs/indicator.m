function [ind_mat]=indicator(im, ind_bb, green_rgb, red_rgb)
ind_mat=zeros(1,1);
k=ind_bb(3);
x=ind_bb(1);
l=ind_bb(4);
y=ind_bb(2);
red_image = imagecrop(im, red_rgb);
green_image = imagecrop(im, green_rgb);
if(green_image(floor(x)+floor(k/2),floor(y)+floor(l/2)) == 1)
    ind_mat(1,1)=1; 
elseif(red_image(floor(x)+floor(k/2),floor(y)+floor(l/2)) == 1)
    ind_mat(1,1)=2;
end
