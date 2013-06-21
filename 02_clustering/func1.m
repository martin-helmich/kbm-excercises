function [y,dy] = func1(x)
y = (x+2).^2 .* cos(3*x);
dy = 2*(x+2) .* cos(3*x) + (x+2).^2 .* -3.*sin(3*x);