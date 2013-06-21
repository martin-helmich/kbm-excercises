function [ y0,y1 ] = polyval2( p,x )
%POLYVAL2 Summary of this function goes here
%   Detailed explanation goes here

p1 = fliplr(0:length(p)-1) .* p;
p1(:,end) = [];

y0 = polyval(p, x);
y1 = polyval(p1,x);

end

