function [ C ] = apriori_gen( L )

C = [];
rows = size(L,1);

for z1 = 1:rows
    for z2 = (z1+1):rows
        if z1 ~= z2 && anfang_gleich(L(z1,:), L(z2,:))
            C = [C ; L(z1,:) | L(z2,:)];
        end
    end
end

end

