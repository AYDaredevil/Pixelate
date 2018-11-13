function[theta dist]=get_theta_dist(centb,centf,bot_cent,node)
node_centroid=zeros(1,2);
t=node;
a=floor(t/8);
b=mod(t,8);
if(b==0)
    b=8
end
node_centroid(1,1)=a*30;
node_centroid(1,2)=b*30;
bot_vector1=centf-centb;
bot_vector2=node_centroid-bot_cent;
x1=bot_vector1(1,1);
y1=bot_vector1(1,2);
a=complex(x1,y1);
x2=bot_vector2(1,1);
y2=bot_vector2(1,2);
b=complex(x2,y2);
theta=angle(b/a);
theta=(theta*180)/pi;
dist=pdist[x1 y1 x2 y2];
end

  
