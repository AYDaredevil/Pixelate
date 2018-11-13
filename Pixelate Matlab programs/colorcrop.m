function [rgb] = colorcrop(cdata)
rgb=zeros(1,6);
im = imcrop(cdata);
rmax=max(max(im(:,:,1)));
rmin=min(min(im(:,:,1)));
gmax=max(max(im(:,:,2)));
gmin=min(min(im(:,:,2)));
bmax=max(max(im(:,:,3)));
bmin=min(min(im(:,:,3)));
rgb(1,1) = rmax; rgb(1,2) = rmin; rgb(1,3) = gmax; rgb(1,4) = gmin; rgb(1,5) = bmax; rgb(1,6)=bmin;
end