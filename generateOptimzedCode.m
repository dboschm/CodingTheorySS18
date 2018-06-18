function [A,r,reducedA,reducedrGroups,groupsIdxs,cVector,randMatrixE,reducedX,n,G] = generateOptimzedCode(q,k,b)
[A,r] = generateA(q,k);
[reducedA,cVector,randMatrixE,reducedrGroups,groupsIdxs] = reduceA2(A,r);
[reducedX,n] = runOptimization(reducedA,b,cVector,false);
G = generateG2(reducedX,groupsIdxs,r);
end
