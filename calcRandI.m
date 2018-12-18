function RandI = calcRandI(x,y)
%Function which calculates the Rand index of two sets of elements assigned to centroids
%Rand Index is a measure of how much two set of clusters agree with eachother.
%A useful metric for measuring accuracy of K-Means

n = size(x,1);
xmat = zeros(size(x,1), size(x,1));
ymat = zeros(size(x,1), size(y,1));


%calculates the pairs of elements that are equal and not equal to eachother in both centroids
%outputs the results into a matrix which can then be used to calculate a single fraction.
for i = 1:n
  for j = 1:n
      if x(i) == x(j)
          xmat(i,j) = 0;
      else
        xmat(i,j) = 1;
      endif
  endfor
endfor

for i = 1:n
  for j = 1:n
      if y(i) == y(j)
          ymat(i,j) = 0;
      else
        ymat(i,j) = 1;
      endif
  endfor
endfor


totalPairs = n*((n-1)/2);
numDisagree = sum(sum(abs(xmat - ymat))) / 2;

%fraction of pairs of elements that agree
RandI = 1 - (numDisagree/totalPairs);
