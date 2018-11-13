src = serial('COM5', 'BaudRate', 9600)
fopen(src)
pause(2);
fwrite(src, 'r');
pause(0.5);
fwrite(src,'s');
fclose(src)


