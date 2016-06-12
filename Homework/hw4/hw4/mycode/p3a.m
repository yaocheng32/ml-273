rand('state',0); randn('state',0);
data = load('data/spambase.data');
X = data(:,1:57); Y=data(:,end);
[X,Y] = shuffleData(X,Y);
[Xt,Xv,Yt,Yv] = splitData(X,Y,.6);
[Xt,S] = rescale(Xt); Xv = rescale(Xv,S);
learner = treeClassify(Xt, Yt, 2, 10);
err(learner, Xt, Yt)
err(learner, Xv, Yv)