iris=load('data/iris.txt');     % load the text file
X = iris(:,1:2); Y=iris(:,end); % get first two features
XA = X(Y<2,:); YA=Y(Y<2);       % get class 0 vs 1
XB = X(Y>0,:); YB=Y(Y>0);       % get class 1 vs 2

figure();
plot(XA(YA==0,1), XA(YA==0,2), 'og', XA(YA==1,1), XA(YA==1,2), 'or');
title('Class 0 vs 1');
figure();
plot(XB(YB==1,1), XB(YB==1,2), 'og', XB(YB==2,1), XB(YB==2,2), 'or');
title('Class 1 vs 2');