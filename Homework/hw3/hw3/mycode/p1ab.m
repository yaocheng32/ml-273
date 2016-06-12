% (a)
bike = load('data/mcycle80.txt');
[X y] = shuffleData(bike(:,1), bike(:,2));
[Xtr Xte Ytr Yte] = splitData(X, y, .75);

% (b)
lr = linearRegress(Xtr, Ytr);
xs = [0:.01:2]';
ys = predict(lr, xs);
plot(xs, ys, '-r');
hold on;
plot(Xtr, Ytr, 'ob');

disp('Train MSE:');
mse(lr, Xtr, Xtr)
disp('Test MSE:');
mse(lr, Xte, Yte)