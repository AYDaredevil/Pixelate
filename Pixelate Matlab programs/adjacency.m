function[adj] = adjacency(l)
adj=zeros(64,64);
i1 =1; m=0;
for j=1:8
    for i=1:8
        if (j+1<9 && l(i,j) == l(i,j+1))
            adj(i1,8*m+8+i)= l(i,j+1);
        end
        if (j-1>0 && l(i,j)==l(i,j-1))
            adj(i1,8*m-8+i) = l(i,j-1);
        end
        if (i-1>0 && l(i,j)==l(i-1,j))
            adj(i1,8*m-1+i)=l(i-1,j);
        end
        if (i+1<9 && l(i,j)==l(i+1,j))
            adj(i1, 8*m+1+i)= l(i+1,j);
        end
    end
    i1 = i1+1;
end
m = m+1;
end

            