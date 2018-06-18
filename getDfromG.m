function [d] = getDfromG(G,q)
% extract k from generation Matrix G
k = size(G,1);

% generate Matrix with all possible Messages
qVector = 0:(q-1);
allMessages = qVector;
for i = 1:(k-1)
    allMessages = combvec(allMessages,qVector);
end

% generate Code Words from all Possible Messages and indicate whether a
% entry is Zero or non Zero (this corresponds to a one)
allCodesBin = (allMessages'*G)~=0;
% sum up to get the weight of all Code words
allCodeWeights = sum(allCodesBin,2);
% remove first entry (0000) 
allCodeWeightsWithoutZero = allCodeWeights(2:end);
% get the minimum of the remaining weights to get d
d = min(allCodeWeightsWithoutZero);
end

