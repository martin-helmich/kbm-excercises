%% PERIODIC REGRESSION
%%
%% Martin Helmich <martin.helmich@hs-osnabrueck.de>
%% University of Applied Sciences Osnabrück
%%
%% This work is licensed under the Creative Commons Attribution-ShareAlike 3.0
%% Unported License. To view a copy of this license, visit
%%
%%   http://creativecommons.org/licenses/by-sa/3.0/


%% Read input file.
fprintf('Reading input file.\n');

A = dlmread('example_data/wbsa0233.dat');
S = A(:,6);

fprintf('Read %d lines from input file.\n', size(A, 1));


%% Generate periodogram
xm = mean(S);
n  = length(S);
F  = 1/n:1/n:1000/n;
t  = (0:(n-1))';

p = zeros(1000,1);
i = 1;
for f = F
    p(i) = 1/n * sum((xm - S) .* cos(2 * pi .* f .* t))^2 ...
		+ 1/n * sum((xm - S) .* sin(2 * pi .* f .* t))^2; 
    i = i + 1;
end

figure;
hold on;

title('Periodogram');
plot(1/n:1/n:1000/n, p, '-');


%% Determine frequencies from periodogram
[periodogram_sorted, periodigram_indices] = sort(p, 1, 'descend');

max_frequencies = F(periodigram_indices(1:2));

plot(max_frequencies(1), 1, 'rx');
plot(max_frequencies(2), 1, 'rx');

fprintf('Found two frequencies: %f and %f \n', max_frequencies(1), max_frequencies(2));

pause();


%% Perform periodic regression
R = [ cos(2*pi * max_frequencies(1) .* t), ...
      sin(2*pi * max_frequencies(1) .* t), ...
      cos(2*pi * max_frequencies(2) .* t), ...
      sin(2*pi * max_frequencies(2) .* t) ];
a = (R' * R) \ R' * (S - xm);

fprintf(
	strcat(
		'Using model: f(x) = %f + %f * cos(2*pi * %f * x) + %f * sin(2*pi * %f * x) ',
		'+ %f * cos(2*pi * %f * x) + %f * sin(2*pi * %f * x) \n'
	),
	xm, a(1), max_frequencies(1), a(2), max_frequencies(1), a(3),
	max_frequencies(2), a(4), max_frequencies(2)
);

x = 1:n;
y = xm + a(1) * cos(2*pi * max_frequencies(1) .* x) + a(2) * sin(2*pi * max_frequencies(1) .* x) ...
	+ a(3) * cos(2*pi * max_frequencies(2) .* x) + a(4) * sin(2*pi * max_frequencies(2) .* x);

figure;
hold on;

title('Data and regression curve');
plot(x,S, '.')
plot(x,y, 'r-');

pause();


%% Analyze errors.
figure;
hold on;

e = S - y';

title('Error');
plot(x,e, 'g.');

pause();

fprintf('Error standard deviation: %f.\n', std(e));
fprintf('Mean error:               %f.\n', mean(e));

[m,i] = max(e);
fprintf('Maximal positive error: %02i.%02i.%i, %02i:%02i  Value: %-4i  f(x): %.2f  Error: %.2f\n', A(i,3), A(i,2), A(i,1), A(i,4), A(i,5), A(i,6), y(i), e(i));

[m,i] = min(e);
fprintf('Maximal negative error: %02i.%02i.%i, %02i:%02i  Value: %-4i  f(x): %.2f  Error: %.2f\n', A(i,3), A(i,2), A(i,1), A(i,4), A(i,5), A(i,6), y(i), e(i));
