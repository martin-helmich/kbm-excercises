
addpath('00_functions');

%  When using GNU Octave, the "nnet" package is required.
%  When using Matlab, the "Neural Network Toolbox" is required.
if OCTAVE_VERSION
    pkg load nnet;
end

neuron_counts = [2 2 1];

%l1.func    = @tansig;
%l1.weights = rand(neuron_counts(2), neuron_counts(1) + 1);

%l2.func    = @tansig;
%l2.weights = rand(neuron_counts(3), neuron_counts(2) + 1);

%[l1 l2]

net = ffnn_init(neuron_counts);

E = [0 1 0 1 
     0 0 1 1];
A = [0 1 1 0];

net = ffnn_train(net, E, A);
%[W1,W2] = train(W1,W2,E,A);

D = ffnn_values(net, E);

fprintf('Trained data: \n');
disp(A);

fprintf('Learned results (raw): \n');
disp(D);

fprintf('Learned results (rounded): \n');
disp(round(D));

if (round(D) == A)
    fprintf('More or less OK\n');
else
    fprintf('Not OK\n');
end
