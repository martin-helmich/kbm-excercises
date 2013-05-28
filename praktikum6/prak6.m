n_in  = 3;
n_out = 1;

%W1 = rand(n_in,n_in + 1);
%W2 = rand(n_out,n_in + 1);

W1 = [ 3    3    3   -4.4;
       0.8  0.8  0.8 -1.2];
W2 = [ -2.8  4.2  0.7 ];

E = [0 1 0 0 
     0 0 1 0
     0 0 0 1];

values(W1,W2,E)