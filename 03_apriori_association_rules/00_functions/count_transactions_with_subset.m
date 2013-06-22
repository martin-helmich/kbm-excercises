function[count] = count_transactions_with_subset(transactions, subset)
	count = sum((transactions * subset') == sum(subset));
end
