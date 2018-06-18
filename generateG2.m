function [G] = generateG2(reducedX,groupsIdxs,r)
k = size(r,1);
rCount = size(r,2);

G = zeros(k,0);
selectedGroups = (reducedX ~= 0);
for iGroup = 1:size(groupsIdxs,2)
    if selectedGroups(iGroup)
        group = r(:,groupsIdxs{iGroup});
        duplicateFactor = cast(reducedX(iGroup),'int32');
        G = [G,repmat(group,[1,duplicateFactor])];
    end
end

