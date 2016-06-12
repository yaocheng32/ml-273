function obj = logisticClassify(Xtr,Ytr, varargin)
% logisticClassify( [X,Y,...] ) : create a perceptron classifier and optionally call "train"
  obj.wts=[];         % linear weights on features (1st weight is constant term)
  obj.classes=[];     % list of class values used in input
  obj=class(obj,'logisticClassify');
  if (nargin > 0) 
    obj=train(obj,Xtr,Ytr, varargin{:});
  end;
end

