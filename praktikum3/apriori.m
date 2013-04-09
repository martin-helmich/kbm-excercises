function [ L ] = apriori( T, support_min )

[transaction_count, item_count] = size(T);
trans_count_min = transaction_count * support_min

fprintf('Mincount: %i\n', trans_count_min);

L = [];
L1 = [];

for j = 1:item_count
    itemset = zeros(1,item_count);
    itemset(1,j) = 1;
    
    if anzahl(T, itemset) >= trans_count_min
        L1(end+1,:) = itemset;
    end
end

fprintf('Häufige 1-elementige Sets:\n');
L1(:,:,1)

k = 2;
while size(L1) > 0
   Ck = apriori_gen(L1);
   L2 = [];
   
   fprintf('Kandidaten für k=%i:\n', k)
   Ck
   
   [rows,cols] = size(Ck);
   for j = 1:rows
       if anzahl(T, Ck(j,:)) >= trans_count_min
           L2(end+1,:) = Ck(j,:);
       end
   end
   
   fprintf('Häufige %i-elementige Sets:\n', k)
   L2
   
   L = [L;L2];
   L1 = L2;
   
   k = k + 1;
end

L

end

