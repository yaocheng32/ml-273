function obj = train(obj, Xtrain, Ytrain, stepsize, tol, reg, maxiter)
% obj = train(obj, Xtrain, Ytrain, stepsize, maxSteps)
%     Xtrain = [n x d] training data features (constant feature not included)
%     Ytrain = [n x 1] training data classes (binary, e.g., 0 or 1)
%     stepsize = step size for gradient descent ("learning rate")
%     maxSteps = maximum number of steps before stopping
%
if (nargin < 7) maxiter = 5000; end;
if (nargin < 6) reg = 0;  end;  % max number of iterations
if (nargin < 5) tol = .00001; end;
if (nargin < 4) stepsize = .01;   end;  % gradient descent step size

plotFlag = 1;                    % with plotting

[n,d] = size(Xtrain);            % d = dimension of data; n = number of training data
Xtrain1= [ones(n,1), Xtrain];    % make a version of training data with the constant feature

% Note: Y values need to be 0 or 1

obj.wts = randn(1,d+1);          % initialize weights randomly

% Outer loop of stochastic gradient descent:
iter=1;                          % iteration #
done=0;                          % end of loop flag
err=[];           % misclassification rate values
lastJ = 0;
loss=[];
while (~done) 
  % Step size evolution
  stepi = stepsize / iter;              

  % Stochastic gradient update (one pass)
  for i=1:n,  % for each data example,
    x = Xtrain1(i,:);
    y = Ytrain(i);
    grad = 1 / n * x * (sigmoid(x*obj.wts') - y) + 2 * reg * obj.wts;
    obj.wts = obj.wts - stepi * grad;
  end;

  % Compute current error values
  err = [err mean( (Ytrain~=(sigmoid(Xtrain1*obj.wts') >= 0.5)) )]; % misclassification rate
  J = loglikelihood(Xtrain1, Ytrain, obj.wts, reg);
  %J
  loss = [loss J];
  
  % Make plots, if desired
  if (plotFlag),
  fig(1); plot(1:iter, err(1:iter),'g-'); title('Error rate');
  fig(2); switch d,                              % Plots to help with visualization
      case 1, plot1DLinear(obj,Xtrain,Ytrain);      %  for 1D data we can display the data and the function
      case 2, plot2DLinear(obj,Xtrain,Ytrain);      %  for 2D data, just the data and decision boundary
      otherwise, % no plot for higher dimensions... %  higher dimensions visualization is hard
    end;
  fig(3); plot(1:iter, loss(1:iter), 'g-'); title('J(theta)');
  drawnow;
  end;


  if (iter > 1),
      done = (abs(lastJ-J)/lastJ < tol || iter > maxiter);
  end
  lastJ = J;
  iter = iter + 1;
end;




