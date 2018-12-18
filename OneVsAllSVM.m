function [models] = OneVsAllSVM(X, y, C, sigma, num_labels)
x1 = [1 2 1]; x2 = [0 4 -1];
for c = 1:num_labels
  model = svmTrain(X, double(y==c), C, @(x1, x2) gaussianKernel(x1, x2, sigma), 1e-3, 20);
  models(c) = model;
endfor

end
