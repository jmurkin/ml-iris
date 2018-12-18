function irisSVM(X, y, Xtest, ytest)

clc; close all;

fprintf(['\n==============SVM=================\n']);
num_labels = 3; %number of classifiers
C = 0.1; sigma = 0.1; %SVM parameters

%==============Petal data============%
fprintf(['\nImplementing One-vs-All gaussian kernal SVM for petal data\n'...
          '\nThis is for direct comparison with my logistic regression model.\n'])
Xpetal = X(:,3:4);
TestXPetal = Xtest(:,3:4);

%Training One-vs-All gaussian kernel SVM
[models] = OneVsAllSVM(Xpetal, y, C, sigma, num_labels);

%Plot decision boundary%
plotBoundarySVM(Xpetal, y, models, 'Petal')
fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%Classifying test data and calculating accuracy
p = predictOnevsAllSVM(models, TestXPetal);
accuracyPetal = mean(double(p==ytest))*100;

%============Sepal data=============%
fprintf('\nImplementing One vs All Gaussian kernal SVM for sepal data...\n');
Xsepal = X(:,1:2);
TestXSepal = Xtest(:,1:2);

%Training one-vs-all Gaussian SVM
[models] = OneVsAllSVM(Xsepal, y, C, sigma, num_labels);

%Plot decision boundary%
plotBoundarySVM(Xsepal, y, models, 'Sepal')
fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%Classifying test data
p = predictOnevsAllSVM(models, TestXSepal);
%[p, ytest] debugging

%Calculate and output accuracy
accuracySepal = mean(double(p==ytest))*100;

%============Combined Data============%
fprintf(['\nImplemening One-vs-All gaussian kernal SVM for petal and sepal data combined.\n'])

[models] = OneVsAllSVM(X, y, C, sigma, num_labels);

%Calssify test data and calculate accuracy
p = predictOnevsAllSVM(models, Xtest);
accuracyCombined = mean(double(p==ytest))*100;

%=====Accuracies of all models=====%
fprintf(['\n===========Accuracies============'])
fprintf(['\nAccuracy of Petal Data SVM model: ']); disp(accuracyPetal);;
fprintf(['Accuracy of Sepal Data SVM model: ']); disp(accuracySepal)
fprintf(['Accuracy of Combined Data SVM model: ']); disp(accuracyCombined);;
fprintf('\nProgram paused. Press enter to continue.\n');
pause;-
