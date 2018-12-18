function [J, grad] = costFunction(theta, X, y , lambda);
  m = length(y);
  J = 0;
  grad = zeros(size(theta));

  %cost function
  h = sigmoid(X*theta);
  y0 = -y.*log(h);
  y1 = (1-y).*log(1-h);
  theta(1) = 0;
  thetaSq = theta.*theta;
  reg = lambda/(2*m) * sum(thetaSq);
  J = (1/m * (sum(y0) - sum(y1))) + reg;

  %gradient of cost function
  grad = (1/m * X'*(h-y)) + lambda/m * theta;
end
