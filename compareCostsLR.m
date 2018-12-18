function [avgJtrain avgJtest] = compareCostsLR(Xtrain, Xtest, Ytrain, Ytest, theta, lambda, num_labels)
  %function which takes the average cost function of one model for each classifier
  %for both the train and test data to check for high variance (overfitting).
  Xtrain = [ones(size(Xtrain,1),1) Xtrain];
  Xtest = [ones(size(Xtest,1),1) Xtest];
  Jtrains = [zeros(num_labels, 1)];
  Jtests = [zeros(num_labels, 1)];

  for c = 1:num_labels
    [Jtrain, grad] = costFunction(theta(c,:)', Xtrain, (Ytrain==c), lambda);
    [Jtest, grad2] = costFunction(theta(c,:)', Xtest, (Ytest==c), lambda);
    Jtrains(c) = Jtrain;
    Jtests(c) = Jtest;
  end

  avgJtrain = mean(Jtrains);
  avgJtest = mean(Jtests);

end
