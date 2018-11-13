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
ArrenaGrid=zeros(5,5);
A= ArrenaGrid;
pause(2);

Arrena = getsnapshot(vid);
[r,resizedArrena,A] = pvalue(Arrena);


while(1)
    
    Arrena = getsnapshot(vid);
    resizedArrena=imresize(Arrena,[300,300]);
    [CofCS,A,ColorOfIndicator,CofBot,CofRB,CofGB,EndFlag] = TakilaPcheckwithIND(r,resizedArrena,A,vid);
    
    %[CofCS,A,ColorOfIndicator,CofBot,CofRB,CofGB,EndFlag] = TakilaP (r,resizedArrena,A,vid);
    if EndFlag=='F'
        break
    end
    
    pause(.1);
    
    
end

while(1)
   Arrena = getsnapshot(vid);
    resizedArrena=imresize(Arrena,[300,300]); 
    
   [CofCS,A,ColorOfIndicator,CofBot,CofRB,CofGB,EndFlag] = TakilaPcheckwithINDtoCS(r,resizedArrena,A,vid);
 
  %[CofCS,A,ColorOfIndicator,CofBot,CofRB,CofGB,EndFlag] = TakilaPToCS(r,resizedArrena,A,vid); 
  
   if EndFlag=='F'
        break
    end
  
end



close(vid);


