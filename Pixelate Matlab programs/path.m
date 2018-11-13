 function[l]= path(black_rgb,cdata)
black_image=imagecrop(black_rgb,cdata);
imvar = black_image;
[m , n]=size(imvar);
imvar = medfilt2(1-imvar , [5 5]);
imvar = 1-imvar;
imtool(imvar);
l=ones(8,8);
u=0;
for s=1: floor(m/8): 8*floor(m/8)-1
    u=u+1;
    v=0;
    for t=1:floor(n/8):8*floor(n/8)-1
        v=v+1;
        if imvar(s+ floor(m/16),t+floor(n/16))==0
            l(u,v)=0;
        end
    end
end
end
