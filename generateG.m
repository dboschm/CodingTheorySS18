function G = generateG(r,x)
q = max(max(r));
k = size(r,1);
xRep = repmat(x,1,k)';
rMult = r.*xRep;
G = rMult(:,x > 0);
end

