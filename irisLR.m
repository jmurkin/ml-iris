function irisLR(X, y , Xtest, ytest)
close all; clc

%===============Logistic Regression=================
fprintf(['\n==============Logistic Regression=================\n']);
lambda = 0; %regularization parameter
num_labels = 3; %number of classifiers you need

%==================Petal Data===================%
fprintf(['\nApplying One-vs-All Logistic Regression to petal data...\n']);
%Create new X which contains petal data only
Xpetal = X(:,3:4);
TestXpetal = Xtest(:,3:4);

%perform one versus all to have a logistic regression classifier for each iris.
[all_theta] = OneVsAllLR(Xpetal, y, num_labels, lambda);


%predict which class the petal test data belongs to.
predictions = predictOneVsAllLR(all_theta, TestXpetal);
%compare = [predictions ytest]; %can get rid of this, only put this in the check if it was right

%plot decision boundaries
plotPetalDecisionBoundary(all_theta, Xpetal, y);

%calculate accuracy on our model.
accuracyPetal = mean(double(predictions == ytest)) * 100;
fprintf(['Done!\n']);

%compare averages of cost function on both train and test data
[avgJtrain avgJtest] = compareCostsLR(Xpetal, TestXpetal, y, ytest, all_theta, lambda, num_labels);
fprintf('\nAverage cost for train data: '); disp(avgJtrain);
fprintf('Average cost for test data: '); disp(avgJtest);

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%==================Sepal Data==================%
%Logistic Regression applied to sepal data
fprintf(['\nApplying One-vs-All Logistic Regression to sepal data...\n']);

%create new X which contains only the sepal dataset.
Xsepal = X(:,1:2);
TestXsepal = Xtest(:,1:2);

%perform one versus all.
[all_theta] = OneVsAllLR(Xsepal, y, num_labels, lambda);

%predict which class the petal test data belongs to
predictions = predictOneVsAllLR(all_theta, TestXsepal);
%compare = [predictions ytest]; Debugging

%plot decision boundaries
plotSepalDecisionBoundary(all_theta, Xsepal, y);

%calculate accuracy of our model.
accuracySepal = mean(double(predictions == ytest)) * 100;
fprintf(['Done!\n']);

%compare averages of cost function on both train and test data
[avgJtrain avgJtest] = compareCostsLR(Xsepal, TestXsepal, y, ytest, all_theta, lambda, num_labels);
fprintf('\nAverage cost for train data: '); disp(avgJtrain);
fprintf('Average cost for test data: '); disp(avgJtest);

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%=============Petal and Sepal data combined==============%
fprintf(['\nApplying One-vs-All logistic regression to all data\n']);

%perform one vs all
[all_theta] = OneVsAllLR(X, y, num_labels, lambda);

%predict which class the data belongs to
predictions = predictOneVsAllLR(all_theta, Xtest);
%compare = [predictions ytest]; Debugging

%output accuracy
accuracyComb = mean(double(predictions==ytest)) * 100;
fprintf(['Done!\n']);

%compare averages of cost function on both train and test data
[avgJtrain avgJtest] = compareCostsLR(X, Xtest, y, ytest, all_theta, lambda, num_labels);
fprintf('\nAverage cost for train data: '); disp(avgJtrain);
fprintf('Average cost for test data: '); disp(avgJtest);

%Output accuracy of all models
fprintf(['\n===========Accuracies============'])
fprintf(['\nAccuracy of Petal Data Logisitc Regression model: ']); disp(accuracyPetal);
fprintf(['Accuracy of Sepal Data Logisitc Regression model: ']); disp(accuracySepal);
fprintf(['Accuracy of both Petal and Sepal Data Logisitc Regression model: ']); disp(accuracyComb);
