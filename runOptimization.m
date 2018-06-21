function [xVector,nMax] = runOptimization(A, b, c, useGurobi)
rLength = size(A,1);

% example XVector that you can call size(xVector)
xVector = zeros(rLength,1);
% negative ones to make a maximize optimization problem 
negativeCVector = -1*c;
% define integer Constraint Array. contains indexes of xVector which shall be Integers. 
% In our case all x values have to be integer
intConstraintOfX = 1:size(xVector);
% bVector constain b rLength Times
bVector = b*ones(size(xVector));
% The lower bound of x is zero for all elements of x. We only want positive numbers
lowerBoundOfX = zeros(size(xVector));
% check if use Gurobi flag is set
if nargin < 4
    % if not use gurobi
    useGurobi = true;
end

Options = optimoptions('intlinprog','MaxTime',10);
%Options = optimoptions('intlinprog');
if useGurobi
    % minimizes [-1,-1,...,-1]'*x using Gurobi
    xVector = intlinprogGurobi(negativeCVector,intConstraintOfX,A,bVector,[],[],lowerBoundOfX,[],[],Options);
else
    % useMatlabOptimization
    % minimizes fVector'*x where A*x <= b and x >= 0 and x is integer
    xVector = intlinprog(negativeCVector,intConstraintOfX,A,bVector,[],[],lowerBoundOfX,[],[],Options);
end
% the maximum n is 
nMax = c*xVector;
end


