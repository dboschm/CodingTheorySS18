function [codetable,qArray] = generateCodeTable(qkLimit,bLimit)
% All relevanb qs
qArray = [2,3,5,7,11,13,17,19,23];
% index counter for q 
qi = 1;
% iterate over q
for q = qArray
    % initialize k
    k = 1;
    % calculate until qkLimit is reached (e.g. 1000)
     while ((q^k-1)/(q-1) < qkLimit)
        % run for several bs
        for b = 1:bLimit
            % generate Matrix A
            [A,r] = generateA(q,k);
            % run Gurobi Optimzer
            [~,n] = runOptimization(A,b,ones(1,size(r,2)));
            % save d = n-b into codetable ctbl (dimensions n,k,q)
            codetable(n,k,qi) = n-b;
        end
        k = k + 1;
    end
    qi = qi + 1;
end
end