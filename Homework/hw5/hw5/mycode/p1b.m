iris = load('data/iris.txt');
X = iris(:,1:2); Y = iris(:,end);
XA = X(Y<2,:); YA = Y(Y<2);

K = 5;
[z c s] = kmeans(XA,K, 'k++');
crule = knnClassify( c, (1:K)', 1);
plotClassify2D(crule, XA, z);
hold on;
plot(c(:,1), c(:,2), 'xk', 'MarkerSize', 12);