function [ ] = serial( )

[ output] = outputToAd( );

if (output=='A')
    fwrite(scr,'B');
    pause(1);
end
if (output=='B')
    fwrite(scr,'B');
    pause(1);
end
end

