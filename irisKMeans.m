function irisKMeans(X, y, Xtest, ytest)
close all; clc

X = [X; Xtest];
y = [y; ytest];
[m,n] = size(X);
%===========Performing K-Means=================%
fprintf(['\n=================K-Means==================\n']);
k = 3; %number of centroids needed
numIters = 10; %Number of iterations of a single K-MEANS
numKMeans = 20; %Number of times to run K-Means to find centroids with lowest cost.

%==============Petal data============%
fprintf(['\nPerforming K-Means with three centroids on petal data...\n']);
Xpetal = X(:,3:4);

%Perform numKMeans K-Means with a total of numIters per K-Means
%return centroids which result in lowest distortion(cost)
[centroids, idx] = performKMeans(Xpetal, k , numIters, numKMeans);

%Plot which x values belong to which centroid.
plotCentroids(Xpetal, idx, centroids, 'Petal');

%Plot labelled X for comparison.
fprintf(['\nPlotting labelled petal data for comparison with centroids...\n']);
plotData2(Xpetal, y, 'Petal');
petalRandI = calcRandI(idx,y);
petalARI = calcARI(idx,y);

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%==============Sepal data============%
fprintf(['\nPerforming K-Means with three centroids on sepal data...\n']);
Xsepal = X(:,1:2);

%Perform numKMeans K-Means with a total of numIters per K-Means
%return centroids which result in lowest distortion(cost)
[centroids, idx] = performKMeans(Xsepal, k , numIters, numKMeans);

%Plot which x values belong to which centroid.
plotCentroids(Xsepal, idx, centroids, 'Sepal');

%Plot labelled X for comparison.
fprintf(['\nPlotting labelled sepal data for comparison with centroids...\n']);
plotData2(Xsepal, y, 'Sepal');
sepalRandI = calcRandI(idx,y);
sepalARI = calcARI(idx,y);
fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%==============Combined data============%
fprintf(['\nPerforming K-Means with three centroids on petal and sepal data...\n']);

%Perform numKMeans K-Means with a total of numIters per K-Means
%return centroids which result in lowest distortion(cost)
[centroids, idx] = performKMeans(X, k , numIters, numKMeans);

combRandI = calcRandI(idx,y);
combARI = calcARI(idx,y);

%============Rand index and A Rand index of models============%
fprintf(['\n===========Rand Index and Adjusted Rand Index==========='])
fprintf(['\nRand Index of centroids for petal data: ']); disp(petalRandI);
fprintf(['Adjusted Rand Index of centroids for petal data: ']); disp(petalARI);
fprintf(['\nRand Index of centroids for sepal data: ']); disp(sepalRandI);
fprintf(['Adjusted Rand Index of centroids for sepal data: ']); disp(sepalARI);
fprintf(['\nRand Index of centroids for combined data: ']); disp(combRandI);
fprintf(['Adjusted Rand Index of centroids for combined data: ']); disp(combARI);

fprintf('\nProgram paused. Press enter to continue.\n');
pause;
