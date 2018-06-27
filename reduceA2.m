function [redA,c,e,groupsIdxs] = reduceA2(A,r)
q = max(max(r))+1;
k = size(r,1);
rCount = size(r,2);
% florians code
e = randi([0, q-1], [k,k]);
de = mod(det(e),q);
while(de == 0)
    e = randi([0, q-1], [k,k]);
    de = mod(det(e),q);
end
%e = [1,0,1;0,1,0;0,0,1];
%e = [2,1,1;0,0,2;0,2,1];
%e = [5,6,2;6,6,4;14,6,1];

% reduced indexCounter
iReduced = 1;
% mask already processed r vectors
mask = false(1,rCount);
% iterate over all r vectors
for ir = 1:rCount
    % skip vector if already masked
    if mask(ir)
        continue
    end
    % select start r vector 
    r0 = r(:,ir);
    % recursive r vector to be multiplied with e
    rv = mod(e*r0,q);
    
    % group mask idx
    grpIdx = false(1,rCount);
    grpIdx(ir) = 1;
    
    % iterate over group 
    while ~isequal(rv,r0) 
        % normalize rv brute force to get rIdx
        for factor = 1:(q-1)
            % test factor * rv
            normRv = mod(factor*rv,q);
            replicatedNormRv = repmat(normRv,[1,rCount]);
            sumdiffRvR = sum(abs(replicatedNormRv-r));
            normRvIdx = sumdiffRvR == 0;
            % break if Idx found
            if(sum(normRvIdx)>0)
                break
            end
        end
        % add rIdx of normed Rv to groupIdx
        grpIdx = or(grpIdx,normRvIdx);
        
        % break if all vectors are in elements of the group
        if sum(grpIdx) == rCount
            % reset grpindex so that there is only at position ir true
            grpIdx = false(1,rCount);
            grpIdx(ir) = 1;
            break
        end
        % set rv for next iteration
        rv = mod(e*rv,q);
    end
    
    % Add sum of Indexed Colums of A to reducedA Matrix 
    reducedA(:,iReduced) = sum(A(:,grpIdx),2);
    % Add weight of consolidated Columns to c
    c(iReduced) = sum(grpIdx);
    % extract distict Groups 
    groupsIdxs{iReduced} = grpIdx;
    % increase Index in Reduced Matrix
    iReduced = iReduced +1;

    % mask group
    mask = or(mask,grpIdx);
end
% reduce rows
redA = unique(reducedA,'rows');
end

