clear
S = dlmread('wbsa0350.dat');

[Sn,min,max] = premnmx(S);

A = pdist(Sn);
B = linkage(A);

dendrogram(B)

C = cluster(B, 'maxclust', 4);

C1 = S(C == 1,:)
C2 = S(C == 2,:)
C3 = S(C == 3,:)
C4 = S(C == 4,:)

D = kmeans(Sn, 4);

C1 = S(D == 1,:)
C2 = S(D == 2,:)
C3 = S(D == 3,:)
C4 = S(D == 4,:)

[Z,U,J] = fcm(Sn, 4);

fprintf('Pflanzen, die zu >1/3 je zwei Clustern zuzuordnen sind:\n')
S(sum(U > 0.33) >= 2,:)

fprintf('Planzen, die keinem Cluster zu >1/3 zuzuordnen sind:\n')
S(sum(U > 0.33) == 0,:)