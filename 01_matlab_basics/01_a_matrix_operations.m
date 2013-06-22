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

v = [ -6
      13
       7
      -2 ];


% Get determinant of A
fprintf('Determinant of A: %f \n', det(A));

% Get trace of A
fprintf('Trace of A: %f \n', trace(A));

% Get length of vector v
fprintf('Length of v: %f \n', norm(v));

% Get matrix product of A and v
w = A * v;
fprintf('\nMatrix product of A * v: \n');
disp(w);

% Matrix transposition; matrix product of A * A'
fprintf('\nProduct of A * A'': \n');
disp(A * A');

% Scalar product of v * w
fprintf('\nScalar product of v * w: %f \n', dot(v,w));

% 3rd power of A
fprintf('\nA^3: \n');
disp(A^3);

% Inverse of A
fprintf('\nInverse of A: \n')
disp(A^-1);

% Solve A * x = v to x
%
%       A * x = v            | A^(-1) * (...)
% <=>       x = A^(-1) * v
fprintf('\nSolution x of A * x = v: \n')
disp(A^-1 * v)
