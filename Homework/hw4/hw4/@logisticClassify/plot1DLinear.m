function plot1DLinear(obj, Xtrain, Ytrain)
% plot1DLinear(obj, Xtrain,Ytrain) 
%  plot a linear classifier when training features Xtrain are univariate
%  wts = length-2 vector; yhat = logit(wts(1) + wts(2)*X)
%
  [n,d] = size(Xtrain);
  if (d~=1) error('Sorry -- plot1DLinear only works on 1D data...'); end;
  xplt = linspace(min(Xtrain), max(Xtrain), 200)';
  xplt1 = [1+0*xplt xplt];
  c0 = find(Ytrain==0); c1=find(Ytrain==1);
  d1 = plot(Xtrain(c0),Ytrain(c0),'bo');
  hold on;
  d2 = plot(Xtrain(c1),Ytrain(c1),'gs');
  hold on;
  %d3 = plot(xplt,min(1,max(-0,xplt1*obj.wts')),'r-');
  d3 = plot(xplt,xplt1*obj.wts','r-');
  hold on;
  d4 = plot(xplt,sigmoid(xplt1*obj.wts'),'m-');
  legend([d3 d4], {'Linear response', 'Logistic probability'});
  ylim([-0.5 1.5]);
  hold off;
