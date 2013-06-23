%% LINEAR REGRESSION (WITH LINEAR MODEL)
%%
%% Martin Helmich <martin.helmich@hs-osnabrueck.de>
%% University of Applied Sciences Osnabrück
%%
%% This work is licensed under the Creative Commons Attribution-ShareAlike 3.0
%% Unported License. To view a copy of this license, visit
%%
%%   http://creativecommons.org/licenses/by-sa/3.0/



% Load input file
inputData = dlmread('example_data/wbsa0220.dat');
fprintf('Read %d lines from input file.\n', size(inputData, 1));


% Perform linear regression
R        = inputData;
R(:,end) = ones();
t        = inputData(:,end);

a = (R'*R)\R' * t;

fprintf('Coefficients ');
disp(a');

fprintf('Using model: f(x,y) = %f * x + %f * y + %f \n', a(1), a(2), a(3));


% Coefficient of determination
tm = mean(t);
determination = norm(tm-(a(1)*inputData(:,1)+a(2)*inputData(:,2)+a(3)))^2 / norm(tm-t)^2;

fprintf('r^2 = %f \n', determination);


% Plot input data.
hold on;
plot3(inputData(:,1), inputData(:,2), inputData(:,3), 'ks');


% Plot regression plane.
[x, y] = meshgrid(0:2:60, 0:1:30);

mesh(x, y, a(1) .* x + a(2) .* y + a(3));
pause();
