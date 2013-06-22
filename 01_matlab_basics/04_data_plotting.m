%% BASIC DATA PLOTTING
%%
%% Martin Helmich <martin.helmich@hs-osnabrueck.de>
%% UAS Osnabrück
%%
%% This work is licensed under the Creative Commons Attribution-ShareAlike 3.0
%% Unported License. To view a copy of this license, visit
%%
%%   http://creativecommons.org/licenses/by-sa/3.0/


% Read input file.
S = dlmread('wbsa0210.dat');
fprintf('Eingabedatei enthält %d Zeilen.\n', length(S))

v1 = S(:,1);
v2 = S(:,2);

% Get minimum, maximum, mean and standard deviation.
fprintf('Max: %f   Min: %f   Mean: %f   Std: %f\n', min(v1), max(v1), mean(v1), std(v1));

% Draw histogram
hist(v1, 10);

% Draw scatterplot
plot(v1, v2, '+');

lengths = ((v1 .^ 2) + (v2 .^ 2)) .^ 0.5;
hist(lengths, 7)

%% Excercise E
%  Apply the "zscore" method to Z and plot the result.
%
%  Note: In GNU Octave, you need the "nan" package for the zscore() function.
%  Alternatively, you can use "studentize", which basically does the same.
Z = zscore(S);
plot(Z(:,1), Z(:,2), '.');
