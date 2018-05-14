function x = runOptimization(q, k, b)

% generate matrix A
A = generateA(q,k);

rLength = size(A,1);

% negative ones to make a maximize optimization problem 
fVector = -ones(rLength,1);
bVector = b*ones(rLength,1);
intConstraintIdx = 1:rLength;
x = intlinprogGurobi(fVector,intConstraintIdx,A,bVector);

end

