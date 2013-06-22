%% K-MEANS CLUSTERING ANALYSIS
%%
%% Martin Helmich <martin.helmich@hs-osnabrueck.de>
%% University of Applied Sciences Osnabrück
%%
%% This work is licensed under the Creative Commons Attribution-ShareAlike 3.0
%% Unported License. To view a copy of this license, visit
%%
%%   http://creativecommons.org/licenses/by-sa/3.0/


% When using GNU Octave, import statistics package.
if OCTAVE_VERSION
	addpath('../00_functions');
	pkg load statistics
end;

% Read data from file.
S = dlmread('example_data/wbsa0350.dat');

% Normalize data
Sn = mapminmax(S);

D = kmeans(Sn, 4);

for n = 1:4
	fprintf('Items in cluster %d: \n', n);
	disp(S(D == n,:));
	fprintf('\n');
end

[Z,U,J] = fcm(Sn, 4);

fprintf('Pflanzen, die zu >1/3 je zwei Clustern zuzuordnen sind:\n')
S(sum(U > 0.33) >= 2,:)

fprintf('Planzen, die keinem Cluster zu >1/3 zuzuordnen sind:\n')
S(sum(U > 0.33) == 0,:)
