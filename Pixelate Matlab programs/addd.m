vid = videoinput('winvideo', 1, 'MJPG_1280x720');
%preview(vid);
tv = vision.VideoPlayer;
while(1);
im = getsnapshot(vid);
im(:,:,2:3)=0;
step(tv,im);
end
close(vid);