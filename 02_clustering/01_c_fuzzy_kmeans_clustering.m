%% K-MEANS CLUSTERING ANALYSIS (FUZZY VERSION)
%%
%% Martin Helmich <martin.helmich@hs-osnabrueck.de>
%% University of Applied Sciences Osnabrück
%%
%% This work is licensed under the Creative Commons Attribution-ShareAlike 3.0
%% Unported License. To view a copy of this license, visit
%%
%%   http://creativecommons.org/licenses/by-sa/3.0/


% When using GNU Octave, import statistics and fuzzy logic package.
if OCTAVE_VERSION
	addpath('../00_functions');
	pkg load statistics;
	pkg load fuzzy-logic-toolkit;
end;

% Read data from file.
inputData = dlmread('example_data/wbsa0350.dat');

% Normalize data
normalizedInputData = mapminmax(inputData);


% Apply fuzzy k-means clustering
% NOTE: In GNU Octave, this requires the "fuzzy-logic-toolkit" package.
%       In Matlab, this requires the "Fuzzy Logic Toolbox".
[clusterCenters, softPartition, history] = fcm(normalizedInputData, 4);


fprintf('Items belonging to two clusters by at least 1/3: \n');
disp(inputData(sum(softPartition > 0.33) >= 2,:));

fprintf('\nItems NOT belonging to any cluster by more than 1/3: \n');
disp(inputData(sum(softPartition > 0.33) == 0,:));
