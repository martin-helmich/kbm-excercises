%% APRIORI RULE LEARNING ALGORITHM
%%
%% Martin Helmich <martin.helmich@hs-osnabrueck.de>
%% University of Applied Sciences Osnabrück
%%
%% This work is licensed under the Creative Commons Attribution-ShareAlike 3.0
%% Unported License. To view a copy of this license, visit
%%
%%   http://creativecommons.org/licenses/by-sa/3.0/


function[] = apriori_print(rules)
	% Prints a set of association rules.

	[rows,cols] = size(rules);

	fprintf('%d rules found:\n\n', rows);

	for i=1:rows

	    fprintf('    ');

	    for j=1:cols
	        if rules(i,j) == 1, fprintf('%d ', j), end
	    end

	    fprintf('=> ');

	    for j=1:cols
	        if rules(i,j) == 2, fprintf('%d ', j), end
	    end

	    fprintf('\n')
	end

end

