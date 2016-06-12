iris=load('data/iris.txt'); y=iris(:,end); X=iris(:,1:4);
[X y] = shuffleData(X,y);
nFolds = 5;
min_error = -1;
best_d = 1;
for d=1:50,
    e = 0;
    for iFold = 1:nFolds,
        [Xtr,Xte,Ytr,Yte] = crossValidate(X,y,nFolds,iFold);
        learner = treeClassify(Xtr, Ytr, 0, d, -1, inf);
        e = e + err(learner, Xte, Yte);
    end;
    e = e / nFolds;
    if e < min_error || min_error == -1,
        min_error = e;
        best_d = d;
    end;
end;
best_d