function [ C ] = apriori_gen( L )

C = [];
rows = size(L,1);

for z1 = 1:rows
    for z2 = (z1+1):rows
        if z1 ~= z2
            U = L(z1,:) | L(z2,:);
            if anfang_gleich(L(z1,:), L(z2,:))
                C = [C ; U];
            end
        end
    end
end

fprintf('%d Kandidaten für k=%d.\n', size(C,1), sum(L(1,:))+1);

end

