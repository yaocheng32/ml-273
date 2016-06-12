XAP = fpoly(XA, 3, false);
[XAP, M, S] = rescale(XAP);
lc = logisticClassify(XAP, YA, 50, .00001, 0, 200);
transform = @(x) rescale(fpoly(x,3,false), M, S);
fig(2);
plotClassify2D(lc, XA, YA, transform);

XBP = fpoly(XB, 3, false);
[XBP, M, S] = rescale(XBP);
[YBi classes] = toIndex(YB);
YBi = YBi - 1;
% lc = logisticClassify(XBP, YBi, 10);
% transform = @(x) rescale(fpoly(x,3,false), M, S);
% fig(2);
% plotClassify2D(lc, XB, YBi, transform);