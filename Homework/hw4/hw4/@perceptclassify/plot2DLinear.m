function plot2DLinear(obj, Xtrain, Ytrain)
% plot2DLinear(obj, Xtrain,Ytrain)
%   plot a linear classifier (data and decision boundary) when features Xtrain are 2-dim
%   wts are 1x3,  wts(0)+wts(2)*X(1)+wts(3)*X(2)
%
  [n,d] = size(Xtrain);
  if (d~=2) error('Sorry -- plot2DLinear only works on 2D data...'); end;
  
  xplt = linspace(min(Xtrain(:,1)), max(Xtrain(:,1)), 200)';
  wts = obj.wts;  % parameters of the linear classifier:
  % yhat = sign(  wts(1) + x1 * wts(2) + x2 * wts(3) )

  % TODO: Plot each class in a different color
  %   along with the linear decision boundary of the predictor
  mywts = wts;
  if (mywts(3) ~= 0),
      mywts = (-1) * mywts ./ mywts(3);
  end
  c0 = find(Ytrain==-1);
  c1 = find(Ytrain==1);
  plot(Xtrain(c0,1), Xtrain(c0,2), 'bo', ...
       Xtrain(c1,1), Xtrain(c1,2), 'gs', ...
       xplt, mywts(1)+mywts(2)*xplt, 'r-');

  drawnow;  % ensures plot is updated immediately 

