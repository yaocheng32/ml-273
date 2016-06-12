iris = load('data/iris.txt');
X = iris(:,1:2); Y = iris(:,end);
XA = X(Y<2,:); YA = Y(Y<2);

% X = quadprog(H,f,A,b) attempts to solve the quadratic programming 
%     problem: 
%              min 0.5*x'*H*x + f'*x   subject to:  A*x <= b 
%               x   

[m n] = size(XA);
[YAA, obj.classes] = toIndex(YA);
YAA = 2*YAA - 3;

K = XA * XA';
H = YAA * YAA' .* K;
f = -ones(1,m);
A = -eye(m,m);
b = zeros(m,1);
Aeq = YAA';
Beq = 0;
opts = optimset('Algorithm','interior-point-convex','Display','iter');

alpha = quadprog(H,f,A,b,Aeq,Beq,[],[],[],opts);
ind = find(alpha>0.00001);
sv = alpha(ind);
theta = (alpha .* YAA)' * XA;
b = 1.0 / size(sv, 1) * ones(1, size(sv,1)) * (YAA(ind) - XA(ind,:)*theta');
theta = [b theta];
learner = perceptClassify(XA, YA, 0, 0);
learner = setWeights(learner, theta);
plotClassify2D(learner, XA, YA);
hold on;
plot(XA(ind,1), XA(ind,2), 'og', 'MarkerSize', 16, 'LineWidth', 2);