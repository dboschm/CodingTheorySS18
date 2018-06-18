function [reducedA,c,e] = reduceA(A,r)
q = max(max(r))+1;
k = size(r,1);
reducedA = A;
% todo get e
% florians code
e = randi([0, q-1], [k,k]);
de = det(e);
while(de == 0)
    e = randi([0, q-1], [k,k]);
    de = det(e);
end
%e = [1,0,1;0,1,0;0,0,1];
%e = [2,1,1;0,0,2;0,2,1];

% iterate over all r vectors
for ir = 1:size(r,2)
    rv = r(:,ir);
    idx = sum(abs(r-repmat(rv,[1,size(r,2)]))) == 0;
    for imult = 1:size(r,2)
        rv = mod(e*rv,q);
        for t = 1:q
            % add new idx to idx with logical or
            idx = or(idx,(sum(abs(repmat(mod(rv*t,q),[1,size(r,2)])-r)) == 0));          
        end
    end
    if sum(idx) == size(r,2)
        idx = sum(abs(r-repmat(r(:,ir),[1,size(r,2)]))) == 0;
    end
    newAcolumn = sum(A(:,idx),2);
    reducedA(:,ir) = newAcolumn;
    cDuplicate(ir) = sum(idx);
end
[redATranspose,ia,ic] = unique((reducedA'),'rows');
reducedA = redATranspose';
c = cDuplicate(ia)
reducedA = unique(reducedA,'rows');
end

