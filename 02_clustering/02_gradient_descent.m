%% SIMPLE GRADIENT DESCENT
%%
%% Martin Helmich <martin.helmich@hs-osnabrueck.de>
%% University of Applied Sciences Osnabrück
%%
%% This work is licensed under the Creative Commons Attribution-ShareAlike 3.0
%% Unported License. To view a copy of this license, visit
%%
%%   http://creativecommons.org/licenses/by-sa/3.0/


%  Add helper functions for this excercise to path.
addpath('02_functions')


%  Define function
function[y,dy] = my_function(x)
	y  = (x + 2).^2 .* cos(3 * x);	
	dy = 2 * (x + 2) .* cos(3 * x) + (x + 2) .^ 2 .* -3 .* sin(3 * x);
end


% Plot function
x = -1:0.1:6;

hold on;
grid on;

plot(x, my_function(x), '-b');

fprintf('Hit any key to continue!\n');
pause();


% Find minima
[x_min, history] = find_minima(@my_function, 4);

fprintf('Found minimum at x=%f!\n', x_min);
plot(history(:,1), history(:,2), '-r');

pause();
