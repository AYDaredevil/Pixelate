function[] = motion(y)
[m,n]=size(y);
for i=1:1:n-1
     orange_rgb=colorcrop(cdata);
     orange_image=imagecrop(cdata, orange_rgb);
     blue_rgb=colorcrop(cdata);
     blue_image=imagecrop(cdata, blue_rgb);
    [centb,centf,bot_cent]=botcentroids1(orange_image, blue_image);
    [bot_cent_node] = findnode(bot_cent);
    [theta dist]=get_theta_dist(centb,centf,bot_cent,y(i))
    [] = arduinomove(theta,dist);
end