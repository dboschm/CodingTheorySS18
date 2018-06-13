function nMatrix = generateCodeTable(qkLimit,bLimit)
if nargin == 0
    qkLimit = 10;
    bLimit = 5;
end
% Possible qs 
qArray = [3];

i = 1;
for q = qArray
    k = 2;
    while((q^k-1)/(q-1) < qkLimit)
        for b = 1:bLimit
            [A,r] = generateA(q,k);
            q 
            k
            [x,n] = runOptimization(A,b);
            
            nMatrix(n,k) = n-b;
            % TODO need for a better system to save G matrizes
            % GTable{b,k,q} = generateG(r,x)
            i = i + 1;
        end
        k = k + 1;
    end
end

end

