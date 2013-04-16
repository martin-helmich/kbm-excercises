function [  ] = apriori_print( R )

[rows,cols] = size(R);

for i=1:rows
    for j=1:cols
        if R(i,j) == 1, fprintf('%d ', j), end
    end
    fprintf('=> ');
    for j=1:cols
        if R(i,j) == 2, fprintf('%d ', j), end
    end
    fprintf('\n')
end

end

