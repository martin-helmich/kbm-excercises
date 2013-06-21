function [ n,success,i ] = polynewton( x0, a )
%NEWTON Summary of this function goes here
%   Detailed explanation goes here

p = [1 -1 -13 13 36 a];
p1 = [5 -4 -39 26 36];

n = 0;
i=1;
success = false;

while i<100
   x1 = x0 - polyval(p,x0) / polyval(p1,x0);
   
   if abs(x1-x0) < 10^-10
       n = x1;
       success = true;
       break
   end
   
   i = i + 1;
   x0 = x1;
end

end

