function a=anfang_gleich(z1,z2)
    k=sum(z1);
    if k==0; a=1;return; end;
    s=min(find(z1,1,'last'),find(z2,1,'last'))-1;
    if sum(and(z1(1:s),z2(1:s)))==k-1
        a=1;
    else
        a=0;
    end
end