function [] = arduino()

flag='a';
time=10;
scr= serial('COM3','BaudeRate',9600);

fopen(scr);
pause(1);
%while(1)
fwrite(scr,flag);
pause(1);

%fwrite(scr,flag);
fclose(scr);
%pause(1);


end
