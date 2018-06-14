function G = generateG(r,x)
k = size(r,1);
xRep = repmat(x,1,k)';
rMult = r.*xRep;
G = rMult(:,x > 0);
end

