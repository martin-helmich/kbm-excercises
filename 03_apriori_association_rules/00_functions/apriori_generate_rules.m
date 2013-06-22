%% APRIORI RULE LEARNING ALGORITHM
%%
%% Martin Helmich <martin.helmich@hs-osnabrueck.de>
%% University of Applied Sciences Osnabrück
%%
%% This work is licensed under the Creative Commons Attribution-ShareAlike 3.0
%% Unported License. To view a copy of this license, visit
%%
%%   http://creativecommons.org/licenses/by-sa/3.0/


function[rules] = apriori_generate_rules(transactions, frequent_sets, confidence_min)
	% Generates association rules from an input list of frequent item sets.

	rules = [];

	% Iterate over all frequent item sets. Generate association rules for each frequent
	% item set.
	for frequent_set = frequent_sets'
		frequent_set = frequent_set'; % Transpose for easier handling.

		min_transaction_count = count_transactions_with_subset(
			transactions,
			frequent_set
		);

		then_components      = [];
		then_components_last = [];

		cols = size(frequent_set,2);

		for j = 1:cols
			if frequent_set(1,j) == 0
				continue
			end

			when_component      = frequent_set;
			when_component(1,j) = 0;

			then_component = frequent_set & ~when_component;

			if min_transaction_count >= confidence_min * count_transactions_with_subset(transactions, when_component)
				then_components_last = [then_components_last ; then_component];
			end
		end % for cols

		then_components = then_components_last;
		l = 2;

		while size(then_components_last) > 0
			candidates              = apriori_gen(then_components_last);
			then_components_current = [];

			[rows,cols] = size(candidates);

			for j=1:rows
				then_component = candidates(j,:);
				when_component = xor(frequent_set, then_component);

				if min_transaction_count >= confidence_min * count_transactions_with_subset(transactions, when_component)
					then_components_current = [then_components_current; then_component];
				end
			end

			l = l + 1;

			then_components      = [then_components; then_components_current];
			then_components_last =  then_components_current;
		end % while 

		rules_count   = size(then_components, 1);
		rules_for_set = repmat(frequent_set, rules_count, 1);

		if isempty(rules_for_set) == 0
			rules = [rules; rules_for_set + then_components];
		end
	end % for frequent sets

end

