function plotPetalDecisionBoundary(theta, X, y)
%Plots the decision boundary by first plotting X, X will always be a mtrain x 2 dimensional matrix
%so can plot X(1) against X(2)
[m, n] = size(X);

plotData2(X,y,'Petal')

for i = 1:size(theta, 1)
  colour = 'b';
  if i == 2
    colour = 'r';
  elseif i == 3
    colour = 'y';
  end
  hold on
  plot_x = [min(X(:,1))-2, max(X(:,1))+2];
  plot_y = (-1./theta(i,3)).*(theta(i,2).*plot_x + theta(i,1));
  plot(plot_x, plot_y, colour);
  hold off
end
  legend('Setosa', 'Versicolor', 'Virginia', 'Decision Boundary Setosa', 'DB Versicolor', 'DB Virginia', 'Location', 'NorthWest')
  axis([0, 7, 0, 2.5])
end
