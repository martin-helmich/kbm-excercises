%% APRIORI RULE LEARNING ALGORITHM
%%
%% Martin Helmich <martin.helmich@hs-osnabrueck.de>
%% University of Applied Sciences Osnabrück
%%
%% This work is licensed under the Creative Commons Attribution-ShareAlike 3.0
%% Unported License. To view a copy of this license, visit
%%
%%   http://creativecommons.org/licenses/by-sa/3.0/


function[frequent_sets] = apriori_frequent_sets(transactions, support_min)
	% Finds frequent item sets from a set of transactions.

	[transaction_count, item_count] = size(transactions);
	 trans_count_min                = transaction_count * support_min;

	frequent_sets      = [];  % Frequent item sets.
	frequent_sets_last = [];  % Frequent item sets with 1 element.

	% Initialize the list of frequent item sets with all frequent transactions
	% with ONE element.
	for j = 1:item_count
		itemset      = zeros(1,item_count);
		itemset(1,j) = 1;
    
		if count_transactions_with_subset(transactions, itemset) >= trans_count_min
			frequent_sets_last(end+1,:) = itemset;
		end
	end

	% Recombinate all frequent sets of n-1 elements to sets of n elements and
	% add them to the list of frequent item sets when the new sets are also
	% frequent.
	k = 2;
	while size(frequent_sets_last) > 0
		candidates            = apriori_gen(frequent_sets_last);
		frequent_sets_current = [];

		rows = size(candidates, 1);

		for j = 1:rows
			if count_transactions_with_subset(transactions, candidates(j,:)) >= trans_count_min
				frequent_sets_current = [frequent_sets_current ; candidates(j,:)];
			end
		end
   
		frequent_sets      = [frequent_sets ; frequent_sets_current];
		frequent_sets_last =  frequent_sets_current;

		k = k + 1;
	end

	disp('Frequent item sets:');
	disp(frequent_sets);
	disp('');

end

