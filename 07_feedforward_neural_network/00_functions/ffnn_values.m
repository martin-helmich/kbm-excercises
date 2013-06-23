function[output, layer_outputs, layer_inputs] = ffnn_values(
    net,
    input
)
    input = [input; ones(1, size(input, 2))];

    layer_outputs = [];
    layer_inputs  = [];

    layer_outputs(1).value = input;

    for i = 2:net.layer_count
        layer_inputs(i).value  = net.layers(i-1).weights * layer_outputs(i-1).value;
        layer_outputs(i).value = [net.layers(i-1).func(layer_inputs(i).value)
                                  ones(1, size(layer_inputs(i).value, 2))];
    end

    output        = layer_outputs(net.layer_count).value;
    output(end,:) = [];
end
