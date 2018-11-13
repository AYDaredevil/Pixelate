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
src.Saturation = 82:

tv = vision.VideoPlayer;
preview(vid);
start(vid);

ArrenaGrid=zeros(5,5);                                                                      % grid matrix
A= ArrenaGrid;

[CofGrid ] = GridCentroid();                                                                %  Grid centriods

Arrena = getsnapshot(vid);                                                                  % saving pixele value
[r,resizedArrena,A] = pvalue(Arrena);

[A,xOfBP,yOfBP,BlueprintArray,BBofBlueprint,BPprop] = BlueprintInfo(resizedArrena,A,r);     % blueprint info


while(1)
    
    Arrena = getsnapshot(vid);
    resizedArrena=imresize(Arrena,[300,300]);
    
    [A,CofBot,ColorOfIndicator,CofRB,CofGB,EndFlag,B] = CallingFNtoBlock(resizedArrena,A,r,CofGrid);       % grabing block
    
    if EndFlag=='F';
        break
    end
    
end

while(1)
    
    Arrena = getsnapshot(vid);
    resizedArrena=imresize(Arrena,[300,300]);
    
    [A,CofBot,ColorOfIndicator,CofRB,CofGB,EndFlag,B] = CallingFNtoCS(resizedArrena,A,r,CofGrid);                    %  Bot MOVEMENT TO CS
    
    if EndFlag=='F';
        break
    end
end


while(1)
    Arrena = getsnapshot(vid);
    resizedArrena=imresize(Arrena,[300,300]);
    resizedArrenaO=resizedArrena;
    
    [A,CofBot] = BotInfo(resizedArrena,A,r,resizedArrenaO) ;
    
    [A,B,CSArray,CofCS,StartCofCS] = cnstructionsiteInfo(resizedArrenaO,A,r )
    [NotArranged_G,NotArranged_R]=CheckCS (CSArray,BlueprintArray);                                                       % checking cs
    
    if ((NotArranged_G(1,1)~=0))
        
    [EndFlag,A] = CallinfFNtoAGreen(NotArranged_G,CofBot,CofGrid,resizedArrena,A,r,resizedArrenaO,vid);
    
    if (EndFlag=='F')
        
        
    end
    end
    
    if ((NotArranged_R(1,1)~=0))
        
        
    end
    
    
end
    
    
    
    
    
    
    
