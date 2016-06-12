rand('state',0); randn('state',0);
data = load('data/spambase.data');
X = data(:,1:57); Y=data(:,end);
[X,Y] = shuffleData(X,Y);
[Xt,Xv,Yt,Yv] = splitData(X,Y,.6);
[Xt,S] = rescale(Xt); Xv = rescale(Xv,S);

nuseds = ceil(logspace(log10(0.1*size(Xt,1)), log10(size(Xt,1)),100));
nbag = 25;
terror = zeros(size(nbags));
verror = zeros(size(nbags));
min_error = -1;
min_nused = 0;

for j=1:size(nuseds,2),
    nused = nuseds(j);
    clfs = cell(1, nbag);
    for i=1:nbag,
        [Xi Yi] = bootstrapData(Xt, Yt, nused);
        learner = treeClassify(Xi, Yi, 2, 17);
        clfs{i} = learner;
    end
    
    predicts = zeros(size(Xt,1), nbag);
    for i=1:nbag,
        predicts(:,i) = predict(clfs{i}, Xt);
    end
    predicts = (mean(predicts,2) > 0.5);
    terror(j) = mean(predicts ~= Yt);
    
    predicts = zeros(size(Xv,1), nbag);
    for i=1:nbag,
        predicts(:,i) = predict(clfs{i}, Xv);
    end
    predicts = (mean(predicts,2) > 0.5);
    verror(j) = mean(predicts ~= Yv);
    
    
    if (verror(j) < min_error || min_error == -1),
        min_error = verror(j);
        min_nused = nused;
    end
    
    if (mod(j, 5) == 0),
        plot(nuseds(1:j), terror(1:j), '-g', nuseds(1:j), verror(1:j), '-r');
        legend('Training data', 'Validation data');
        drawnow;
    end
end
min_error
min_nused