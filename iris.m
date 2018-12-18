%===========Extracting data and randomly splitting it into train and test%==========
%Extract data from csv file
data = csvread('Iris.csv',1,1);

%Split data into train and test (7:3 Split)
%do that by first shuffling the data
[m,n] = size(data);
shuffledD = randperm(m);
shfData = data(shuffledD,:);

%now split the data into train and test
trainData = shfData(1:floor(m*0.7),:);
testData = shfData(floor(m*0.7)+1:m,:);

%Split train data into X and y
X = trainData(:,1:size(trainData,2)-1);
y = trainData(:,size(trainData,2));
[m,n] = size(trainData);

%Split test data into X and y
Xtest = testData(:,1:size(testData,2)-1);
ytest = testData(:,size(testData,2));

%=============Plotting Data=================
%Plot petal length against petal width for the 3 iris'
fprintf(['\nPlotting petal length against petal width... \nPlotting sepal length against sepal width...\n']);

plotData2(X(:,3:4), y, 'Petal');
plotData2(X(:,1:2), y, 'Sepal');

fprintf(['\n']);
%Calculate correlation coefficients for both.
coefPetal = corrcoef(X(:,3),X(:,4))
coefSepal = corrcoef(X(:,1),X(:,2))
fprintf(['\nAs petals have a much higher correlation than sepals, '...
        '\ngoing to apply algorithms to petal data and sepal data individually '...
        '\nas well as combined and see what the results are.\n']);
fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%LR
irisLR(X, y, Xtest, ytest)
fprintf(['\nAs the accuracy of the model on the sepal data is low,'...
        '\nI will try another supervised learning algorithm.\n'])
fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%SVM
irisSVM(X, y, Xtest, ytest)

%K-MEANS
irisKMeans(X, y , Xtest, ytest)
