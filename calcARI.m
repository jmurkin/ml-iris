function ARI = calcARI(x, y)
k = max(x);
n = size(x,1);

%produce a contingency table
contTable = zeros(k,k);
for j = 1:k
  for i = 1:k
    contTable(i,j) = numel(intersect( find(x==i), find(y==j)));
  endfor
endfor

%calculate the sum of rows and columns of contingency
rowSums = sum(contTable,2);
columnSums = sum(contTable, 1);

%Calculate ARI
sumA = sum(rowSums.*((rowSums-1)/2));
sumB = sum(columnSums.*((columnSums-1)/2));
sumN = sum(sum(contTable.*((contTable-1)/2)));
n2 = n*((n-1)/2);

ARI = (sumN - (sumA*sumB)/n2)/(0.5*(sumA+sumB) - (sumA*sumB)/n2);
end
