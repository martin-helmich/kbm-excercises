function[] = ffnn_create_train_test(
    training_input,
    training_output,
    neuron_count
)
     net          = ffnn_init(neuron_count);
    [net, errors] = ffnn_train(net, training_input, training_output);

    figure(1);
    title('Mean error');
    plot(errors(:,1), errors(:,2), '-r');

    learned_output = ffnn_values(net, training_input);

    fprintf('Trained data: \n');
    disp(training_output);

    fprintf('Learned results: \n');
    disp(learned_output);

    fprintf('Learned results (rounded): \n');
    disp(round(learned_output));

    if round(learned_output) == training_output
        fprintf('OK\n');
    else
        fprintf('NOT OK\n');
    end
end
