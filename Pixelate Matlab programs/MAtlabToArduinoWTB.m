function [] = MAtlabToArduinoWTB(flag,dist,angle1)




scr= serial('COM3','BaudRate',9600);
    fopen(scr);
    pause(3);
    
    if (flag=='R')
        fwrite(scr,'R');            %giving command to turn right
        pause(0.28*angle1/90);
        fwrite(scr,'X');           %giving command to stop bot
        pause(0.1);
        
    elseif (flag=='L')
        fwrite(scr,'L');            %giving command to turn left
        pause(.28*angle1/90);
        fwrite(scr,'X');           %giving command to stop bot
        pause(0.1);
        
    elseif (flag=='S')
        fwrite(scr,'S');            %giving command to  move straight
        pause(.54*dist/60);
        fwrite(scr,'X');           %giving command to stop bot
        pause(0.1);
        
    elseif (flag=='B')
        fwrite(scr,'B');            %giving command to  move back
        pause(.54*dist/60);
        fwrite(scr,'X');           %giving command to stop bot
        pause(0.1);
        
        elseif (flag=='G')
        fwrite(scr,'G');            %giving command to  move straight
        pause(.54*dist/60);
        fwrite(scr,'Z');           %giving command to stop bot
        pause(0.1);
        
        elseif (flag=='U')
        fwrite(scr,'U');            %giving command to  move straight
        pause(.54*dist/60);
        fwrite(scr,'Z');           %giving command to stop bot
        pause(0.1);
    end
    
    fclose(scr);
end
    