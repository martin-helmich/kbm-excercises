%% HIERARCHICAL CLUSTERING ANALYSIS
%%
%% Martin Helmich <martin.helmich@hs-osnabrueck.de>
%% University of Applied Sciences Osnabrück
%%
%% This work is licensed under the Creative Commons Attribution-ShareAlike 3.0
%% Unported License. To view a copy of this license, visit
%%
%%   http://creativecommons.org/licenses/by-sa/3.0/


% When using GNU Octave, import statistics package and custom functions.
if OCTAVE_VERSION
	addpath('../00_functions');
	pkg load statistics
end;

% Read data from file.
S = dlmread('example_data/wbsa0350.dat');

% Normalize data
Sn = mapminmax(S);

A = pdist(Sn);
B = linkage(A);

% This is f*****, there is a typo in GNU Octave: In Matlab the function is 
% (correctly) called "dendrogram", in GNU Octave it is "dendogram" (mind the
% first "r"). 
if OCTAVE_VERSION ; dendogram(B);
else dendrogram(B); end

if ! OCTAVE_VERSION
	C = cluster(B, 'maxclust', 4);

	C1 = S(C == 1,:)
	C2 = S(C == 2,:)
	C3 = S(C == 3,:)
	C4 = S(C == 4,:)
else
	fprintf('Sorry, no cluster() function on GNU Octave!\n');
end

pause();
