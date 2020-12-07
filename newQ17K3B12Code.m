q = 17
k=3
b=12
n = 0;
nsave = 0;
while n <= 183
    [A,r,reducedA,reducedrGroups,groupsIdxs,cVector,randMatrixE,reducedX,n,G] = generateOptimzedCode(q,k,b);
    if n> nsave
        nsave = n
        esave = randMatrixE;
        gsave = G;
    end
end