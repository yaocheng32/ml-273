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

nFeat = 2;
[XtrP P] = fproject(Xtr, nFeat);
[XtrP M S] = rescale(XtrP);
XteP = rescale( fproject(Xte,nFeat,P), M,S); % apply to validation data
learner = logisticClassify(XtrP, Ytr, 0.1, 0.0237, 0, 1000);
err(learner, XtrP, Ytr)
err(learner, XteP, Yte)
