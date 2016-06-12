iris=load('data/iris.txt'); y=iris(:,end); X=iris(:,1:4);
[X y] = shuffleData(X,y);
[Xtr Xte Ytr Yte] = splitData(X,y, .75);
bc = gaussBayesClassify(Xtr, Ytr);
1 - err(bc, Xtr, Ytr) % Training accuracy = 0.982
1 - err(bc, Xte, Yte) % Validation accuracy = 0.945