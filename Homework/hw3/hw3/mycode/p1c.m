bike = load('data/mcycle80.txt');
[X y] = shuffleData(bike(:,1), bike(:,2));
[Xtr Xte Ytr Yte] = splitData(X, y, .75);
degrees = [1 3 5 7 10 18];
train_err = zeros(1, size(degrees, 2));
test_err = zeros(1, size(degrees, 2));
for i=1:size(degrees, 2),
    % Get degree
    d = degrees(i);
    
    % Add poly features
    XtrP = fpoly(Xtr, d, false);
    XteP = fpoly(Xte, d, false);
    
    % Rescale features
    [XtrP, M, S] = rescale(XtrP);
    XteP = rescale(XteP, M, S);
    
    % Train linear regression model
    lr = linearRegress(XtrP, Ytr);
    
    % Plot regression function
    figure();
    xs = [0:.01:2]';
    xsp = fpoly(xs, d, false);
    xsp = rescale(xsp, M, S);
    ys = predict(lr, xsp);
    plot(xs, ys, '-r');
    hold on;
    plot(Xtr, Ytr, 'ob');
    ylim([-200 150]);
    tt = sprintf('d = %d', d);
    title(tt);
    
    % Remember training and test errors
    train_err(i) = mse(lr, XtrP, Ytr);
    test_err(i) = mse(lr, XteP, Yte);
end

figure();
semilogy(degrees, train_err, '-og');
hold on;
semilogy(degrees, test_err, '-or');
legend('Training data', 'Test data');
xlabel('Degree');
ylabel('MSE');
hold off;