T = [1 1 1 0
     1 0 0 1
     1 0 1 0
     0 1 0 0
     1 1 1 0];
T = dlmread('wbsa0206_100.dat');
 
R = apriori_reg(T, 0.4, 0.7);
apriori_print(R);