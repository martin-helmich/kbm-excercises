function [ x1,success ] = newton( x0 )
%NEWTON Summary of this function goes here
%   Detailed explanation goes here

i=1;
success = false;

while i<100
   x1 = x0 - (2*cos(x0)-x0) / (-2*sin(x0)-1);
   
   if abs(x1-x0) < 10^-10
       success = true;
       break
   end
   
   i = i + 1;
   x0 = x1;
end

end

