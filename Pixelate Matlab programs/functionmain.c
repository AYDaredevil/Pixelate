function
red_rgb=colorcrop(cdata);
red_image=imagecrop(cdata, red_rgb);
green_rgb=colorcrop(cdata);
green_image=imagecrop(cdata, green_rgb);
white_rgb=colorcrop(cdata);
white_image=imagecrop(cdata, white_rgb);
black_rgb=colorcrop(cdata);
black_image=imagecrop(cdata, black_rgb);
orange_rgb=colorcrop(cdata);
orange_image=imagecrop(cdata, orange_rgb);
blue_rgb=colorcrop(cdata);
blue_image=imagecrop(cdata, blue_rgb);
[bp_mat, cs_bb, ind_bb]=blueprint(im, red_rgb, green_rgb, white_rgb, black_rgb);
[ind_mat]=indicator(im, ind_bb, green_rgb, red_rgb);
[centb,centf,bot_cent]=botcentroids1(orange_image, blue_image);
[bot_cent_node] = findnode(bot_cent);

