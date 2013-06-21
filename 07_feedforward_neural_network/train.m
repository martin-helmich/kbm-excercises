function [ W1,W2 ] = train( W1,W2,E,A )
%TRAIN Summary of this function goes here
%   Detailed explanation goes here

columns = size(E, 2);
sigma   = 0.075;
sse0    = 1000;
sse     = 0;

for j = 1:10000
    sse = 0;
    g1 = zeros(size(W1));
    g2 = zeros(size(W2));

    for i = 1:columns
       e = E(:,i);
       a = A(:,i);

       [d, e1, e2, d1] = values(W1, W2, e);
       %sse = sse + (d - a)^2;
       sse = sse + sum((d - a).^2);

       delta2 = 2 * jacobi(e2) * (d - a);
       delta1 =     jacobi(e1) * W2(:,1:end-1)' * delta2;

       gradient1 = delta1 * [e;1]';
       gradient2 = delta2 * d1';

       g1 = g1 + gradient1;
       g2 = g2 + gradient2;
    end

    %disp(g1);
    %disp(g2);

    W1 = W1 - sigma * g1;
    W2 = W2 - sigma * g2;
    
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

