%% IMPROVED POLYVAL
%%
%% Martin Helmich <martin.helmich@hs-osnabrueck.de>
%% University of Applied Sciences Osnabrück
%%
%% This work is licensed under the Creative Commons Attribution-ShareAlike 3.0
%% Unported License. To view a copy of this license, visit
%%
%%   http://creativecommons.org/licenses/by-sa/3.0/



% Create an improved version of the polyval() method that returns both
% the polynom's value and the valud of the first derivative.
%
% TRY NOT TO USE LOOPS.

function[y0, y1] = polyval2(p, x)
	% Improved polyval() function. Accepts the polynom's coefficients
	% and x as parameters and returns p(x) and p'(x).

	p1 = fliplr(0:length(p)-1) .* p;
	p1(:,end) = [];

	y0 = polyval(p,  x);
	y1 = polyval(p1, x);
end


p = [1 -1 -13 13 36 -36];

fprintf('Using the following polynom: ');
disp(p);

while true
	x = input('Please enter x: ');

	[y, y1] = polyval2(p, x);

	fprintf('p(%f)  = %f\n', x, y);
	fprintf('p''(%f) = %f\n', x, y1);
end
