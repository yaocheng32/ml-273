iris = load('data/iris.txt');
X = iris(:,1:2); Y = iris(:,end);
XA = X(Y<2,:); YA = Y(Y<2);

% X = quadprog(H,f,A,b) attempts to solve the quadratic programming 
%     problem: 
%              min 0.5*x'*H*x + f'*x   subject to:  A*x <= b 
%               x   

[YAA, obj.classes] = toIndex(YA);
YAA = 2*YAA - 3;

H = eye(3,3);
H(1,1) = 0;
f = zeros(3,1);
A = -repmat(YAA, [1,3]).*[ones(size(XA,1),1), XA];
b = -ones(size(XA,1),1);
opts = optimset('Algorithm','interior-point-convex','Display','iter');

[theta,fval,exitflag,output,lambda] = quadprog(H,f,A,b,[],[],[],[],[],opts);
learner = perceptClassify(XA, YA, 0, 0);
learner = setWeights(learner, theta');
plotClassify2D(learner, XA, YA);