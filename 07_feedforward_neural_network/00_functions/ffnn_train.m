function[net] = ffnn_train(
    net,
    training_inputs,
    training_outputs
)

columns = size(training_outputs, 2);
sigma   = 0.075;
sse0    = 1000;
sse     = 0;

for j = 1:10000
    sse = 0;
    %g1 = zeros(size(W1));
    %g2 = zeros(size(W2));

    gradient_layers = [];
    for i = 1:(net.layer_count - 1)
        gradient_layers(i).weights = zeros(size(net.layers(i).weights));
    end

    for i = 1:columns
        training_input  = training_inputs(:,i);
        training_output = training_outputs(:,i);
       %e = E(:,i);
       %a = A(:,i);

       %[d, e1, e2, d1] = values(W1, W2, e);
        [learned_output, layer_outputs, layer_inputs] = ffnn_values(net, training_input);
       %sse = sse + (d - a)^2;
       %sse = sse + sum((d - a).^2);
        sse = sse + sum((learned_output - training_output) .^ 2);

        deltas = [];
        deltas(net.layer_count - 1).v = 2 * jacobi(layer_inputs(net.layer_count).value) \
            * (learned_output - training_output);
        for n = (net.layer_count - 2):-1:1
            deltas(n).v = jacobi(layer_inputs(n+1).value) * net.layers(n+1).weights(:,1:end-1)' * deltas(n+1).v;
        end

        %gradients(1).v = deltas(1).v * [training_input; 1]';
        for n = 1:(net.layer_count - 1)
            gradients(n).v = deltas(n).v * layer_outputs(n).value';
            gradient_layers(n).weights = gradient_layers(n).weights + gradients(n).v;
        end

       %delta2 = 2 * jacobi(e2) * (d - a);
       %delta1 =     jacobi(e1) * W2(:,1:end-1)' * delta2;

       %gradient1 = delta1 * [e;1]';
       %gradient2 = delta2 * d1';

       %g1 = g1 + gradient1;
       %g2 = g2 + gradient2;
    end

    %disp(g1);
    %disp(g2);

    %W1 = W1 - sigma * g1;
    %W2 = W2 - sigma * g2;

    for n = 1:(net.layer_count - 1)
        net.layers(n).weights = net.layers(n).weights - sigma * gradient_layers(n).weights;
    end
    
    if (sse > sse0)
        sigma = sigma * 0.5;
    else
        sigma = sigma * 1.01;
    end
    
    sse0 = sse;

    fprintf('Gesamt-Fehler nach %i Iterationen: %f \n', j, sse);
    
    if sse < 0.001
        fprintf('Reicht jetzt.\n');
        return
    end
end

end

