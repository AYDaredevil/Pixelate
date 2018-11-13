vid = videoinput('winvideo', 1, 'MJPG_1280x720');
src = getselectedsource(vid);
%color calibaration

scr = serial('COM5', 'BaudRate', 9600);
fopen(scr);
pause(2);

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
[bp_mat, cs_bb,ind_bb]=blueprint(cdata, red_rgb, green_rgb, white_rgb, black_rgb);
[centb,centf,bot_cent]=botcentroids1(orange_rgb, blue_rgb);
[bot_cent_node] = findnode(bot_cent);
[l]= path(black_image);
[adj] = adjacency(l);
[ind_value]=indicator(im, ind_bb, green_rgb, red_rgb);
if(ind_value==1)
[x]=nearest_block(ind_value,red_rgb,green_rgb);
[n] = findnode(x);
[y] = dijkstra(adj, bot_cent_node, n);
[m,n]=size(y);
for i=1:1:n-1
  [theta dist]=get_theta_dist(centb,centf,bot_cent,y(i));
  [] = arduinomove(theta,dist);
  if(i==2)
      break;
  end
end
    GRAB GRAB GRAB
   if(ind_value==1)
   [x,mat,t1]=after_grab(bp_mat,cs_bb,ind_value);
   [n] = findnode(x);
   [y] = dijkstra(adj, bot_cent_node, n);
   [m,n]=size(y);
   for i=1:1:n-1
   [ theta dist]=get_theta_dist(centb,centf,bot_cent,y(i));
    [] = arduinomove(theta,dist);
    if(i==2)
       break;
    end
    end
    
    