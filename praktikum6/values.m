function [ a ] = values( W1, W2, d0 )

e1 = W1 * [d0; ones(1,size(d0,2)) ];
d1 = [ tansig(e1) ; ones(1,size(d0,2)) ];

e2 = W2 * d1;
d2 = tansig(e2);

a = d2;

% 6.115
% 6.113
% 6.109

end

