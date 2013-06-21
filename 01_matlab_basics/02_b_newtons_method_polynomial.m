%% NEWTON'S METHOD
%%
%% Martin Helmich <martin.helmich@hs-osnabrueck.de>
%% University of Applied Sciences Osnabrück
%%
%% This work is licensed under the Creative Commons Attribution-ShareAlike 3.0
%% Unported License. To view a copy of this license, visit
%%
%%   http://creativecommons.org/licenses/by-sa/3.0/


% Given the following polynom:
%   p(x) = x^5 - x^4 - 13 * x^3 + 13 * x^2 + 36 * x + a
%
% Construct a matlab function that implements Newton's method and accepts
% the initial x0 and a as parameters.


function[n,success,i] = newton_polynomial(x0, a)
	% Newton's method for the polynomial function p(x) (see above).
	% This method returns three values:
	%
	%   * the function's root if found, otherwise 0
	%   * TRUE on success, otherwise FALSE
	%   * the amount of loop iterationd


	p  = [1 -1 -13 13 36 a];   % The polynom coefficients in row vector notation.
	p1 = [5 -4 -39 26 36];     % The coefficients of p(x)'s first derivative.

	n       = 0;               % The result.
	i       = 1;               % The loop counter.
	success = false;           % TRUE on success.

	while i < 100
		x1 = x0 - polyval(p,x0) / polyval(p1,x0);

		% Abort as soon as x_n does not change significantly anymore.
		% (as soon as |x_n - x_(n-1)| < 10^-10).
		if abs(x1 - x0) < 1e-10
			n       = x1;
			success = true;

			break;
		end
   
		i = i + 1;
		x0 = x1;
	end
end

x0 = input('Please enter x0: ');
a  = input('Please enter a: ');

fprintf('Applying newton''s method on p(x) with a=%f beginning at x0=%f.\n', a, x0);

[root, success, iterations] = newton_polynomial(x0, a);

if success
	fprintf('Found root with sufficient accuracy at %f within %i iterations.', root, iterations);
else
	fprintf('Could not find root with sufficient accuracy within %i iterations.', root, iterations);
end



