lc = logisticClassify(XA, YA, 50, .00001, 0, 200);

[YBi classes] = toIndex(YB);
YBi = YBi - 1;
%lc = logisticClassify(XB, YBi, 100);