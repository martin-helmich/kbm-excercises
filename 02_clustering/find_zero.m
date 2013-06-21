function [ x1 ] = find_zero( x0 )

i = 0;
[y0,dy0] = func1(x0);

sigm = min(1, 1/abs(dy0))

plot(x0, y0, '.r')

while i < 100
   x1 = x0 - sigm * dy0;
   [y,dy] = func1(x1);
   
   plot(x1, y, '.r')
   
   if abs(y0 - y) < 0.001
       fprintf('%f <-> %f : Abbruch!\n', y0, y)
       break
   end
   
   if y < y0
       sigm = 1.01 * sigm;
   else
       fprintf('Zu weit!\n')
       sigm = 0.5 * sigm;
   end
   
   y0 = y;
   dy0 = dy;
   x0 = x1;
   i = i + 1;
end

end

