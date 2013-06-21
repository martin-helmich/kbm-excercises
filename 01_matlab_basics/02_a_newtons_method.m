%% NEWTON'S METHOD
%%
%% Martin Helmich <martin.helmich@hs-osnabrueck.de>
%% University of Applied Sciences Osnabrück
%%
%% This work is licensed under the Creative Commons Attribution-ShareAlike 3.0
%% Unported License. To view a copy of this license, visit
%%
%%   http://creativecommons.org/licenses/by-sa/3.0/


%% APPLY NEWTON'S METHOD
%  Apply Newton's method to find a root of 2 * cos(x) - x

x0 = 0;  % Initial value.
i  = 1;  % Loop counter

while i < 100
   x1 = x0 - (2*cos(x0)-x0) / (-2*sin(x0)-1);
   
   if abs(x1-x0) < 10^-10
       break
   end
   
   i  = i + 1;
   x0 = x1;
end

fprintf('Found root at x=%f \n', x1);


%% PLOT RESULT
%  Draw the function and the found root (x1).

x = x1-4:0.1:x1+4;

hold on;

plot(x, 2 * cos(x) - x, 'r-');
plot([x1,x1], [0,2]);

pause();
