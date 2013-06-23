S = dlmread('example_data/wbsa0231.dat');
A = S;

%% Polynomische Regression

figure
hold on;
title('Unemployment raw data');

plot(S(:,1), S(:,2), 'b-');

pause();

R = [S(:,1).^3 S(:,1).^2 S(:,1) ones(size(S,1),1)];
fprintf('Foobar');

a = (R'*R)\R' * S(:,2);
a

x = min(S(:,1)):max(S(:,1));
x1 = x;

y = a(1) .* x .^3 + a(2) .* x .^ 2 + a(3) .* x + a(4);
y1 = y;

plot(S(:,1), y, 'r-');

Sp = S;
Sp(:,2) = Sp(:,2) - y';
Sp(:,2) = Sp(:,2) - Sp(1,2);

plot(x, Sp(:,2), 'g-');
pause();


%% Periodische Regression

n = size(S, 1);
F = 1/n:1/n:1/2;
t = (0:(n-1))';
p = [];
S = Sp(:,2);
xm = mean(S);

i = 1;
for f = F
    p(i) = 1/n * sum((xm - S) .* cos(2 * pi .* f .* t))^2 + 1/n * sum((xm - S) .* sin(2 * pi .* f .* t))^2; 
    i = i + 1;
end

figure;
hold on;
plot(F, p, '-');

[ps,psi] = sort(p, 2, 'descend');

mf = F(psi(1:7));
plot(mf,1,'rx');

R = [];
for f = mf
   R = [R, cos(2*pi * f .* t), sin(2*pi * f .* t)];
end

a = (R'*R)\R' * (S - xm);
a

t = 1:size(mf,1);
x = 1:n;

y = xm; i = 0;
for f = mf
   y = y + a(2*i+1) * cos(2*pi * f .* x) + a(2*i+2) * sin(2*pi * f .* x);
   i = i + 1;
end

figure;
hold on;
plot(x,S, 'b--');
plot(x,y, 'r-');

%% Endausgabe

figure;

hold on;
plot(A(:,1), A(:,2), 'b-');
plot(x1, y1 + y, 'r-');

pause();
