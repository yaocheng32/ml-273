% Read data
bike = load('data/mcycle80.txt');
[X y] = shuffleData(bike(:,1), bike(:,2));
[Xtr Xte Ytr Yte] = splitData(X, y, .75);

% Set alpha values
alpha_vals = logspace(-6, 1, 25);

% For keeping mse
train_err = zeros(1, size(alpha_vals, 2));
test_err = zeros(1, size(alpha_vals, 2));

% Add poly features & rescale
XtrP = fpoly(Xtr, 18, false);
XteP = fpoly(Xte, 18, false);
[XtrP, M, S] = rescale(XtrP);
XteP = rescale(XteP, M, S);

% For each alpha values, train a model and compute mse
for i=1:size(alpha_vals, 2),
    alpha = alpha_vals(i);
    lr = linearRegress(XtrP, Ytr, alpha);
    % Remember training and test errors
    train_err(i) = mse(lr, XtrP, Ytr);
    test_err(i) = mse(lr, XteP, Yte);
end

% Plot alpha vs mse
semilogx(alpha_vals, train_err, '-og');
hold on;
semilogx(alpha_vals, test_err, '-or');
legend('Training data', 'Test data');
xlabel('Alpha');
ylabel('MSE');
hold off;