clc

A = [ 1 -1  1  1
      2  1 -3  2
     -1  3  2 -1
     -1  0  3  3]
v = [-6;13;7;-2]

fprintf('Determinante: ')
det(A)

fprintf('Spur: ')
trace(A)

fprintf('Länge von v: ')
norm(v)

w = A * v

fprintf('Produkt von A mit A''')
A * A'

fprintf('Skalarprodukt von v und w')
dot(v,w)

fprintf('A^3')
A^3

fprintf('Inverse')
A^-1

fprintf('Lösung von A*x=v')
A^-1 * v



A(:,1)
A(:,end)

fprintf('Summe von erstem und letzten Spaltenvektor')
A(:,1) + A(:,end)

A1 = A;
A2 = A;

fprintf('A ohne zweite Zeile und ohne letzte Spalte')
A1(2,:) = []
A2(:,end) = []

A1 * A2

A3 = A;
A4 = A;

fprintf('A mit ersetzter dritter Zeile und zweiter Spalte')
A3(3,:) = [1 2 3 4]
A4(:,2) = [5;7;9;11]

fprintf('A mit zwei neuen Spalten')
A5 = A;
A5(:,end+1) = ones(4,1);
A5(:,end+1) = ones(4,1) * 2

[i,j] = find(A<0)
A(A<0)



x = -4:.1:4;
plot(x,sin(x),'g', x,cos(x),'r', x, sin(x)+cos(x), 'b')
grid on
saveas(gcf, 'sincos.jpg', 'jpg')