n_in  = 2;
n_middle = 2;
n_out = 1;

W1 = rand(n_middle, n_in + 1);
W2 = rand(n_out , n_middle + 1);

E = [0 1 0 1 
     0 0 1 1];
A = [0 1 1 0];

[W1,W2] = train(W1,W2,E,A);

D = values(W1,W2,E);

fprintf('Soll: ');
disp(A);

fprintf('Ist : ');
disp(round(D));

if (round(D) == A)
    fprintf('OK\n');
end
