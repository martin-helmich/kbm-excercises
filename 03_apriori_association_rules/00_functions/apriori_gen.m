%% APRIORI RULE LEARNING ALGORITHM
%%
%% Martin Helmich <martin.helmich@hs-osnabrueck.de>
%% University of Applied Sciences Osnabrück
%%
%% This work is licensed under the Creative Commons Attribution-ShareAlike 3.0
%% Unported License. To view a copy of this license, visit
%%
%%   http://creativecommons.org/licenses/by-sa/3.0/


function[candidates] = apriori_gen(frequent_elements)
	% Generates a set of n-element candidated from an input set of n-1-element
	% frequent elements.
	%
	% Example:
    %
	%   apriori_gen([1 1 0;0 1 1])
    %     ans = [1 1 1]

	candidates = [];
	rows = size(frequent_elements,1);

	for z1 = 1:rows
	    for z2 = (z1+1):rows
	        if z1 ~= z2 && sets_differ_in_last_element(frequent_elements(z1,:), frequent_elements(z2,:))
	            candidates = [candidates ; frequent_elements(z1,:) | frequent_elements(z2,:)];
	        end
	    end
	end

end

