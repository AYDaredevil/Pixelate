function[q] = imagecrop(cdata, rgb)
clr_var=8;
q=cdata(:,:,1)<=rgb(1) + clr_var & cdata(:,:,1)>= rgb(2)- clr_var & cdata(:,:,2)<= rgb(3) + clr_var & cdata(:,:,2)>= rgb(4) - clr_var & cdata(:,:,3)<= rgb(5) + clr_var & cdata(:,:,3)>= rgb(6) - clr_var;
imtool(q);
end