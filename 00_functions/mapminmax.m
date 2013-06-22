function[A] = mapminmax(A, mn=-1, mx=1)
	[rows, cols] = size(A);

	for i = 1:cols
		min_i = min(A(:,i));
		max_i = max(A(:,i));

		A(:,i) = 2 * (A(:,i) - min_i) / (max_i - min_i) - 1;
	end
end
