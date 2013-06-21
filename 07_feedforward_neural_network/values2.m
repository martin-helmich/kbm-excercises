function [ a, e1, e2, e3, d1, d2 ] = values2( W1, W2, W3, d0 )

e1 = W1 * [d0; ones(1,size(d0,2)) ];
d1 = [ tansig(e1) ; ones(1,size(d0,2)) ];

e2 = W2 * d1;
d2 = [ tansig(e2) ; ones(1,size(d1,2)) ];

e3 = W3 * d2;
d3 = tansig(e3);

a = d3;

% 6.115
% 6.113
% 6.109

end
