function [] = ardinomoveback(theta, dist)
if (theta<=7  && theta>=-7)
    fwrite(src, 'f');
    pause(dist/x);
    fwrite(src, 's');
end
if (theta>7 && theta<=90)
    fwrite(src,'r');
    pause(0.5);
    fwrite(src,'f');
    pause(dist/x1);
    fwrite(src,'s');
end
if (theta>90 && theta<=180)
    fwrite(src,'r');
    pause(0.5);
    fwrite(src,'r');
    pause(0.5);
    fwrite(src,'f');
    pause(dist*1/x2);
    fwrite(src,'s');
end  
if (theta<-7 && theta>=-90)
    fwrite(src,'l');
    pause(0.5);
    fwrite(src,'f');
    pause(dist*1/x3);
    fwrite(src,'s');
end 
if (theta>=180 && theta<-90)
    fwrite(src,'l')
    pause(0.5);
    fwrite(src,'l')
    pause(0.5);
    fwrite(src,'f')
    pause(dist*1/x4);
    fwrite(src,'s')
    fclose(src)
end

    
    