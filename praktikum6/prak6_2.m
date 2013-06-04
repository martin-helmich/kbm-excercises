n=100;
Mx=10;
E=Mx*rand([2,n])-Mx/2*ones(2,n); % Mittelwert Null
k1=E(1,:)>=0;
k2=E(2,:)>=0;
A=[and(k1,k2); ... % 1 Quadrant
and(not(k1),k2); ... % 2. Quadrant
and(not(k1),not(k2)); ... % 3. Quadrant
and(k1,not(k2))]; % 4. Quadrant

plot(E(1,A(1,:)),E(2,A(1,:)),'ok'); hold on
plot(E(1,A(2,:)),E(2,A(2,:)),'*k');
plot(E(1,A(3,:)),E(2,A(3,:)),'sk');
plot(E(1,A(4,:)),E(2,A(4,:)),'pk');