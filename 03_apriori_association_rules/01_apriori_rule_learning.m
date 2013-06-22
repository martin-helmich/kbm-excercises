%% APRIORI RULE LEARNING ALGORITHM
%%
%% Martin Helmich <martin.helmich@hs-osnabrueck.de>
%% University of Applied Sciences Osnabrück
%%
%% This work is licensed under the Creative Commons Attribution-ShareAlike 3.0
%% Unported License. To view a copy of this license, visit
%%
%%   http://creativecommons.org/licenses/by-sa/3.0/


%  Load input data.
transactions = dlmread('example_data/wbsa0206_20.dat');
addpath('00_functions');
 
%  Learn and print rules.
min_support    = 0.4;
min_confidence = 0.7;

frequent_sets = apriori_frequent_sets(
	transactions,
	min_support
);

rules = apriori_generate_rules(
	transactions,
	frequent_sets,
	min_confidence
);

apriori_print(rules);
