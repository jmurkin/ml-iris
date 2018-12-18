function [centroids, idx] = performKMeans(X, k, numIters, numKMeans)
[m,n] = size(X);


all_centroids = zeros(k, n, numKMeans);
all_idx = zeros(m,numKMeans);
 for i = 1:numKMeans
   init_centroids = kMeansInitCentroids(X, k);
   for j = 1:numIters
      idx = findClosestCentroids(X, init_centroids);
      centroids = computeMeans(X, idx, k);
   endfor
   all_centroids(:,:,i) = centroids;
   all_idx(:,i) = idx;
 endfor

[centroids, idx] = compareCostsKM(X, all_centroids, all_idx);

end
