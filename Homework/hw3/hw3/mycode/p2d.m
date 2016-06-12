Xp = XA;
Yp = YA;
% Mapping y values to 1 and -1
[Ymap, classes] = toIndex(Yp);
Ymap = 2*Ymap-3;

lr = linearRegress(Xp, Ymap);
pc = perceptClassify(Xp, Yp, .01, 1);
pc = setWeights(pc, getWeights(lr));
err(pc, Xp, Yp)