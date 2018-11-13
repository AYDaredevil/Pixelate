function [] = arduinomove(theta,dist)
if (theta<7  && theta>-7)
    fwrite(src, 'f');
    pause(dist*1/x);
    fwrite(src, 's');
end
if (theta>7 && theta>180)
    fwrite(src,'r');
    pause(0.5);
    fwrite(src,'f');
    pause(dist*1/x1);
    fwrite(src,'s');
end
if theta>-180 && theta<-7
    fwrite(src,'l');
    pause(0.5);
    fwrite(src,'f');
    pause(dist*1/x2);
    fwrite(src,'s');
    fclose(src);
end
end 
