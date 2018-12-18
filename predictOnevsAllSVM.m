function p = predictOnevsAllSVM(models, X)
num_labels = size(models, 2);
[m,n] = size(X);
preds = zeros(m,num_labels);

for c = 1:num_labels
  p = svmPredict(models(c), X);
  preds(:,c) = p;
endfor
[v,p] = max(preds,[],2);

end
