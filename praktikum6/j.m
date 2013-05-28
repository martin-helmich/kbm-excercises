function [ j ] = j( e )
%J Summary of this function goes here
%   Detailed explanation goes here

% tansig(x)' = 1 - tanh^2(x)

j = diag(1 - tanh^2(e))

end

