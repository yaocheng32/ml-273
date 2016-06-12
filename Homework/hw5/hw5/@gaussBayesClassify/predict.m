function Yte = predict(obj,Xte)
% Yhat = predict(obj,Xtest) : make predictions on test data with the classifier

  p = predictSoft(obj,Xte);
  [tmp,c] = max(p,[],2);                   % find the index of the largest probability
  Yte = obj.classes(c);                    % and return that class ID
end


% Gaussian evaluation function
function p = evalGaussian( X , gMean, gCov )
  d = size(X,2); n = size(X,1);               % get dimension and # of data
  p = zeros(n,1);                             % store evaluated probabilities for each datum
  constant = 1/(2*pi)^(d/2) / det(gCov)^(.5); % normalization constant for Gaussian
  invCov = inv(gCov);                         % need inverse covariance
  %for i=1:size(X,1),                          % compute probability of Gaussian at each point
  %  p(i) = exp(-.5 * (X(i,:)-gMean)*invCov*(X(i,:)-gMean)' ) * constant; 
  %end;
  R = X - repmat(gMean,[n,1]);                % compute probability of Gaussian at each point
  p = exp(-.5 *  sum( (R*invCov).*R ,2)) *constant;  % (vectorized)
end
