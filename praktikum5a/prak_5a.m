[x1,x2] = meshgrid(-2:0.2:3, -2:0.2:3);

%surf(x1, x2, f(x1,x2));

hold on;
contour(x1, x2, f(x1,x2), 40);

while 1
[x10,x20] = ginput(1);

d = 0.001;
y0 = inf;
i = 0;

while i < 1000
    plot(x10, x20, 'b.');
    [y, yg] = f(x10, x20);
    
    x10 = x10 - d * yg(1);
    x20 = x20 - d * yg(2);
    
    if y0 > y
        d = d * 1.05;
    elseif y0 < y
        d = d * 0.5;
    end
    
    if abs(y0 - y) < 0.01
        break
    end
    
    y0 = y;
    i = i + 1;
end
end