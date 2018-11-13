function[]=(bot_cent,n);
[y]=findcentroid(node);
dist=pdist([y(1),y(2),bot_cent(1),bot_cent(2)],'euclidean');


