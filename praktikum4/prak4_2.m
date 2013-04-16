S = dlmread('wbsa0230c.dat');

plot3(S(:,1),S(:,2),S(:,3),'ks');
hold;

t = S(:,3);
R = [S(:,1).^2 S(:,1).*S(:,2) S(:,2).^2 S(:,1) S(:,2) ones(size(S,1),1)];

a = (R'*R)\R' * t;
a

[x,y] = meshgrid(-20:.5:20,-20:.5:20);

mesh(x,y,a(1).*x.^2 + a(2).*x.*y + a(3).*y.^2 + a(4).*x + a(5).*y + a(6));