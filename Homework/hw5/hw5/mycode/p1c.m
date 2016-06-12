iris = load('data/iris.txt');
X = iris(:,1:2); Y = iris(:,end);
XA = X(Y<2,:); YA = Y(Y<2);

K = 20;
[z join] = agglomCluster(XA,K,'max');
plotClassify2D([], XA, z);