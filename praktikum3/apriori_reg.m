function [ R ] = apriori_reg( T, support_min, confidence_min )

L = apriori(T, support_min);
R = [];
Ra = [];

for Z = L', Z=Z';
   Rz = [];
   
   az = anzahl(T, Z);
   
   D = [];
   D1 = [];
   cols = size(Z,2);
   
   for j=1:cols
      if Z(1,j) == 0, continue, end; 
      
      W = Z;
      W(1,j) = 0;
      d = Z & ~W;
      
      if az >= confidence_min * anzahl(T, W)
          D1 = [D1;d];
      end
   end
   
   D = D1;
   l = 2;
   
   while size(D1) > 0
       Cl = apriori_gen(D1);
       D2 = [];
       [rows,cols] = size(Cl);
       
       for j=1:rows
           d = Cl(j,:);
           W = xor(Z,d);
           
           if az >= confidence_min * anzahl(T, W)
               D2 = [D2; d];
           end
       end
       
       l = l + 1;
       D = [D; D2];
       D1 = D2;
   end
   
   r = size(D,1);
   R = repmat(Z,r,1);
   if isempty(R) == 0
       Ra = [Ra; R + D];
   end
end

R = Ra;

end

