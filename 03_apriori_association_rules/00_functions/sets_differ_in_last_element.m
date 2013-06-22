%% APRIORI RULE LEARNING ALGORITHM
%%
%% Martin Helmich <martin.helmich@hs-osnabrueck.de>
%% University of Applied Sciences Osnabrück
%%
%% This work is licensed under the Creative Commons Attribution-ShareAlike 3.0
%% Unported License. To view a copy of this license, visit
%%
%%   http://creativecommons.org/licenses/by-sa/3.0/


function[a] = sets_differ_in_last_element(z1,z2)
	% Determine if two item sets of each n elements have the first n-1 elements
	% in common.

	k = sum(z1);

	if k == 0
		a = 1;
		return;
	end

	s = min(find(z1,1,'last'), find(z2,1,'last')) - 1;

	if sum(and(z1(1:s), z2(1:s))) == k-1
		a = 1;
	else
		a = 0;
	end
end
