mcycle = load('data/mcycle80.txt'); y=mcycle(:,end); X=mcycle(:,1:end-1);
[X y] = shuffleData(X,y); % shuffle data randomly to avoid pathologica
[Xtr Xte Ytr Yte] = splitData(X,y, .75); % split data into 75/25 train/test