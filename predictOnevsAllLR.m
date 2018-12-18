function p = predictOneVsAll(all_theta, X)

m = size(X, 1);
p = zeros(size(X,1), 1);

%Add ones to the X data matrix
X = [ones(m, 1) X];

A = sigmoid(X*all_theta'); %works out h for each classifier by using matrix product it adds up each theta term * x term for each classifier
[v,p] = max(A,[],2);

end
