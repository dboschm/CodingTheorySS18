function [A,r,reducedA,groupsIdxs,cVector,randMatrixE,reducedX,n,G] = generateOptimzedCode(q,k,b)
[A,r] = generateA(q,k);
[reducedA,cVector,randMatrixE,groupsIdxs] = reduceA2(A,r);
[reducedX,n] = runOptimization(reducedA,b,cVector);
G = generateG2(reducedX,groupsIdxs,r);
end
