function centroids = computeMeans(X, idx, k)
[m n] = size(X);
centroids = zeros(k, n);

for i = 1:k
  sel = find(idx == i);
  if(isempty(sel) == 0)
      centroids(i,:) = mean(X(sel,:));
  endif
endfor

end
