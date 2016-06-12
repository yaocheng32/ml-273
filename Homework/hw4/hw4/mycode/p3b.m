rand('state',0); randn('state',0);
data = load('data/spambase.data');
X = data(:,1:57); Y=data(:,end);
[X,Y] = shuffleData(X,Y);
[Xt,Xv,Yt,Yv] = splitData(X,Y,.6);
[Xt,S] = rescale(Xt); Xv = rescale(Xv,S);

depths = 1:70;
terror = zeros(size(depths));
verror = zeros(size(depths));
min_error = -1;
min_depth = 0;
for i=1:size(depths,2),
    d = depths(i);
    learner = treeClassify(Xt, Yt, 2, d);
    terror(i) = err(learner, Xt, Yt);
    verror(i) = err(learner, Xv, Yv);
    if (verror(i) < min_error || min_error == -1),
        min_error = verror(i);
        min_depth = d;
    end
    if (mod(i, 5) == 0),
        plot(depths(1:i), terror(1:i), '-g', depths(1:i), verror(1:i), '-r');
        legend('Training data', 'Validation data');
        drawnow;
    end
end
min_depth
min_error