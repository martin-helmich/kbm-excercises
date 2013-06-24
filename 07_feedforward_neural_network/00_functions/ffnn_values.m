%% FEEDFORWARD NEURAL NETWORK (EVALUATION FUNCTION)
%%
%% Martin Helmich <martin.helmich@hs-osnabrueck.de>
%% University of Applied Sciences Osnabrück
%%
%% This work is licensed under the Creative Commons Attribution-ShareAlike 3.0
%% Unported License. To view a copy of this license, visit
%%
%%   http://creativecommons.org/licenses/by-sa/3.0/


function[output, layer_outputs, layer_inputs] = ffnn_values(
    net,
    input
)
    input = [input; ones(1, size(input, 2))];

    layer_outputs = [];
    layer_inputs  = [];

    layer_outputs(1).v = input;

    for i = 2:net.layer_count
        layer_inputs(i).v  =  net.layers(i-1).weights * layer_outputs(i-1).v;
        layer_outputs(i).v = [net.layers(i-1).func(layer_inputs(i).v)
                              ones(1, size(layer_inputs(i).v, 2))];
    end

    output        = layer_outputs(net.layer_count).v;
    output(end,:) = [];
end
