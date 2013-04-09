S = dlmread('wbsa0210.dat');

fprintf('Eingabedatei enthält %d Zeilen.\n', length(S))

v1 = S(:,1);
v2 = S(:,2);

fprintf('Max: %f   Min: %f   Mean: %f   Std: %f\n', min(v1), max(v1), mean(v1), std(v1));

hist(v1, 10);
H = hist(v1, 10)

plot(v1, v2, '+');

lengths = ((v1 .^ 2) + (v2 .^ 2)) .^ 0.5;
hist(lengths, 7)

Z = zscore(S);
plot(Z(:,1), Z(:,2), '.');
