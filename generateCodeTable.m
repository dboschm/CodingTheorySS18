function [ctbl,qArray] = generateCodeTable(qkLimit,bLimit)
% All relevanb qs
qArray = [2,3,5,7,11,13,17,19,23];
% index counter for q 
qi = 1;
% iterate over q
for q = qArray
    % initialize k
    k = 1;
    % calculate until qkLimit is reached (e.g. 1000)
    while((q^k-1)/(q-1) < qkLimit)
        % run for several bs
        for b = 1:bLimit
            % generate Matrix A
            A = generateA(q,k);
            % run Gurobi Optimzer
            [~,n] = runOptimization(A,b);
            % save d = n-b into codetable ctbl (dimensions n,k,q)
            ctbl(n,k,qi) = n-b;
        end
        k = k + 1;
    end
    qi = qi + 1;
end
end