function [A,r] = fastGenerateA(q,k)
%% Calculate r
% number of r vectors
rlength = (q^k-1)/(q-1);

% base value is 0
r = zeros(k,rlength,'single');

% set first vektor
r(k,1) = 1;
% iterate over rows to set pivot 1 

% helpvector needed to generate all possible combinations
helpCombVector = 0:q-1;
% Matrix which holds all combinations beneath the 111 line
fillinMatrix = 0:q-1;

% set colOffset to 1 because the first column is already done
colOffset = 1;

% iterate over rows upwards 
% i is the row only containing 111 in a specific colSegment
for i = k-1:-1:1
    % calculate the specific column Segment
    colSegment = colOffset+1:colOffset+q^(k-i);
    % set all values in row i in the i-specific ColSegment to 1
    r(i,colSegment) = 1;
    % row Segment concerns all rows beneath i 
    rowSegment = i+1:k;
    % select 2D Range beneath the row and fillin the combination Matrix
    r(rowSegment,colSegment) = fillinMatrix;
    
    % set columnOffset for next iteration
    colOffset = colOffset + q^(k-i);
    % if not last iteration ...
    if (i ~= 1)
        % ... generate bigger combination Matrix
        fillinMatrix = combvec(fillinMatrix,helpCombVector);
    end
end
%% Calculate matrix A
% calculate all scalarproducts mod q
scalarProducts = mod(r'*r,q);

% set A to true (1) where scalar product is 0
A = (scalarProducts == 0);

%% Some additional output
% plot pixel image of A
%file = strcat('A_q',num2str(q),'_k',num2str(k),'.bmp');
%imwrite(A,file);
imagesc(A);
