function [red_blocks,green_blocks] = getbloccks(im,green_rgb,red_rgb)
red_image = imagecrop(im, red_rgb);
green_image = imagecrop(im, green_rgb);
r_labeled=bwlabel(red_image);
stats1=regionprops(r_labeled,'basic');
g_labeled=bwlabel(green_image);
stats2=regionprops(g_labeled,'basic');
red_blocks=zeroes(1,x);
green_blocs=zeroes(1,x);
for i=1:1:x
   if(stats1(i,1).Area<=100)
   r=stats1(i,1).Centroid;
   a=8*floor(r(1)/k);
   b=ceil(r(2)/k);
   y1=a+b;
   red_blocks(1,i)=y1;
   end
end
  for i=1:1:y
   if(stats2(i,1).Area<=100)
   r=stats2(i,1).Centroid;
   a=8*floor(r(1)/k);
   b=ceil(r(2)/k);
   y2=a+b;
   green_blocks(1,i)=y2;
   end
  end
end