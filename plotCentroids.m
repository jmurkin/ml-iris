function plotCentroids(X, idx, centroids, feature)
k = size(centroids , 1);
palette = hsv(k + 1);
colors = palette(idx, :);

% Plot the data
scatter(X(:,1), X(:,2), 50, colors, 'filled', 'k+', 'Marker', 'o', 'LineWidth', 10);
title([feature,' length against ', feature, ' width for various Iris. Categorised by Centroids'])
xlabel([feature, ' length/cm'])
ylabel([feature,' width/cm'])
end
