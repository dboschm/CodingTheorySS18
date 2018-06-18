function G = generateG(r,xSelection)
% extract k from given Data
k = size(r,1);
% replicate the optimized x Vector k times so that all dimensions will get
% scaled up 
xRep = repmat(xSelection,k,1);
% scale r vectors with corresponding xi
rMult = r.*xRep;
% get idx of non zero colums 
columnIdx = (xSelection ~= 0);
% select with x scaled rVectors from non zero columns
G = rMult(:,columnIdx);
end

