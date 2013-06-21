%% BASIC MATRIX OPERATIONS
%%
%% Martin Helmich <martin.helmich@hs-osnabrueck.de>
%% UAS Osnabrück
%%
%% This work is licensed under the Creative Commons Attribution-ShareAlike 3.0
%% Unported License. To view a copy of this license, visit
%%
%%   http://creativecommons.org/licenses/by-sa/3.0/


% Clear screen
clc


% Define matrix A and vector v
A = [ 1 -1  1  1
      2  1 -3  2
     -1  3  2 -1
     -1  0  3  3 ];


% Print indices of elements of A < 0
[i,j] = find(A < 0);
fprintf('Row and column indices of elements < 0 in A: \n');

disp([i j]);


% Print values of A < 0
fprintf('\nValues of A < 0: \n');
disp(A(A < 0));
