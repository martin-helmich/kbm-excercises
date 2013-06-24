%% FEEDFORWARD NEURAL NETWORK (TWO HIDDEN LAYERS)
%%
%% Martin Helmich <martin.helmich@hs-osnabrueck.de>
%% University of Applied Sciences Osnabrück
%%
%% This work is licensed under the Creative Commons Attribution-ShareAlike 3.0
%% Unported License. To view a copy of this license, visit
%%
%%   http://creativecommons.org/licenses/by-sa/3.0/


addpath('00_functions');

n  = 100;  % Amount of learning data sets.
Mx = 10;   % Distribution of randomly generated learding data.

% Generate input data randomly: "n" Values distributed randomly over
% [-5:5]x[-5:5].
E  = Mx * rand([2,n]) - Mx/2 * ones(2,n);

k1 = E(1,:) >= 0;  % TRUE for each element in n with x >= 0
k2 = E(2,:) >= 0;  % TRUE for each element in n with y >= 0

A = [ k1 &  k2   % Quadrant 1
     ~k1 &  k2   % ...
     ~k1 & ~k2   % ...
      k1 & ~k2]; % to quadrant 4

% Plot training data.
hold on;
plot(E(1,A(1,:)),E(2,A(1,:)),'ok');
plot(E(1,A(2,:)),E(2,A(2,:)),'*k');
plot(E(1,A(3,:)),E(2,A(3,:)),'sk');
plot(E(1,A(4,:)),E(2,A(4,:)),'pk');

% Create and train neural network.
[net]         = ffnn_init([2 6 9 4]);
[net, errors] = ffnn_train(
    net, E, A, :, 1.1
);

while true
    fprintf('Click anywhere!\n');
    [ix, iy] = ginput(1);
    
    r = round(ffnn_values(net, [ix; iy]));

    fprintf('\nYou clicked in quadrant: \n');
    disp(r);
end
