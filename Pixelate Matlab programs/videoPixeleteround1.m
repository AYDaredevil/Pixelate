vid = videoinput('winvideo', 2, 'MJPG_1024x576');
%src.Brightness = -64;
%preview(vid);
src = getselectedsource(vid);
vid.ROIPosition = [287 3 563 555];
%vid.ROIPosition = [259 7 569 564];
src.Brightness = 54;
src.Contrast = 42;
src.Exposure = -5;
src.Gain = 107;
src.Saturation = 82;

tv = vision.VideoPlayer;
preview(vid);
start(vid);

ArrenaGrid=zeros(5,5);                                                                      % grid matrix
A= ArrenaGrid;

[CofGrid ] = GridCentroid();                                                                %  Grid centriods

Arrena = getsnapshot(vid);                                                                  % saving pixele value
Arrena=imrotate(Arrena,-90);
[r,resizedArrena,A] = pvalue(Arrena);

[A,xOfBP,yOfBP,BlueprintArray,BBofBlueprint,BPprop] = BlueprintInfo(resizedArrena,A,r);     % blueprint info

while(1)
    
while(1)
    
    Arrena = getsnapshot(vid);
    Arrena=imrotate(Arrena,-90);
    resizedArrena=imresize(Arrena,[300,300]);
    
    [A,CofBot,ColorOfIndicator,CofRB,CofGB,EndFlag,B] = CallingFNtoBlock(resizedArrena,A,r,CofGrid);       % grabing block
    
    if EndFlag=='F';
        break
    end
    
end

while(0)
    
    Arrena = getsnapshot(vid);
    Arrena=imrotate(Arrena,-90);
    resizedArrena=imresize(Arrena,[300,300]);
    
    [A,CofBot,ColorOfIndicator,CofRB,CofGB,EndFlag,B] = CallingFNtoCS(resizedArrena,A,r,CofGrid);                    %  Bot MOVEMENT TO CS
    
    if EndFlag=='F';
        break
    end
end
end

close(vid);