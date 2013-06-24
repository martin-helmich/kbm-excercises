%% FEEDFORWARD NEURAL NETWORK (ONE HIDDEN LAYER)
%%
%% Martin Helmich <martin.helmich@hs-osnabrueck.de>
%% University of Applied Sciences Osnabrück
%%
%% This work is licensed under the Creative Commons Attribution-ShareAlike 3.0
%% Unported License. To view a copy of this license, visit
%%
%%   http://creativecommons.org/licenses/by-sa/3.0/


addpath('00_functions');

%  When using GNU Octave, the "nnet" package is required.
%  When using Matlab, the "Neural Network Toolbox" is required.
if OCTAVE_VERSION
    pkg load nnet;
end

E = [0 1 0 0 1 1 0 1 
     0 0 1 0 1 0 1 1 
     0 0 0 1 0 1 1 1];
A = [0 1 1 1 0 0 0 1];

ffnn_create_train_test(
    E,
    A,
    [3 2 1]
);

pause();
