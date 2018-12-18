function plotData2(X, y, feature)
  setosa = find(y==1);
  versi = find(y==2);
  virgin = find(y==3);
  figure;

  %Plot feature length against feature width for the 3 iris'
  hold on
  plot(X(setosa,1), X(setosa,2), 'k+', 'Marker', 'o', 'LineWidth', 2, 'MarkerFaceColor', 'b', 'MarkerSize', 7);
  plot(X(versi,1), X(versi,2), 'k+', 'Marker', 'o', 'LineWidth', 2, 'MarkerFaceColor', 'r', 'MarkerSize', 7);
  plot(X(virgin,1), X(virgin,2), 'k+', 'Marker', 'o', 'LineWidth', 2, 'MarkerFaceColor', 'y', 'MarkerSize', 7);
  hold off
  title([feature,' length against ', feature, ' width for various Iris'])
  xlabel([feature, ' length/cm'])
  ylabel([feature,' width/cm'])
  legend('Setosa', 'Versicolor', 'Virginia', 'Location', 'NorthWest')
end
