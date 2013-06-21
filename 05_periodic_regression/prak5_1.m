A = dlmread('wbsa0233.dat');
S = A(:,6);

xm = mean(S);
n = length(S);
F = 1/n:1/n:1000/n;
t = (0:(n-1))';

p = zeros(1000,1);
i = 1;
for f = F
    p(i) = 1/n * sum((xm - S) .* cos(2 * pi .* f .* t))^2 + 1/n * sum((xm - S) .* sin(2 * pi .* f .* t))^2; 
    i = i + 1;
end

figure;
hold on;
plot(1/n:1/n:1000/n, p, '-');

[ps,psi] = sort(p, 1, 'descend');

max_f = F(psi(1:2));
f1 = max_f(1);
f2 = max_f(2);

plot(f1,1,'rx');
plot(f2,1,'rx');

R = [cos(2*pi * f1 .* t) , sin(2*pi * f1 .* t) , cos(2*pi * f2 .* t) , sin(2*pi * f2 .* t) ];
a = (R'*R)\R' * (S - xm);
a

x = 1:n;
y = xm + a(1) * cos(2*pi * f1 .* x) + a(2) * sin(2*pi * f1 .* x) + a(3) * cos(2*pi * f2 .* x) + a(4) * sin(2*pi * f2 .* x);

figure;
hold on;
plot(x,S, '.')
plot(x,y, 'r-');

figure;
e = S - y';
plot(x,e, 'g.');

fprintf('Standardabweichung der Fehler: %f.\n', std(e));
fprintf('Mittelwert der Fehler: %f.\n', mean(e));

[m,i] = max(e);
fprintf('Maximale Abweichung nach oben: %02i.%02i.%i, %02i:%02i  Messwert: %-4i  Funktionswert: %.2f  Abweichung: %.2f\n', A(i,3), A(i,2), A(i,1), A(i,4), A(i,5), A(i,6), y(i), e(i));

[m,i] = min(e);
fprintf('Maximale Abweichung nach oben: %02i.%02i.%i, %02i:%02i  Messwert: %-4i  Funktionswert: %.2f  Abweichung: %.2f\n', A(i,3), A(i,2), A(i,1), A(i,4), A(i,5), A(i,6), y(i), e(i));