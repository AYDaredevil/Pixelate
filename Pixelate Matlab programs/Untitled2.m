vid = videoinput('winvideo', 1, 'MJPG_1280x720');
src = getselectedsource(vid);

vid.FramesPerTrigger = 1;

preview(vid);

stoppreview(vid);

preview(vid);

stoppreview(vid);

preview(vid);

start(vid);

stoppreview(vid);

