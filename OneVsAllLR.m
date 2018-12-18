function [all_theta] = oneVsall(X, y, num_labels, lambda)
[m,n] = size(X);

%contains the weights for each logistic regression classifier
all_theta = zeros(num_labels, n + 1);

%Add ones to the X data matrix
X = [ones(m ,1) X];

%Setting up parameters for fminunc
initial_theta = zeros(n+1, 1);
options = optimset('GradObj', 'on', 'MaxIter', 400);

for c = 1:num_labels
  [theta, cost] = fminunc(@(t)(costFunction(t, X, (y==c), lambda)), initial_theta, options);
  all_theta(c,:) = theta;
endfor

end
