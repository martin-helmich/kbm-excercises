function [ y,yg ] = f( x1,x2 )

y = ((x1 + 1).^2 + (x2 + 1).^2) .* ((x1-2).^2 + (x2-1).^2) + x1 + x2;

yg = [4 .* x1 .^ 3 - 6 .* x1 .^ 2 + x1 .* (4 .* x2 .^ 2 - 2) - 2 .* x2 .^ 2 - 12 .* x2 + 3
      4 .* x1 .^ 2 .* x2 - 4 .* x1 .* (x2 + 3) + 4 .* x2 .^ 3 + 6 .* x2 + 7];

end

