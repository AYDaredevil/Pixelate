function [A] = findingPathByCofIndicatorToDest(ColorOfIndicator,A)


    for i=1:5
        for j=1:5
   
              if (A(i,j)==10)
                A(i,j)=4;
                
              elseif (A(i,j)==0)
                A(i,j)=1;
                
            
              elseif (A(i,j)==5)
                A(i,j)=5;
            
                  else
                 A(i,j)=0;
              end
                    

        end
    end
     

end
