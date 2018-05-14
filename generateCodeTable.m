function GTable = generateCodeTable(qkLimit,bLimit)
if nargin == 0
    qkLimit = 10;
    bLimit = 10;
end
qArray = [2,3,5,7,11,13,15,17,19,23,27,31];
i = 1;
for q = qArray
    k = 2;
    compareValue = (q^k-1)/(q-1);
    while(compareValue < qkLimit)
        for b = 1:bLimit
            [A,r] = generateA(q,k);
            x = runOptimization(A,b);
            % TODO need for a better system to save G matrizes
            GTable{b,k,q} = generateG(r,x)
            i = i + 1;
        end
        k = k + 1;
    end
end

end

