%% FEEDFORWARD NEURAL NETWORK (TRAINING FUNCTION)
%%
%% Martin Helmich <martin.helmich@hs-osnabrueck.de>
%% University of Applied Sciences Osnabrück
%%
%% This work is licensed under the Creative Commons Attribution-ShareAlike 3.0
%% Unported License. To view a copy of this license, visit
%%
%%   http://creativecommons.org/licenses/by-sa/3.0/



function[net, sse_hist] = ffnn_train(
    net,                    % The network to be trained.
    training_inputs,        % Training data (inputs).
    training_outputs,       % Training data (expected outputs).
    max_iterations = 10000, % Maximum iteration count.
    adapt_success  = 1.01,  % Adaptation factor for successful iterations.
    adapt_failure  = 0.05,  % Adaptation factor for unsuccessful iterations.
    initial_rate   = 0.075, % Initial learning rate.
    training_goal  = 0.01   % Abort as soon as the error decreases by less than
                            % this value.
)

    columns  = size(training_outputs, 2);  % Number of training data sets.
    sigma    = initial_rate;               % Initial learning rate.
    sse_last = inf;                        % Sum of squared errors.
    sse      = 0;                          % Sum of squared errors.
    sse_hist = [];                         % Error history (useful for plotting).

    training_goal_total = training_goal * columns;  % Optimiziation; this saves
                                                    % us a lot of costly
                                                    % divisions.

    for j = 1:max_iterations
        sse = 0;

        gradient_layers = init_gradient_layers(net);
        gradient_layers = compute_gradient_layers(
            net,
            gradient_layers,
            training_inputs,
            training_outputs
        );

        % Adjust network weights by error gradient and learning rate.
        for n = 1:(net.layer_count - 1)
            net.layers(n).weights = \
                net.layers(n).weights - sigma * gradient_layers(n).weights;
        end

        % Determine error of new weights.
        new_learned_output = ffnn_values(net, training_inputs);
        sse = sum(sum((new_learned_output - training_outputs) .^ 2));
    
        % Increase learning rate when error was reduced, otherwise reset the
        % weights and reduce learning rate.
        if (sse > sse_last)
            sigma = sigma * adapt_failure;

            for n = 1:(net.layer_count - 1)
                net.layers(n).weights = \
                    net.layers(n).weights + sigma * gradient_layers(n).weights;
            end
        else
            sigma = sigma * adapt_success;
        end

        sse_last =  sse;
        sse_hist = [sse_hist; j sse];

        if mod(j, 10) == 0
            fprintf(
                'Mean error after %d / %d iterations: %f: \n',
                j, max_iterations, sse / columns
            );
        end
    
        % Abort learning if training goal is met prematurely.
        if sse < training_goal_total
            fprintf(
                'Training goal met after %d iterations (mean error: %f).\n',
                j, sse / columns
            );
            return;
        end
    end
end


function[gradient_layers] = init_gradient_layers(net)
        gradient_layers = [];
        for i = 1:(net.layer_count - 1)
            gradient_layers(i).weights = zeros(size(net.layers(i).weights));
        end
end


function[gradient_layers] = compute_gradient_layers(
    net,
    gradient_layers,
    training_inputs,
    training_outputs
)
    columns = size(training_inputs, 2);

    for i = 1:columns
        training_input  = training_inputs(:,i);
        training_output = training_outputs(:,i);

        [learned_output, layer_outputs, layer_inputs] = \
            ffnn_values(net, training_input);

        deltas = [];
        deltas(net.layer_count - 1).v = \
            2 * jacobi(layer_inputs(net.layer_count).v) \
              * (learned_output - training_output);

        for n = (net.layer_count - 2):-1:1
            deltas(n).v = \
                  jacobi(layer_inputs(n+1).v) \
                * net.layers(n+1).weights(:,1:end-1)' \
                * deltas(n+1).v;
        end

        for n = 1:(net.layer_count - 1)
            gradients(n).v             = deltas(n).v * layer_outputs(n).v';
            gradient_layers(n).weights = gradient_layers(n).weights + gradients(n).v;
        end
    end
end
