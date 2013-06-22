function[x1, history] = find_minima(func, x0)

	[y0,dy0] = func(x0); % Initial value and derivate value.

	history = [x0 y0];   % History array.
	i       = 0;         % Loop counter.

	sigm = min(1, 1/abs(dy0))

	while i < 100
		x1     = x0 - sigm * dy0;
		[y,dy] = func(x1);

		history = [history ; x1 y];   
  
		% Abort the algorithm as soon as f(x) does not decrease
		% significantly anymore.
		if abs(y0 - y) < 0.001
			break
		end
   
		% If f(x) did decrease in this iteration, increase the adaption
		% rate, otherwise decrease.
		if y < y0 ; sigm = 1.01 * sigm;
		else      ; sigm = 0.5 * sigm; end
   
		y0  = y;
		dy0 = dy;
		x0  = x1;
		i   = i + 1;
	end
end

