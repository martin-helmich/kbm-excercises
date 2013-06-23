function[net] = ffnn_init(
    neuron_counts,
    default_activation_function = @tansig
)
    net.layer_count = size(neuron_counts, 2);
    net.layers      = [];

    for i = 1:(net.layer_count-1)
        layer.weights = rand(neuron_counts(i+1), neuron_counts(i) + 1);
        layer.func    = default_activation_function;

        net.layers = [net.layers ; layer];
    end
end
