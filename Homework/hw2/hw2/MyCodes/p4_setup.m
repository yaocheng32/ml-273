iris=load('data/iris.txt');
y=iris(:,end); X=iris(:,1:2); % take only 2 features
[X y] = shuffleData(X,y); % shuffle data randomly to avoid pathologica
[Xtr Xte Ytr Yte] = splitData(X,y, .75);