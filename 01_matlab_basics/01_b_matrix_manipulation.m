%% BASIC MATRIX OPERATIONS
%%
%% Martin Helmich <martin.helmich@hs-osnabrueck.de>
%% University of Applied Sciences Osnabrück
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


% Print first and last column of A
fprintf('First column of A: \n');
disp(A(:,1));

fprintf('\nLast column of A: \n');
disp(A(:,end));


% Sum of first and last column of A
fprintf('\nSum of first and last column of A: \n');
disp(A(:,1) + A(:,end));


% Matrix product of A without 2nd row and A without last column
AWithout2ndRow = A;
AWithout2ndRow(2,:) = [];

AWithoutLastColumn = A;
AWithoutLastColumn(:,end) = [];

fprintf('\nMatrix product of A without 2nd row and A without last column: \n')
disp(AWithout2ndRow * AWithoutLastColumn);


% Build the matrices resulting from replacing A's 3rd row with (1,2,3,4) and
% the 2nd column with (5,7,9,11)'.
AWithReplaced3rdRow = A;
AWithReplaced3rdRow(3,:) = [1 2 3 4];

fprintf('\nA with replaced 3rd row: \n');
disp(AWithReplaced3rdRow);

AWithReplaced2ndColumn = A;
AWithReplaced2ndColumn(:,2) = [5;7;9;11];

fprintf('\nA with replaced 2nd column: \n');
disp(AWithReplaced2ndColumn);
