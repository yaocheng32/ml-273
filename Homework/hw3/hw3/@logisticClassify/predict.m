function Yte = predict(obj,Xte)
% predict(obj,Xtest) : predict output classes on test data

  [n,d] = size(Xte);            % d = dimension of data; n = number of training data
  Xte1= [ones(n,1), Xte]; 
  Yte = (sigmoid(Xte1*obj.wts') >= 0.5);

