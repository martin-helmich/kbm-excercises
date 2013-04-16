S = dlmread('wbsa0220.dat');

R = S;
R(:,end) = ones();

t = S(:,end);

%a = inv(R'*R) * R' * t;
a = (R'*R)\R' * t;
a

tm = mean(t);
r2 = norm(tm-(a(1)*S(:,1)+a(2)*S(:,2)+a(3)))^2 / norm(tm-t)^2;

r2

plot3(S(:,1), S(:,2), S(:,3), 'ks');
hold;

[x,y] = meshgrid(0:2:60,0:1:30);

mesh(x,y,a(1).*x + a(2).*y + a(3));