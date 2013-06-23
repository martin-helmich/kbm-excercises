%% LINEAR REGRESSION (WITH POLYNOMIAL MODEL)
%%
%% Martin Helmich <martin.helmich@hs-osnabrueck.de>
%% University of Applied Sciences Osnabrück
%%
%% This work is licensed under the Creative Commons Attribution-ShareAlike 3.0
%% Unported License. To view a copy of this license, visit
%%
%%   http://creativecommons.org/licenses/by-sa/3.0/


%  Read input data.
inputData = dlmread('example_data/wbsa0230c.dat');
fprintf('Read %d lines from input file.\n', size(inputData, 1));


%  Plot input data.
hold on;
plot3(inputData(:,1),inputData(:,2),inputData(:,3),'ks');


%  Perform linear regression.
t =  inputData(:,3);
R = [inputData(:,1).^2 inputData(:,1).*inputData(:,2) inputData(:,2).^2 inputData(:,1) inputData(:,2) ones(size(inputData,1),1)];

a = (R'*R)\R' * t;

fprintf('Coefficients ');
disp(a');

fprintf('Using model: f(x,y) = %f * x^2 + %f * xy + %f * y^2 + %f * x + %f * y + %f \n', a(1), a(2), a(3), a(4), a(5), a(6));


%  Plot regression function
[x,y] = meshgrid(-20:.5:20,-20:.5:20);

mesh(x,y,a(1).*x.^2 + a(2).*x.*y + a(3).*y.^2 + a(4).*x + a(5).*y + a(6));
pause();
