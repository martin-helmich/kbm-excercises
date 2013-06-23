%% ADAPTIVE GRADIENT DESCENT
%%
%% Martin Helmich <martin.helmich@hs-osnabrueck.de>
%% University of Applied Sciences Osnabrück
%%
%% This work is licensed under the Creative Commons Attribution-ShareAlike 3.0
%% Unported License. To view a copy of this license, visit
%%
%%   http://creativecommons.org/licenses/by-sa/3.0/


addpath('00_functions');

%% Function definition
%  Define the function f(x1, x2) that will be used in this example.
function[y, yg] = f(x1, x2)
    %  The function f(x1,x2) implements the function
    %      y = ((x1+1)^2 + (x2+1)^2)^2 * ((x1-2)^2) + (x2-1)^2) + x1 + x2
    %  It returns both the function value of the input argument (x must be a
    %  vector of two elements) and the gradient.

    y  = ((x1 + 1).^2 + (x2 + 1).^2) .* \
         ((x1-2).^2 + (x2-1).^2) + x1 + x2;

    yg = [4 .* x1 .^ 3 - 6 .* x1 .^ 2 + x1 .* (4 .* x2 .^ 2 - 2) \
              - 2 .* x2 .^ 2 - 12 .* x2 + 3
          4 .* x1 .^ 2 .* x2 - 4 .* x1 .* (x2 + 3) + 4 .* x2 .^ 3 \
              + 6 .* x2 + 7];
end


%% Plot function f(x1, x2)
%  Plot the function f(x1, x2) using a contour plot.
[x1, x2] = meshgrid(-2:0.2:3, -2:0.2:3);

hold on;
contour(x1, x2, f(x1, x2), 40);


%% Perform gradient descent
%  Prompt for user input and perform gradient descent from a user-provided
%  startint point.
while 1
    fprintf('Click anywhere into the figure!\n');
    [x1 x2] = ginput(1);

    [minimum, history] = find_minimum(@f, [x1 x2]);

    fprintf('Found minimum at (%f, %f) -> %f.\n', minimum(1), minimum(2), minimum(3));
    plot(history(:,1), history(:,2), '-r');
end
