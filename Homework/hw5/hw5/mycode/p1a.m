iris = load('data/iris.txt');
X = iris(:,1:2); Y = iris(:,end);
XA = X(Y<2,:); YA = Y(Y<2);

plot(XA(Y==0,1), XA(Y==0,2), 'ob');
hold on;
plot(XA(Y==1,1), XA(Y==1,2), 'or');