function [ C ] = apriori_gen( L )

C = [];
[rows, cols] = size(L);

for z1 = 1:rows
    for z2 = 1:rows
        if z1 == z2, break, end
        
        if anfang_gleich(L(z1,:), L(z2,:))
            C(end+1,:) = L(z1,:) + L(z2,:) > 0;
        end
    end
end

end

