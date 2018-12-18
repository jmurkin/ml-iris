function [centroids, idx] = compareCostsKM(X, all_centroids, all_idx)
%function which compares the distortion(cost) of each instance of K-MEANS
%returns the centroids which gave the lowest cost

[m,n] = size(X);
lowestCost = 100000;
for i = 1:size(all_centroids, 3)
  Xcentroid = all_centroids(all_idx(:,i),:,i);
  cost = 1/m * sum((sqrt(sum((X - Xcentroid).^2 , 2))).^2);
  if cost < lowestCost
    lowestCost = cost;
    centroids = all_centroids(:,:,i);
    idx = all_idx(:,i);
  endif
endfor

end
