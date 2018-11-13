function [A,ColorOfIndicator,IndicatorBW] = FindColorofIndicator(r,resizedArrena,A)
        imtool(resizedArrena);                                                                                                                                                              
  [ IndicatorBW] = ColorOfIndicatorCheck(r,resizedArrena);               % fn checking color of indicator
  
 %IndicatorBW=resizedArrena(:,:,1)<=(r(1,2)+10)&resizedArrena(:,:,2)<=(r(1,4)+10)&resizedArrena(:,:,3)<=(r(1,6)+10)&resizedArrena(:,:,1)>=(r(1,1)-10)&resizedArrena(:,:,2)>=(r(1,3)-10)&resizedArrena(:,:,3)>=(r(1,5)-10);     % separating indicator
 
 IndicatorBW=bwareaopen(IndicatorBW,1000);                      %taking bw image of indicator
 imtool(IndicatorBW)
 
 BPPro=regionprops(IndicatorBW,'basic');                                    %finding color of indicator
 IndicatorRGB=imcrop(resizedArrena,BPPro.BoundingBox);
 imtool(IndicatorRGB)

 [n1,n2]=size(BPPro);
 for i=1:n1
 cb(i,:)=BPPro(i).Centroid;
 
 end                                                               
  for i=1:n1                                                                  % saving location of indicator=300 in grid
      for j=0:8
          if ((cb(i,2)>(j*60))&(cb(i,2)<((j+1)*60)))
          for k=0:8
              if ((cb(i,1)>(k*60))&(cb(i,1)<((k+1)*60)))
                  A((j+1),(k+1))=300;                                      
              end
          end
          end
      end
  end
 A
 RedPixelValueOfIndicator=IndicatorRGB(:,:,1);
 GreenPixelValueOfIndicator=IndicatorRGB(:,:,2);
 IRM=mean(mean( RedPixelValueOfIndicator));                                    
 IGM=mean(mean( GreenPixelValueOfIndicator));
 
 IRM
 IGM


 if((IRM>=(r(2,7)-50))&(IGM<(r(2,8)+50)))                                      % printing color of indicator
     ColorOfIndicator=[2];                     
     disp('indicator is red')
     
 end
 if((IRM<(r(1,7)+50))&(IGM>(r(1,8)-50)))
     ColorOfIndicator=[1];
     disp('indicator is green')
     
 end
 


end

