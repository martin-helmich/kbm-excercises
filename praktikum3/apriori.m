function [ L ] = apriori( T, support_min )

[transaction_count, item_count] = size(T);
trans_count_min = transaction_count * support_min;

L = [];
L1 = [];

for j = 1:item_count
    itemset = zeros(1,item_count);
    itemset(1,j) = 1;
    
    if anzahl(T, itemset) >= trans_count_min
        L1(end+1,:) = itemset;
    end
end

k = 2;
while size(L1) > 0
   Ck = apriori_gen(L1);
   L2 = [];
   
   rows = size(Ck, 1);
   for j = 1:rows
       if anzahl(T, Ck(j,:)) >= trans_count_min
           L2 = [L2 ; Ck(j,:)];
       end
   end
   
   L  = [L;L2];
   L1 = L2;
   k  = k + 1;
end

disp('Häufige Item-Sets');
disp(L);

end

