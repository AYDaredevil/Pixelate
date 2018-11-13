function [A,CofBot] = BotInfo(resizedArrena,A,r,resizedArrenaO)

x=25;
% BOT front
BotFront=resizedArrena(:,:,1)<=(r(5,2)+x)&resizedArrena(:,:,1)>=(r(5,1)-x)&resizedArrena(:,:,2)>=(r(5,3)-x)&resizedArrena(:,:,3)<=(r(5,6)+x)&resizedArrena(:,:,2)<=(r(5,4)+x)&resizedArrena(:,:,3)>=(r(5,5)-x);
str=strel('square',6);
BotFront =imerode(BotFront,str);
BotFront=imdilate(BotFront,str);
BotFront=bwareaopen(BotFront,80);


BFPro=regionprops(BotFront,'basic');                                  % saving information  of location of bot front in 8,8 grid
[n1,n2]=size(BFPro);
CofBot(1,:)=BFPro.Centroid;
A
for i=1:n1
    cb(i,:)=BFPro(i).Centroid;
    
end
for i=1:n1
    for j=0:7
        if ((cb(i,2)>(j*60))&(cb(i,2)<((j+1)*60)))
            for k=0:7
                if ((cb(i,1)>(k*60))&&(cb(i,1)<((k+1)*60)))
                    A((j+1),(k+1))=5;
                end
            end
        end
    end
end
imtool(BotFront)
y=28;
% BOT BACK
BotBack=resizedArrena(:,:,1)<=(r(6,2)+y)&resizedArrena(:,:,1)>=(r(6,1)-y)&resizedArrena(:,:,2)>=(r(6,3)-y)&resizedArrena(:,:,3)<=(r(6,6)+y)&resizedArrena(:,:,2)<=(r(6,4)+y)&resizedArrena(:,:,3)>=(r(6,5)-y);
str=strel('square',6);
BotBack =imerode(BotBack,str);
BotBack=imdilate(BotBack,str);


BBPro=regionprops(BotBack,'basic');                                 % saving information  of location of bot back in 8,8 grid
CofBot(2,:)=BBPro.Centroid;

% [n1,n2]=size(BBPro);
%for i=1:n1
%cb(i,:)=BBPro(i).Centroid;

%end
%for i=1:n1
%   for j=0:4
%     if ((cb(i,2)>(j*60))&(cb(i,2)<((j+1)*60)))
%      for k=0:4
%        if ((cb(i,1)>(k*60))&(cb(i,1)<((k+1)*60)))
%           A((j+1),(k+1))=A((j+1),(k+1));
%      end
% end
%  %end
% end
%end
imtool(BotBack)




end

