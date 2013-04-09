function [ R ] = apriori_reg( T, support_min, confidence_min )

L = apriori(T, support_min);
R = [];
Ra = [];

for Z = L', Z=Z';
   Rz = [];
   
   fprintf('Betrachte Item-Menge:\n')
   Z
   
   az = anzahl(T, Z);
   
   D = [];
   D1 = [];
   [rows, cols] = size(Z);
   
   for j=1:cols
      if Z(1,j) == 0, break, end; 
      
      W = Z;
      W(1,j) = 0;
      d = xor(Z,W);
      
      if az >= confidence_min * anzahl(T, W)
          D1 = [D1;d];
      end
   end
   
   fprintf('1-Elementige Dann-Teile:\n')
   D1
   
   D = D1;
   l = 2;
   
   while size(D1) > 0
       Cl = apriori_gen(D1);
       D2 = [];
       [rows,cols] = size(Cl);
       
       fprintf('%i-elementige Kandidaten:\n', l)
       Cl
       
       for j=1:rows
           d = Cl(j,:);
           W = xor(Z,d);
           
           if az >= confidence_min * anzahl(T, W)
               D2 = [D2; d];
           end
       end
       
       fprintf('%i-elementige Dann-Teile:\n', l);
       D2
       
       l = l + 1;
       D = [D; D2];
       D1 = D2;
   end
   
   fprintf('Alle Dann-Teile:');
   D
   
   [r,c] = size(D);
   
   fprintf('Regeln:')
   R = repmat(Z,r,1);
   if isempty(R) == 0
       Ra = [Ra; R + D];
   end
end

Ra


end

