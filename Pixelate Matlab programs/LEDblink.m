function [] =LEDblink(ColorOfIndicator)


if ColorOfIndicator==1
    
    scr= serial('COM3','BaudRate',9600);
    fopen(scr);
    pause(3);
    
    if (flag=='I')
        fwrite(scr,'I');            %givimg command to blink green LED
        pause(3);
        fwrite(scr,'O');
        pause(0.1);
        fclose(scr);
    end
end
if ColorOfIndicator==2
    scr= serial('COM3','BaudRate',9600);
    fopen(scr);
    pause(3);
    
    if (flag=='J')
        fwrite(scr,'J');            %giving command to link green LED
        pause(3);
        fwrite(scr,'O');
        pause(0.1);
        fclose(scr);
        
    end
end
end