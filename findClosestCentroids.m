function idx = findClosestCentroids(X, centroids)

idx = zeros(size(X,1), 1);

for i = 1:(size(X,1))
	x = X(i,:); %take row x

	%subtract x from all centroids
	D = bsxfun(@minus, centroids, x);

	%find the sum of the square of the difference
	D = sum(D.^2,2);

	%find the minium difference
	[M,I] = min(D);
	idx(i) = I;

endfor

end
