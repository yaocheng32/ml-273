K = [1, 2, 4, 8, 16, 32, 64];
train_error = zeros(1, length(K));
test_error = zeros(1, length(K));
for k=1:length(K)
  learner = knnRegress(Xtr, Ytr, K(k));
  %Yhat = predict(learner, Xte);
  train_error(k) = mse(learner, Xtr, Ytr);
  test_error(k) = mse(learner, Xte, Yte);
end;
figure;
hold on;
semilogx(K, train_error, 'ro-');
semilogx(K, test_error, 'go-');