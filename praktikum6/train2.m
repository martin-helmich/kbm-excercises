function [ W1,W2,W3 ] = train2( W1,W2,W3,E,A )
%TRAIN Summary of this function goes here
%   Detailed explanation goes here

columns = size(E, 2);
sigma   = 0.05;
sse0    = inf;
sse     = 0;

fehler = []

for j = 1:5000
    sse = 0;
    g1 = zeros(size(W1));
    g2 = zeros(size(W2));
    g3 = zeros(size(W3));

    for i = 1:columns
       e = E(:,i);
       a = A(:,i);

       [d, e1, e2, e3, d1, d2] = values2(W1, W2, W3, e);
       %sse = sse + (d - a)^2;
       sse = sse + sum((d - a).^2);

       delta3 = 2 * jacobi(e3) * (d - a);
       delta2 =     jacobi(e2) * W3(:,1:end-1)' * delta3;
       delta1 =     jacobi(e1) * W2(:,1:end-1)' * delta2;

       gradient1 = delta1 * [e;1]';
       gradient2 = delta2 * d1';
       gradient3 = delta3 * d2';

       g1 = g1 + gradient1;
       g2 = g2 + gradient2;
       g3 = g3 + gradient3;
    end

    %disp(g1);
    %disp(g2);

    if (sse > sse0)
        sigma = sigma * 0.5;
        %fprintf('Hoppla (Fehler: %f)\n', sse);
    else
        sigma = sigma * 1.01;
  
        fehler = [fehler ; sse ];
    
        W1 = W1 - sigma * g1;
        W2 = W2 - sigma * g2;
        W3 = W3 - sigma * g3;
    end 

    sse0 = sse; 

    if mod(j, 20) == 0
        fprintf('Durchschnitts-Fehler nach %i Iterationen: %f (sigm: %f)\n', j, sse / columns, sigma);
    end
    
    if sse < 0.001
        fprintf('Reicht jetzt.\n');
        return
    end
end

%figure
%plot(fehler);

end

