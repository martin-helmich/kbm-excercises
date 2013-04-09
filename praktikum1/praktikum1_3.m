[X,Y] = meshgrid(-2:.1:6, -4:.2:4);
Z = (-.8*X.^3 + 5*X.^2 + 5*X + 5) .* exp(-.5*Y.^2);

mesh(X,Y,Z)
hold on

Z2 = -3.153959421 + 5.094857541.*X + 5.094857541.*Y;

mesh(X,Y,Z2)