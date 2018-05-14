function x = runOptimization(q, k, b, useGurobi)

% generate matrix A
A = generateA(q,k);

rLength = size(A,1);

% negative ones to make a maximize optimization problem 
fVector = -ones(rLength,1);
bVector = b*ones(rLength,1);
intConstraintIdx = 1:rLength;

if nargin < 4
    useGurobi = true;
end

if useGurobi
    % minimizes fVector'*x seGurobi
    
    x = intlinprogGurobi(fVector,intConstraintIdx,A,bVector);
else
    % useMatlabOptimization
    % minimizes fVector'*x where A*x <= b
    x = intlinprog(fVector,intConstraintIdx,A,bVector);
end

end


