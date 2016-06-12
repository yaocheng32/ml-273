mnist = load('data/mnist.txt');
Y = mnist(:,1);
X = mnist(:,2:end);
keep = (Y==0 | Y==8);
Y = Y(keep);
X = X(keep,:);

% Change 8 to 1
Y(Y==8) = 1;

[X Y] = shuffleData(X,Y);
[Xtr Xte Ytr Yte] = splitData(X, Y, 0.75);

alpha_vals = logspace(-6, 1, 25);
train_error = [];
test_error = [];
min_alpha = 0;
min_error = 1;
for i=1:size(alpha_vals,2),
    alpha = alpha_vals(i);
    learner = logisticClassify(Xtr, Ytr, 0.1, 0.00001, alpha, 200);
    train_error = [train_error err(learner, Xtr, Ytr)];
    test_error = [test_error err(learner, Xte, Yte)];
    
    if (test_error(i) < min_error),
        min_error = test_error(i);
        min_alpha = alpha;
    end
    
    fig(4);
    semilogx(alpha_vals(1:i), train_error(1:i), '-or', alpha_vals(1:i), test_error(1:i), '-og');
    xlabel('Alpha');
    ylabel('Error rate');
    legend('Training data', 'Test data');
    drawnow;
    
end

min_alpha
%learner = perceptClassify(Xtr, Ytr, 0.01, 1000);
%learner = knnClassify(Xtr, Ytr, 10);