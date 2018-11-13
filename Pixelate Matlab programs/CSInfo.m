function [A,CofCS] = CSInfo(resizedArrena,r,A)


  resizedArrenaO=imresize(resizedArrena,[300,300]);
  ConstructionSite=(resizedArrenaO(:,:,1)>(r(3,1)-20))&(resizedArrenaO(:,:,2)>(r(3,3)-20))&(resizedArrenaO(:,:,3)>(r(3,5)-20))&(resizedArrenaO(:,:,1)<=(r(3,2)+20))&(resizedArrenaO(:,:,2)<=(r(3,4)+20))&(resizedArrenaO(:,:,3)<=(r(3,6)+20));      %seperating constrctn site
   str=strel('square',2);
   ConstructionSite=imerode(ConstructionSite,str);
   ConstructionSite=imdilate(ConstructionSite,str);
   ConstructionSite=bwareaopen(ConstructionSite,2000); 
   
   CSPro=regionprops(ConstructionSite,'Basic');
   CofCS(1,:)=CSPro.Centroid;
   
    
 [n1,n2]=size(CSPro);
 for i=1:n1
 cr(i,:)=CSPro(i).Centroid;                                   % saving information  of location of CS in 5,5 grid
 
 end
  for i=1:n1
      for j=0:4
          if ((cr(i,2)>(j*60))&(cr(i,2)<((j+1)*60)))
          for k=0:4
              if ((cr(i,1)>(k*60))&(cr(i,1)<((k+1)*60)))
                  A((j+1),(k+1))=10;
              end
          end
          end
      end
  end
   

end

